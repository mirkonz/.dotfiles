#!/bin/zsh

# ANSI color codes for enhancing the script's display
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Global associative array to store conversion options
typeset -A conversion_options

# Global variable to store the parsed JSON data
global_json_data=""

# Global variables to store user selections
selected_title=""
selected_audio_tracks=""

# Function to strip single quotes from input paths
strip_quotes() {
  echo "${1//\'}"
}

# Function to simplify yes/no input with defaulting to "y"
confirm() {
  local prompt="$1"
  local default="${2:-y}"

  if [[ "$default" == "y" ]]; then
    read "response?$prompt (Y/n): "
  else
    read "response?$prompt (y/N): "
  fi

  case "$response" in
    [nN]) echo "no" ;;
    *) echo "yes" ;;
  esac
}

# Function to adjust conversion options using numbered inputs with defaults
adjust_conversion_options() {
  echo "${CYAN}Answer the following questions about the video quality.${NC}"

  # Lighting (with none as default)
  echo "1) How would you like to adjust the lighting? (Default: 1 - None)"
  echo "   1. None"
  echo "   2. Slightly brighten"
  echo "   3. Brighten"
  echo "   4. Darken"
  echo "   5. Slightly darken"
  read "lighting?Select an option (1-5) [1]: "
  lighting="${lighting:-1}"
  case $lighting in
    1) conversion_options[light_filter]="" ;;
    2) conversion_options[light_filter]="--chroma-smooth=light" ;;
    3) conversion_options[light_filter]="--chroma-smooth=medium" ;;
    4) conversion_options[light_filter]="--chroma-smooth=strong" ;;
    5) conversion_options[light_filter]="--chroma-smooth=verystrong" ;;
  esac

  # Saturation (with none as default)
  echo "2) How saturated are the colors? (Default: 1 - None)"
  echo "   1. None"
  echo "   2. Slightly dull"
  echo "   3. Very dull"
  echo "   4. Slightly oversaturated"
  echo "   5. Oversaturated"
  read "saturation?Select an option (1-5) [1]: "
  saturation="${saturation:-1}"
  case $saturation in
    1) conversion_options[saturation]="" ;;
    2) conversion_options[saturation]="--chroma-smooth=light" ;;
    3) conversion_options[saturation]="--chroma-smooth=medium" ;;
    4) conversion_options[saturation]="--lapsharp=light" ;;
    5) conversion_options[saturation]="--lapsharp=strong" ;;
  esac

  # Denoise (with none as default)
  echo "3) How would you like to handle noise in the video? (Default: 1 - None)"
  echo "   1. None"
  echo "   2. Light denoise"
  echo "   3. Medium denoise"
  echo "   4. Strong denoise"
  echo "   5. NLMeans denoise"
  read "denoise?Select an option (1-5) [1]: "
  denoise="${denoise:-1}"
  case $denoise in
    1) conversion_options[denoise_filter]="" ;;
    2) conversion_options[denoise_filter]="--hqdn3d=light" ;;
    3) conversion_options[denoise_filter]="--hqdn3d=medium" ;;
    4) conversion_options[denoise_filter]="--hqdn3d=strong" ;;
    5) conversion_options[denoise_filter]="--nlmeans=medium" ;;
  esac

  # Sharpness (with none as default)
  echo "4) How would you like to handle sharpness? (Default: 1 - None)"
  echo "   1. None"
  echo "   2. Slightly sharpen"
  echo "   3. Sharpen"
  echo "   4. Strong sharpen"
  read "sharpness?Select an option (1-4) [1]: "
  sharpness="${sharpness:-1}"
  case $sharpness in
    1) conversion_options[lapsharp]="" ;;
    2) conversion_options[lapsharp]="--lapsharp=light" ;;
    3) conversion_options[lapsharp]="--lapsharp=medium" ;;
    4) conversion_options[lapsharp]="--lapsharp=strong" ;;
  esac

  # Deblock (with none as default)
  echo "5) How strong are the visual artifacts? (Default: 1 - None)"
  echo "   1. None"
  echo "   2. Light"
  echo "   3. Medium"
  echo "   4. Strong"
  read "deblock?Select an option (1-4) [1]: "
  deblock="${deblock:-1}"
  case $deblock in
    1) conversion_options[deblock]="" ;;
    2) conversion_options[deblock]="--deblock=light" ;;
    3) conversion_options[deblock]="--deblock=medium" ;;
    4) conversion_options[deblock]="--deblock=strong" ;;
  esac

  # Resolution input (default to 1920x1080)
  echo "6) What resolution would you like for the output? (Default: 1920x1080)"
  echo "   Example: 1280x720, 1920x1080"
  read "resolution?Enter resolution [1920x1080]: "
  if [[ -z "$resolution" ]]; then
    resolution="1920x1080"
  fi

  # Split the resolution to extract width and height
  conversion_options[resolution_width]=$(echo "$resolution" | cut -d'x' -f1)
  conversion_options[resolution_height]=$(echo "$resolution" | cut -d'x' -f2)

  # Quality setting (default to 22)
  echo "7) What quality level would you like to use? (Default: 22)"
  echo "   Lower values produce higher quality and larger files, higher values reduce quality but reduce file size."
  echo "   Example: 18 for very high quality, 22 for standard, 28 for lower quality."
  read "quality?Enter a value between 18 and 28 [22]: "
  quality="${quality:-22}"
  conversion_options[quality]="--quality=$quality"

  # Encoder (with x265 as default)
  echo "8) What encoder would you like to use? (Default: 1 - x265)"
  echo "   1. x265"
  echo "   2. x264"
  read "encoder?Select an option (1-2) [1]: "
  encoder="${encoder:-1}"
  case $encoder in
    1) conversion_options[encoder]="--encoder=x265" ;;
    2) conversion_options[encoder]="--encoder=x264" ;;
  esac
}

# Function to scan DVD and get the JSON data, storing it globally
scan_dvd() {
  local input="$1"

  # Print scanning message immediately, force output flush
  echo -e "${YELLOW}Scanning titles and audio tracks for DVD at \"$input\"...${NC}" >&2

  # Run HandBrakeCLI to get JSON output
  global_json_data=$(HandBrakeCLI -i "$input" -t 0 --json 2>&1 | sed -n '/JSON Title Set:/,$p' | sed 's/JSON Title Set: //')

  if [[ -z "$global_json_data" ]]; then
    echo "${RED}Error: Failed to scan DVD. No data received.${NC}"
    exit 1
  fi
}

# Function to select a title based on global JSON data
select_title() {
  local title_count=$(echo "$global_json_data" | jq '.TitleList | length')
  local main_feature=$(echo "$global_json_data" | jq '.MainFeature')

  echo "${YELLOW}Detected a DVD with $title_count titles.${NC}"

  if [[ "$title_count" == "1" ]]; then
    selected_title="$main_feature"
    echo "Only one title found. Automatically selecting Title $selected_title."
  else
    # Show titles and let the user choose
    echo "Available titles:"
    for idx in $(seq 0 $((title_count - 1))); do
      title_name=$(echo "$global_json_data" | jq -r ".TitleList[$idx].Name")
      duration=$(echo "$global_json_data" | jq -r ".TitleList[$idx].Duration | \"\(.Hours)h \(.Minutes)m \(.Seconds)s\"")
      echo "$((idx + 1)). $title_name - Duration: $duration"
    done

    read "title_selection?Enter the title number you want to convert (default: $main_feature): "
    title_selection="${title_selection:-$main_feature}"
    selected_title="$title_selection"
    echo "Selected Title: $selected_title"
  fi
}

# Function to select audio tracks for the selected title
select_audio_tracks() {
  local title_idx=$((selected_title - 1))
  local audio_count=$(echo "$global_json_data" | jq ".TitleList[$title_idx].AudioList | length")

  if [[ "$audio_count" -gt 0 ]]; then
    echo "${CYAN}Detected the following audio tracks for Title $selected_title:${NC}"

    # List available audio tracks
    for idx in $(seq 0 $((audio_count - 1))); do
      track_desc=$(echo "$global_json_data" | jq -r ".TitleList[$title_idx].AudioList[$idx].Description")
      echo "$((idx + 1)). $track_desc"
    done

    read "audio_selection?Enter the audio track number(s) you want to include for Title $selected_title, separated by commas [1]: "
    selected_audio_tracks="${audio_selection:-1}"  # Default to the first track if no input
    echo "${YELLOW}Selected audio tracks for Title $selected_title: $selected_audio_tracks${NC}"
  else
    echo "${RED}No audio tracks detected for Title $selected_title.${NC}"
  fi
}

# Function to offer deletion of VIDEO_TS and AUDIO_TS directories
offer_deletion() {
  local parent_dir="$1"
  local video_ts="$parent_dir/VIDEO_TS"
  local audio_ts="$parent_dir/AUDIO_TS"

  # Check if either VIDEO_TS or AUDIO_TS exists
  if [[ -d "$video_ts" || -d "$audio_ts" ]]; then
    if [[ $(confirm "Do you want to delete the VIDEO_TS and/or AUDIO_TS directories?") == "yes" ]]; then
      [[ -d "$video_ts" ]] && rm -rf "$video_ts" && echo "${GREEN}Deleted VIDEO_TS directory.${NC}"
      [[ -d "$audio_ts" ]] && rm -rf "$audio_ts" && echo "${GREEN}Deleted AUDIO_TS directory.${NC}"
    else
      echo "${CYAN}Skipped deletion of VIDEO_TS and AUDIO_TS directories.${NC}"
    fi
  fi
}

# Function to convert a DVD or video file to MKV
convert_dvd_or_file() {
  local input="$1"
  local output_location="$2"
  local output_name="$3"

  # Full output path
  local output_path="${output_location}/${output_name}.mkv"

  # Ensure output_path is properly constructed
  if [[ -z "$output_path" || "$output_path" == "/" ]]; then
    echo "${RED}Error: Output path is invalid. Using default movie folder filename.${NC}"
    output_path="${default_output_location}/output.mkv"
  fi

  # Prepare HandBrakeCLI options
  local handbrake_options=(
    "${conversion_options[encoder]}"
    "${conversion_options[quality]}"
    "${conversion_options[light_filter]}"
    "${conversion_options[saturation]}"
    "${conversion_options[denoise_filter]}"
    "${conversion_options[lapsharp]}"
    "${conversion_options[deblock]}"
    "--maxWidth=${conversion_options[resolution_width]}"
    "--maxHeight=${conversion_options[resolution_height]}"
  )

  # Run HandBrakeCLI command using the options from the global associative array
  echo "${CYAN}Converting Title $selected_title from \"$input\" to \"$output_path\"...${NC}"
  HandBrakeCLI -i "$input" \
    -o "$output_path" \
    -t "$selected_title" \
    -a "$selected_audio_tracks" \
    "${handbrake_options[@]}" \
    --decomb --detelecine

  # Check if HandBrakeCLI was successful
  if [[ $? -eq 0 ]]; then
    echo "${GREEN}Conversion completed: \"$output_path\"${NC}"
    offer_deletion "$(dirname "$input")"  # Offer deletion of VIDEO_TS/AUDIO_TS
  else
    echo "${RED}Error: Conversion failed.${NC}"
  fi
}

# Function to set output file name and ensure no empty value is used
set_output_name() {
  local input="$1"
  local title="$2"

  # If input is a DVD folder (VIDEO_TS), set the name based on parent folder
  if [[ "$(basename "$input")" == "VIDEO_TS" ]]; then
    output_name=$(basename "$(dirname "$input")")  # Get parent folder of VIDEO_TS
  else
    output_name=$(basename "$input")
    output_name="${output_name%.*}"  # Remove extension for files
  fi

  # Ensure output_name does not have an empty value
  if [[ -z "$output_name" ]]; then
    output_name="output"  # Default to "output" if something goes wrong
  fi

  # Replace spaces with underscores for output name
  output_name=$(echo "$output_name" | tr ' ' '_')

  echo "$output_name"  # Return the correctly formatted output name
}

# Get the movie folder or file location from the user
read "input?Enter the movie folder or file location (e.g., /path/to/VIDEO_TS or /path/to/movie.mp4): "
input=$(strip_quotes "$input")
input=$(realpath "$input")  # Resolve the absolute path

# Ask if the user wants to scan titles and audio tracks
if [[ $(confirm "Would you like to scan the DVD for titles and audio tracks?" "y") == "yes" ]]; then
  # Scan the DVD and store the JSON output globally
  scan_dvd "$input"

  # Select a title based on the global JSON data
  select_title

  # Select audio tracks for the selected title
  select_audio_tracks
else
  # Ask the user to manually input title and audio tracks
  read "selected_title?Enter the title number you want to convert [1]: "
  selected_title="${selected_title:-1}"
  read "selected_audio_tracks?Enter the audio track number(s) you want to include, separated by commas [1]: "
  selected_audio_tracks="${selected_audio_tracks:-1}"
fi

# Ask the user simple questions with numbered options to adjust conversion settings
adjust_conversion_options

# Default output location to source location
default_output_location=$(dirname "$input")
read "output_location?Enter the output folder location [$default_output_location]: "
output_location="${output_location:-$default_output_location}"
output_location=$(strip_quotes "$output_location")

# Set the default output name based on the input (DVD or file)
default_output_name=$(set_output_name "$input" "$selected_title")

# Ask for the output name and default to current
read "output_name?Enter the output file name (without extension) [${default_output_name}]: "
output_name="${output_name:-$default_output_name}"

# Call the conversion function with the selected title and audio tracks
convert_dvd_or_file "$input" "$output_location" "$output_name"
#!/bin/zsh

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check if ffmpeg and ImageMagick (convert) are installed
if ! command_exists ffmpeg; then
    echo "Error: ffmpeg is not installed. Please install it and try again."
    exit 1
fi

if ! command_exists convert; then
    echo "Error: ImageMagick (convert) is not installed. Please install it and try again."
    exit 1
fi

# Get the input file path from the user
echo "Enter the movie file path: "
read inputPath

# Set default location to Downloads folder
echo "Enter the output location (default: ~/Downloads): "
read outputPath
outputPath="${outputPath:-~/Downloads}"

# Check if the movie file exists, ensuring proper handling of spaces and special characters
if [ ! -f "$inputPath" ]; then
    echo "Error: Movie file not found at '$inputPath'. Please check the path."
    exit 1
fi

# Ask for the final image resolution width, defaulting to 3400 px wide
echo "Enter the final image width (default: 3400): "
read targetWidth
targetWidth="${targetWidth:-3400}"

# Ask for the final image resolution height, defaulting to 400 px high
echo "Enter the final image height (default: 400): "
read targetHeight
targetHeight="${targetHeight:-400}"

# Get the movie's filename without the extension
movieName=$(basename "$inputPath")
movieName="${movieName%.*}"

# Clean up the movie name by removing text within any brackets (), [], {}
cleanedMovieName=$(echo "$movieName" | sed 's/[(].*[)]//g' | sed 's/\[.*\]//g' | sed 's/{.*}//g')

# Append "-3400x400.movie-barcode" before the extension, using the provided width and height
cleanedMovieName="${cleanedMovieName}-${targetWidth}x${targetHeight}.movie-barcode.png"

# Replace spaces with dashes, convert to lowercase, and remove consecutive dashes
finalFileName=$(echo "$cleanedMovieName" | tr ' ' '-' | tr '[:upper:]' '[:lower:]' | sed 's/--*/-/g')

# Create a temporary folder for the images
tempDir=$(mktemp -d)

# Trap to clean up the temp directory in case the script is killed
cleanup() {
    echo "Cleaning up temporary files..."
    rm -rf "$tempDir"
    exit 1
}

trap cleanup EXIT INT TERM

# Get the movie duration in seconds using ffmpeg
movieDuration=$(ffmpeg -i "$inputPath" 2>&1 | grep "Duration" | awk '{print $2}' | tr -d , | awk -F: '{ print ($1 * 3600) + ($2 * 60) + $3 }')

# Calculate the frame extraction rate (one frame per X seconds)
frameExtractionRate=$(echo "$movieDuration / $targetWidth" | bc -l)

echo "Movie duration: $movieDuration seconds"
echo "Target width: $targetWidth pixels"
echo "Extracting one frame every $frameExtractionRate seconds"

# Extract frames at 1x1 pixel resolution to get the average color of each frame
ffmpeg -i "$inputPath" -vf "scale=1:1" -r 1/"$frameExtractionRate" "$tempDir/%06d.png" -v 0

# Combine all the 1x1 pixel images into one wide image (e.g., 3400 pixels wide)
outputFile="$outputPath/$finalFileName"
convert +append "$tempDir/"*.png "$outputFile"

# Resize the final wide image to the target height (e.g., 400px) while keeping the width intact
convert "$outputFile" -resize "${targetWidth}x${targetHeight}!" "$outputFile"

# Clean up the temporary folder
rm -rf "$tempDir"

echo "Movie barcode created and saved to $outputFile"
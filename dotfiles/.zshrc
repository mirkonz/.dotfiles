# ANTIGEN_CACHE=false
source $(brew --prefix)/share/antigen/antigen.zsh

################################################################
# Antigen
################################################################

antigen use oh-my-zsh

antigen bundle brew
antigen bundle brew-cask
antigen bundle common-aliases
antigen bundle composer
antigen bundle docker
antigen bundle docker-compose
antigen bundle gem
antigen bundle git
antigen bundle npm
antigen bundle nvm
antigen bundle rbenv
antigen bundle z

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting

antigen bundle ael-code/zsh-colored-man-pages
antigen bundle akoenig/npm-run.plugin.zsh
antigen bundle chrissicool/zsh-256color
antigen bundle desyncr/auto-ls
antigen bundle djui/alias-tips
antigen bundle felixr/docker-zsh-completion
antigen bundle horosgrisa/zsh-dropbox
antigen bundle jhipster/jhipster-oh-my-zsh-plugin
antigen bundle littleq0903/gcloud-zsh-completion
antigen bundle lukechilds/zsh-better-npm-completion
antigen bundle paulmelnikow/zsh-startup-timer
antigen bundle unixorn/autoupdate-antigen.zshplugin
antigen bundle unixorn/rake-completion.zshplugin
antigen bundle vasyharan/zsh-brew-services
antigen bundle wbingli/zsh-wakatime

antigen bundle iam4x/zsh-iterm-touchbar

AUTO_LS_COMMANDS=(custom_function)
auto-ls-custom_function () {
    colorls -lA --sd --gs --report
}

POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=''
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=''
POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=''
POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=''
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{blue}\u256D\u2500%F{white}"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{blue}\u2570\uf460%F{white} "
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon root_indicator dir dir_writable_joined vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(nvm node_version nodeenv php_version rbenv command_execution_time background_jobs_joined time_joined)
POWERLEVEL9K_NODE_VERSION_FOREGROUND="black"
POWERLEVEL9K_OS_ICON_BACKGROUND="clear"
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="clear"
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND="clear"
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND="yellow"
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND="yellow"
POWERLEVEL9K_DIR_HOME_BACKGROUND="clear"
POWERLEVEL9K_DIR_HOME_FOREGROUND="blue"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="clear"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="blue"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND="clear"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="red"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="clear"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="white"
POWERLEVEL9K_ROOT_INDICATOR_BACKGROUND="red"
POWERLEVEL9K_ROOT_INDICATOR_FOREGROUND="white"
POWERLEVEL9K_STATUS_OK_BACKGROUND="clear"
POWERLEVEL9K_STATUS_OK_FOREGROUND="green"
POWERLEVEL9K_STATUS_ERROR_BACKGROUND="clear"
POWERLEVEL9K_STATUS_ERROR_FOREGROUND="red"
POWERLEVEL9K_TIME_BACKGROUND="clear"
POWERLEVEL9K_TIME_FOREGROUND="cyan"
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='clear'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='magenta'
POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND='clear'
POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND='green'


antigen theme bhilburn/powerlevel9k powerlevel9k
antigen apply

# Autoload gcloud completion
fpath=($ANTIGEN_BUNDLES/littleq0903/gcloud-zsh-completion/src $fpath)
autoload -U compinit compdef
compinit

################################################################
# ZSH options
################################################################

export EDITOR="code"

export PATH=$HOME/bin:$PATH
export PATH=/bin:$PATH
export PATH=/sbin:$PATH
export PATH=/usr/bin:$PATH
export PATH=/usr/sbin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

export PATH=$HOME/.composer/vendor/bin:$PATH
export PATH=$(brew --prefix)/bin:$PATH
export PATH=$(brew --prefix homebrew/php/php70)/bin:$PATH

export ANT_HOME="/usr/local/opt/ant"
export MAVEN_HOME="/usr/local/opt/maven"
export GRADLE_HOME="/usr/local/opt/gradle"

export PATH=$ANT_HOME/bin:$PATH
export PATH=$MAVEN_HOME/bin:$PATH
export PATH=$GRADLE_HOME/bin:$PATH

# NVM NODE
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source $(brew --prefix nvm)/nvm.sh

# RUBY
eval "$(rbenv init -)"
# source "$(dirname $(gem which colorls))/tab_complete.sh"

source "${HOME}/.secrid_aliases"
source "${HOME}/.aliases"

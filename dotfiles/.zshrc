POWERLEVEL9K_INSTANT_PROMPT=off

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

# antigen theme iam4x/zsh-iterm-touchbar

# source "$HOME/.powerlevel9k"
# antigen theme bhilburn/powerlevel9k powerlevel9k

antigen theme romkatv/powerlevel10k

# source "$HOME/.spaceship"
# antigen theme denysdovhan/spaceship-zsh-theme --branch=3.0 spaceship

# ANTIGEN_LOG="$HOME/antigen.log"
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

export PATH=$HOME/Library/Python/2.7/bin:$PATH

export PATH=$(brew --prefix)/bin:$PATH


# NVM NODE
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source $(brew --prefix nvm)/nvm.sh

# RUBY
eval "$(rbenv init -)"
# source "$(dirname $(gem which colorls))/tab_complete.sh"


source "${HOME}/.aliases"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

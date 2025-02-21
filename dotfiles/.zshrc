# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH="$HOME/bin:$PATH"

# ANTIGEN_CACHE=false
source $(brew --prefix)/share/antigen/antigen.zsh

################################################################
# Antigen
################################################################

antigen use oh-my-zsh

antigen bundle brew
antigen bundle command-not-found
# antigen bundle common-aliases
antigen bundle docker
antigen bundle docker-compose
antigen bundle dotenv
antigen bundle gem
antigen bundle git
# antigen bundle gh
antigen bundle iterm2
antigen bundle npm
antigen bundle nvm
antigen bundle pyenv
antigen bundle rbenv
# antigen bundle tmux
antigen bundle z


antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting

# antigen bundle ael-code/zsh-colored-man-pages
# antigen bundle akoenig/npm-run.plugin.zsh
# antigen bundle chrissicool/zsh-256color
# antigen bundle djui/alias-tips
# antigen bundle felixr/docker-zsh-completion
# antigen bundle horosgrisa/zsh-dropbox
# antigen bundle jhipster/jhipster-oh-my-zsh-plugin
# antigen bundle littleq0903/gcloud-zsh-completion
# antigen bundle lukechilds/zsh-better-npm-completion
# antigen bundle paulmelnikow/zsh-startup-timer
# antigen bundle unixorn/autoupdate-antigen.zshplugin
# antigen bundle unixorn/rake-completion.zshplugin
# antigen bundle vasyharan/zsh-brew-services
# antigen bundle wbingli/zsh-wakatime

# antigen theme iam4x/zsh-iterm-touchbar

# source "$HOME/.powerlevel9k"
# antigen theme bhilburn/powerlevel9k powerlevel9k

antigen theme romkatv/powerlevel10k

# source "$HOME/.spaceship"
# antigen theme denysdovhan/spaceship-zsh-theme --branch=3.0 spaceship

# ANTIGEN_LOG="$HOME/antigen.log"
antigen apply

# Autoload gcloud completion
# fpath=($ANTIGEN_BUNDLES/littleq0903/gcloud-zsh-completion/src $fpath)
# autoload -U compinit compdef
# compinit

################################################################
# ZSH options
################################################################



# NVM NODE
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && \. "$(brew --prefix)/opt/nvm/nvm.sh"  # This loads nvm
[ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


autoload -U add-zsh-hook
load-nvmrc() {
    if [[ -f .nvmrc && -r .nvmrc ]]; then
        nvm use
        elif [[ $(nvm version) != $(nvm version default)  ]]; then
        echo "Reverting to nvm default version"
        nvm use default
    fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc


# RUBY
eval "$(rbenv init -)"
# source "$(dirname $(gem which colorls))/tab_complete.sh"

source "${HOME}/.aliases"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# pnpm
export PNPM_HOME="${HOME}/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

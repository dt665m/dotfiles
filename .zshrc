# zsh configuration
SAVEHIST=1000
HISTFILE=~/.zsh_history

export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
eval "$(brew shellenv)"

# import plugins
export ZSH="$(antibody home)/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh"
source ~/.zsh_plugins.sh

# Environment / Global Settings
export EDITOR=nvim
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin:/usr/local/bin
# Vim Mods https://dev.to/matrixersp/how-to-use-fzf-with-ripgrep-to-selectively-ignore-vcs-files-4e27 
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
source ~/.cargo/env

# shell completions
#source <(just --completions zsh)
source '/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
source <(kubectl completion zsh)
autoload -Uz compinit && compinit

# zsh functions and and homebrew package default completions
fpath=( 
    ~/.zfuncs 
    $HOMEBREW_PREFIX/share/zsh/site-functions
    "${fpath[@]}" 
)
autoload -Uz b64hex 
autoload -Uz cargo-build-remote 
autoload -Uz cp-agence-remote
autoload -Uz k8s-pod-bash 
autoload -Uz k8s-pod-forcedelete 

# key bindings for shell issues
bindkey "^[[1;3D" backward-word
bindkey "^[[1;3C" forward-word
# bindkey "^[a" beginning-of-line
# bindkey "^[e" end-of-line

# if [ "$OSTYPE" == "linux-gnu" ]; then
# elif [[ "$OSTYPE" == "darwin"* ]]; then
# else
# fi

# aliases
alias j='just'
alias cat='bat'
alias l='exa'
alias la='exa -a'
alias ll='exa -lah'
alias ls='exa --color=auto'
alias shfmt='shfmt -i 4'

# zfunc aliases
alias kpbash='k8s-pod-bash'
alias kpfd='k8s-pod-forcedelete'
alias cb-remote='cargo-build-remote'
eval "$(zoxide init zsh)"

# handle theme
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir go_version vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator history background_jobs ram load time)
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true

# Visual customisation of the second prompt line
# POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="╭"
# POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="╰\uF460\uF460\uF460 "
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%{%F{249}%}\u250f"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%{%F{249}%}\u2517\uf054%{%F{default}%} "

# POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%f"
#POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%{%B%F{black}%K{yellow}%} "$"%{%b%f%k%F{yellow}%} %{%f%}"
POWERLEVEL9K_MODE='nerdfont-complete'
source /opt/homebrew/opt/powerlevel9k/powerlevel9k.zsh-theme

export WASMTIME_HOME="$HOME/.wasmtime"
export PATH="$WASMTIME_HOME/bin:$PATH"
export PATH="$PATH:/Users/denis/.foundry/bin"

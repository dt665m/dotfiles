##### Environment ################################################################

export GPG_TTY=$(tty)
# export GOOGLE_PROJECT_ID=aetheras-restic
export GOOGLE_APPLICATION_CREDENTIALS="$HOME/.config/gcloud/application_default_credentials.json"

# Editors
export EDITOR=nvim
export KUBE_EDITOR=nvim

# Wasmtime
export WASMTIME_HOME="$HOME/.wasmtime"

##### History ####################################################################

HISTFILE="$HOME/.zsh_history"
SAVEHIST=10000
HISTSIZE=50000

setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_verify
setopt extended_glob
setopt inc_append_history
# setopt share_history   # enable only if you want interleaved history across shells

##### Homebrew (bootstrap early; absolute paths; idempotent) #####################

# Seed PATH first so brew is callable even if path_helper clobbered it.
if [[ -x /opt/homebrew/bin/brew ]]; then
  export HOMEBREW_PREFIX=/opt/homebrew
  path=( /opt/homebrew/bin /opt/homebrew/sbin $path )
  typeset -U path
  export PATH
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
  export HOMEBREW_PREFIX=/usr/local
  path=( /usr/local/bin /usr/local/sbin $path )
  typeset -U path
  export PATH
  eval "$(/usr/local/bin/brew shellenv)"
else
  unset HOMEBREW_PREFIX
  # Optional: echo a hint in interactive shells if brew isn’t installed yet.
  [[ -t 1 ]] && print -r -- "Homebrew not found (ok if install.sh will install it)."
fi

##### Load custom zsh snippets ####################################################

[[ -d $HOME/.zcustom ]] && for file in $HOME/.zcustom/*.zsh(.N); do source "$file"; done

##### Plugins (manual installs via Homebrew) #####################################

if [[ -n ${HOMEBREW_PREFIX:-} ]]; then
  # fzf
  FZF_HOME="$HOMEBREW_PREFIX/opt/fzf"
  [[ -r "$FZF_HOME/shell/completion.zsh" ]] && source "$FZF_HOME/shell/completion.zsh"
  [[ -r "$FZF_HOME/shell/key-bindings.zsh" ]] && source "$FZF_HOME/shell/key-bindings.zsh"

  # zsh-syntax-highlighting
  ZSH_HIGH_HOME="$HOMEBREW_PREFIX/share/zsh-syntax-highlighting"
  [[ -r "$ZSH_HIGH_HOME/zsh-syntax-highlighting.zsh" ]] && source "$ZSH_HIGH_HOME/zsh-syntax-highlighting.zsh"

  # zsh-autosuggestions
  ZSH_AUTO="$HOMEBREW_PREFIX/share/zsh-autosuggestions"
  [[ -r "$ZSH_AUTO/zsh-autosuggestions.zsh" ]] && source "$ZSH_AUTO/zsh-autosuggestions.zsh"
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=242"
fi

##### zfuncs (autoload everything in ~/.zfuncs) ##################################

fpath=("$HOME/.zfuncs" $fpath)
typeset -U fpath  # de-dupe fpath

# autoload every regular file in ~/.zfuncs
[[ -d $HOME/.zfuncs ]] && for f in $HOME/.zfuncs/*(.N:t); do autoload -Uz -- "$f"; done

##### Completions ################################################################

if [[ -n ${HOMEBREW_PREFIX:-} ]]; then
  fpath=("$HOMEBREW_PREFIX/share/zsh/site-functions" $fpath)
fi

zstyle ":completion:*" menu yes select
zstyle ":completion:*" matcher-list "" "m:{a-zA-Z}={A-Za-z}" "r:|=*" "l:|=* r:|=*"
autoload -Uz compinit && compinit

##### Google Cloud SDK ############################################################

if [[ -n ${HOMEBREW_PREFIX:-} ]]; then
  GCP="$HOMEBREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk"
  [[ -r "$GCP/path.zsh.inc" ]] && source "$GCP/path.zsh.inc"
  [[ -r "$GCP/completion.zsh.inc" ]] && source "$GCP/completion.zsh.inc"
fi

##### FZF + ripgrep defaults #####################################################

# Respect VCS ignore but include hidden (except .git), follow symlinks.
# Extra ignores (like excluding Cargo.lock) live in ~/.ripgreprc.
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"

##### Key bindings ################################################################

bindkey -e                      # emacs mode (no vim-mode)
bindkey "^ " autosuggest-accept

##### Aliases ####################################################################

alias g="git"
alias j="just"
alias cat="bat -pp --theme 'Visual Studio Dark+'"
alias catt="bat --theme 'Visual Studio Dark+'"
alias ls="eza --group-directories-first --icons=auto"
alias ll="ls -l --git"
alias la="ll -a"

# zfunc aliases
alias kpbash="k8s-pod-bash"
alias kpfd="k8s-pod-forcedelete"

# zoxide
command -v zoxide >/dev/null 2>&1 && eval "$(zoxide init zsh)"

##### Prompt (powerlevel10k) #####################################################

[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

##### PATH (use the array; de-dup; keep things tidy) #############################

path=(
  /opt/homebrew/opt/libpq/bin
  "$HOME/.local/bin"
  "$HOME/.foundry/bin"
  "$HOME/.opencode/bin"
  "$WASMTIME_HOME/bin"
  /Applications/Alacritty.app/Contents/MacOS   # temporary; GUI app bundle bin
  $path
)
typeset -U path
export PATH

##### Conda (lazy init to avoid heavy startup) ###################################

conda() {
  unset -f conda
  if [[ -r "/opt/homebrew/anaconda3/etc/profile.d/conda.sh" ]]; then
    . "/opt/homebrew/anaconda3/etc/profile.d/conda.sh"
  else
    export PATH="/opt/homebrew/anaconda3/bin:$PATH"
  fi
  conda "$@"
}

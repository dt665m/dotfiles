#!/bin/bash
set -e
ROOT_PATH=$(pwd -P)

main() {
  downloader --check
  get_arch
  ARCH="$RETVAL"

  echo "Select an option (Press ESC to quit):"
  echo "1) Install all"
  echo "2) Setup Git"
  echo "3) Install Homebrew"
  echo "4) Install Languages"
  echo "5) Install Shell"
  echo "6) Install Terminal"
  echo "7) Install Tools"
  echo "8) Install Neovim"
  echo "9) Uninstall Neovim"
  read -s -n1 choice

  case $choice in
  $'\e')
    info "Exiting..."
    exit 0
    ;;
  1)
    setup_git
    install_homebrew
    install_languages
    install_shell
    install_terminal
    install_tools
    install_neovim
    ;;
  2) setup_git ;;
  3) install_homebrew ;;
  4) install_languages ;;
  5) install_shell ;;
  6) install_terminal ;;
  7) install_tools ;;
  8) install_neovim ;;
  9) uninstall_neovim ;;
  *) log "Invalid choice" ;;
  esac
}

setup_git() {
  info "setting up git"
  git config --global alias.co checkout
  git config --global alias.br branch
  git config --global alias.com commit
  git config --global alias.st status
  git config --global credential.helper osxkeychain
  git config --global http.postBuffer 157286400

  # Updated git requires a way to resolve divergent, this makes it so divergent branch pulls
  # will only fast foward.  A diveragent branch will fail.  A normal thing to do is to pull a
  # into your working copy, such as "git pull origin master".  A divergence can occur if the
  # remote was force pushed with a missing ancestor from your local copy.
  git config --global pull.ff only

  if [ -z "$(git config --global --get user.email)" ]; then
    echo "Git user.name:"
    read -r user_name
    echo "Git user.email:"
    read -r user_email
    git config --global user.name "$user_name"
    git config --global user.email "$user_email"
  fi
}

install_homebrew() {
  if ! which /opt/homebrew/bin/brew >/dev/null 2>&1; then
    info "Installing homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  fi
  eval $(/opt/homebrew/bin/brew shellenv)
}

install_languages() {
  brew install go lua node nvm pnpm luarocks || true

  if ! which rustup >/dev/null 2>&1; then
    curl https://sh.rustup.rs -sSf | sh -s -- -y
    source ~/.cargo/env

    # Rust toolchains and commands
    rustup default stable
    rustup update nightly
    rustup component add clippy
    rustup target add \
      aarch64-apple-ios x86_64-apple-ios aarch64-apple-darwin \
      aarch64-linux-android armv7-linux-androideabi i686-linux-android \
      wasm32-wasi wasm32-unknown-unknown wasm32-unknown-unknown --toolchain nightly
  else
    rustup update
  fi

  # Rust specific tooling
  cargo install --locked cargo-remote cargo-wasi sccache cargo-about git-cliff
  cargo install --locked cargo-duplicates cargo-outdated

  # Custom global settings for sccache
  sym_link $ROOT_PATH/cargo-config.toml ~/.cargo/config.toml
}

install_shell() {
  # Settings for zsh plugins are in .zshrc
  brew install \
    zsh-syntax-highlighting zsh-autosuggestions \
    powerlevel10k \
    font-meslo-lg-nerd-font font-fira-code-nerd-font || true

  mkdir -p ~/.config
  sym_link $ROOT_PATH/zsh/.zshrc ~/.zshrc
  sym_link $ROOT_PATH/zsh/.zfuncs ~/.zfuncs
  sym_link $ROOT_PATH/zsh/.zcustom ~/.zcustom
  sym_link $ROOT_PATH/zsh/.ignore_global ~/.ignore_global
}

install_tools() {
  brew tap kdash-rs/kdash
  brew install \
    ripgrep fzf fd rg bat eza zoxide jq \
    zellij just grex kondo tokei gh lazygit \
    protobuf libpq google-cloud-sdk visual-studio-code \
    kubectl kubectx kdash helm || true

  # install google cloud components
  gcloud components install gke-gcloud-auth-plugin

  # # VsCode... legacy
  # mkdir -p ~/Library/Application\ Support/Code/User
  # cp -rf vscode/* ~/Library/Application\ Support/Code/User/

  sym_link $ROOT_PATH/zellij ~/.config/zellij
  #sym_link $ROOT_PATH/.tmux.conf ~/.tmux.conf
}

install_terminal() {
  # install alacritty terminal and terminfo
  brew install alacritty || true
  ensure downloader https://raw.githubusercontent.com/alacritty/alacritty/master/extra/alacritty.info /Applications/Alacritty.app/Contents/Resources/alacritty.info
  info "setting terminal tic, sudo required"
  sudo tic -xe alacritty,alacritty-direct /Applications/Alacritty.app/Contents/Resources/alacritty.info
  info "configuring terminal"
  sym_link $ROOT_PATH/.alacritty.toml ~/.alacritty.toml
  # if [[ $ARCH == *"darwin"* ]] || [[ $ARCH == *"arm64"* ]]; then
  #     info "macOs detected, 'open' alacritty in finder to seed permissions"
  #     open /Applications
  # fi
}

install_neovim() {
  brew install neovim || true
  info "configuring neovim"

  mkdir -p ~/.config
  sym_link $ROOT_PATH/lazyvim ~/.config/nvim
  # sym_link $ROOT_PATH/nvim ~/.config/nvim

  # nvim --headless +PlugInstall +PlugClean +PlugUpdate +UpdateRemotePlugins +qall
  # undo history path
  mkdir -p ~/.vimdid
}

uninstall_neovim() {
  rm -rf ~/.cache/nvim
  rm -rf ~/.local/share/nvim
}

## Utils

info() {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

ok() {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

err() {
  printf "\r\033[2K  [\033[0;31mERR\033[0m] $1\n"
  exit
}

ensure() {
  if ! "$@"; then err "command failed: $*"; fi
}

require() {
  if ! check_cmd "$1"; then
    err "need '$1' (command not found)"
  fi
}

check_cmd() {
  command -v "$1" >/dev/null 2>&1
}

append_not_exists() {
  if [ -f "$2" ] && grep -q "$1" "$2"; then
    info "PATH exists in \'$2\'"
    return
  fi

  info "\'$1\' >> \'$2\'"
  echo "$1" >>"$2"
}

sym_link() {
  if [ -L "$2" ]; then
    if [ "$(readlink "$2")" != "$1" ]; then
      rm "$2"
      info "Removed existing symlink $2"
    else
      info "Symlink already exists and points to the correct target: $1"
      return 0
    fi
  elif [ -e "$2" ]; then
    mv "$2" "$2.bak"
    info "Moved existing file $2 to $2.bak"
  fi
  ln -sf "$1" "$2"
  info "Symlinked $1 to $2"
}

get_arch() {
  local _ostype _cputype

  if [ "$OSTYPE" == "linux-gnu" ]; then
    _ostype=unknown-linux-gnu
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    _ostype=apple-darwin
  else
    err "OS $OSTYPE currently unsupported"
  fi

  _cputype=$(uname -m)
  [ $_cputype == "x86_64" ] || [ $_cputype == "arm64" ] || err "CPU $_cputype currently unsupported"

  RETVAL=$_cputype-$_ostype
}

downloader() {
  local _dld
  if check_cmd curl; then
    _dld=curl
  elif check_cmd wget; then
    _dld=wget
  else
    _dld='curl or wget' # to be used in error message of require
  fi

  if [ "$1" = --check ]; then
    require "$_dld"
  elif [ "$_dld" = curl ]; then
    curl --proto '=https' --tlsv1.2 --silent --show-error --fail --location "$1" --output "$2"
  elif [ "$_dld" = wget ]; then
    wget --https-only --secure-protocol=TLSv1_2 "$1" -O "$2"
  fi
}

main "$@"

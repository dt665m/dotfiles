#!/bin/bash
set -euo pipefail
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
  read -s -n1 choice || true

  case "$choice" in
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
  *) err "Invalid choice" ;;
  esac
}

setup_git() {
  info "setting up git"
  git config --global alias.co checkout
  git config --global alias.br branch
  git config --global alias.com commit
  git config --global alias.st status
  git config --global credential.helper osxkeychain
  git config --global pull.ff only
  git config --global init.defaultBranch main

  if [ -z "$(git config --global --get user.email)" ]; then
    echo -n "Git user.name: "
    read -r user_name
    echo -n "Git user.email: "
    read -r user_email
    [ -n "$user_name" ] && git config --global user.name "$user_name"
    [ -n "$user_email" ] && git config --global user.email "$user_email"
  fi
}

install_homebrew() {
  if ! command -v brew >/dev/null 2>&1; then
    info "Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
  eval "$(/usr/bin/env brew shellenv)"
  # On macOS Apple Silicon, ensure /opt/homebrew/bin precedes
  export PATH="$(brew --prefix)/bin:$(brew --prefix)/sbin:$PATH"
}

install_languages() {
  brew install go lua node nvm pnpm luarocks || true

  if ! command -v rustup >/dev/null 2>&1; then
    curl https://sh.rustup.rs -sSf | sh -s -- -y
    # shellcheck source=/dev/null
    source "$HOME/.cargo/env"
    rustup default stable
  fi

  # Keep toolchains/components tidy
  rustup update
  rustup component add rustfmt clippy

  # Nightly targets used for WASM/Android/iOS if you need them:
  rustup toolchain install nightly
  rustup target add \
    aarch64-apple-ios x86_64-apple-ios aarch64-apple-darwin \
    aarch64-linux-android armv7-linux-androideabi i686-linux-android \
    wasm32-wasi wasm32-unknown-unknown \
    --toolchain nightly

  # Rust tooling
  cargo install --locked cargo-wasi sccache cargo-about git-cliff cargo-duplicates cargo-outdated cargo-generate || true

  # sccache config
  sym_link "$ROOT_PATH/cargo-config.toml" "$HOME/.cargo/config.toml"
  # cargo-generate
  sym_link "$ROOT_PATH/cargo-generate.toml" "$HOME/.cargo/cargo-generate.toml"
}

install_shell() {
  # Plugins/themes/fonts
  brew tap homebrew/cask-fonts || true
  brew install zsh-syntax-highlighting zsh-autosuggestions powerlevel10k || true
  brew install --cask font-meslo-lg-nerd-font font-fira-code-nerd-font || true

  mkdir -p "$HOME/.config"
  sym_link "$ROOT_PATH/zsh/.zshrc" "$HOME/.zshrc"
  sym_link "$ROOT_PATH/zsh/.zfuncs" "$HOME/.zfuncs"
  sym_link "$ROOT_PATH/zsh/.zcustom" "$HOME/.zcustom"
}

install_tools() {
  brew tap kdash-rs/kdash || true
  brew install \
    ripgrep fd fzf bat eza zoxide jq yq ast-grep \
    zellij just grex kondo tokei gh lazygit \
    protobuf libpq kubectl kubectx kdash || true
  brew install --cask visual-studio-code google-cloud-sdk || true

  # Ensure gcloud on PATH in this shell before using it
  if [ -d "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk" ]; then
    # shellcheck disable=SC1091
    source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc" || true
  fi
  command -v gcloud >/dev/null 2>&1 && gcloud components install gke-gcloud-auth-plugin --quiet || true

  sym_link "$ROOT_PATH/zellij" "$HOME/.config/zellij"
}

install_terminal() {
  brew install --cask alacritty || true

  # Install terminfo via tic using a temp copy (don’t write into the .app bundle)
  tmpfile=$(mktemp)
  ensure downloader "https://raw.githubusercontent.com/alacritty/alacritty/master/extra/alacritty.info" "$tmpfile"
  info "setting terminal tic, sudo may be required"
  sudo tic -xe alacritty,alacritty-direct "$tmpfile"
  rm -f "$tmpfile"

  info "configuring terminal"
  sym_link "$ROOT_PATH/.alacritty.toml" "$HOME/.alacritty.toml"
}

install_neovim() {
  brew install neovim || true
  info "configuring neovim"
  mkdir -p "$HOME/.config"
  sym_link "$ROOT_PATH/lazyvim" "$HOME/.config/nvim"
  mkdir -p "$HOME/.vimdid"
}

uninstall_neovim() {
  rm -rf "$HOME/.cache/nvim" "$HOME/.local/share/nvim"
}

# ----- Utils --------------------------------------------------------------------

info() { printf "\r  [ \033[00;34m..\033[0m ] %s\n" "$1"; }
ok() { printf "\r\033[2K  [ \033[00;32mOK\033[0m ] %s\n" "$1"; }
err() {
  printf "\r\033[2K  [\033[0;31mERR\033[0m] %s\n" "$1"
  exit 1
}

ensure() { if ! "$@"; then err "command failed: $*"; fi; }
require() { if ! check_cmd "$1"; then err "need '$1' (command not found)"; fi; }
check_cmd() { command -v "$1" >/dev/null 2>&1; }

append_not_exists() {
  if [ -f "$2" ] && grep -qF -- "$1" "$2"; then
    info "Line already present in '$2'"
    return
  fi
  info "Appending to '$2': $1"
  echo "$1" >>"$2"
}

sym_link() {
  local src="$1" dst="$2"
  if [ -L "$dst" ]; then
    if [ "$(readlink "$dst")" != "$src" ]; then
      rm "$dst"
      info "Removed existing symlink $dst"
    else
      info "Symlink OK: $src"
      return 0
    fi
  elif [ -e "$dst" ]; then
    mv "$dst" "$dst.bak"
    info "Moved existing $dst to $dst.bak"
  fi
  ln -sfn "$src" "$dst"
  info "Symlinked $src -> $dst"
}

get_arch() {
  local _ostype _cputype
  case "$OSTYPE" in
  linux-gnu*) _ostype=unknown-linux-gnu ;;
  darwin*) _ostype=apple-darwin ;;
  *) err "OS $OSTYPE currently unsupported" ;;
  esac
  _cputype=$(uname -m)
  case "$_cputype" in
  x86_64 | arm64) : ;;
  *) err "CPU $_cputype currently unsupported" ;;
  esac
  RETVAL="${_cputype}-${_ostype}"
}

downloader() {
  local _dld
  if check_cmd curl; then
    _dld=curl
  elif check_cmd wget; then
    _dld=wget
  else
    _dld='curl or wget'
  fi

  if [ "${1:-}" = --check ]; then
    require "$_dld"
  elif [ "$_dld" = curl ]; then
    curl --proto '=https' --tlsv1.2 --silent --show-error --fail --location "$1" --output "$2"
  else
    wget --https-only --secure-protocol=TLSv1_2 "$1" -O "$2"
  fi
}

main "$@"

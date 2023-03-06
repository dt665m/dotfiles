# My macOS dotfiles
This is my dotfiles.  There are many like it, but this one is mine.  My dotfiles is my best friend.  It is my life.  Without me, my dotfiles is useless...

```sh
./install.sh
```

# Post Install Setup 
- Set terminal font to one of the Nerd Font types (recommending "MesloLGM Nerd Font")

# Optional Post Install Steps
- https://code.visualstudio.com/docs/setup/mac to add ```code``` command to terminals


## Alacritty TERM info installation
```sh
wget https://raw.githubusercontent.com/alacritty/alacritty/master/extra/alacritty.info && tic -xe alacritty,alacritty-direct alacritty.info && rm alacritty.info
```

## GPG Keys
```sh
# Export
gpg --list-secret-keys --keyid-format LONG
gpg -o private.gpg --export-options backup --export-secret-keys ${KEY_NAME}
# Import
gpg --import-options restore --import private.gpg
gpg --edit-key ${KEY_NAME}
gpg> trust
     5 I trust ultimately <--
```

## NeoVim Details

## TODO 
- Linuxify the installer with the following strategy
    - use as little brew as possible so that installations are cross platform (use git, cargo...)
    - introduce a lightweight plugin manager that does the same for zsh (zap?)
    - create custom zsh completions folder for losing out on brew benefits (most formulas will
    install completions to /opt/homebrew/share/zsh/site-functions automatically, which is added in
    the fpath of the .zshrc).  Reliance on this should be minimized
- Fix zsh completions bugging out (if a similar completion isn't used but only half of it is, 
pressing enter makes it look like the completion was selected but the executed command isn't the
one shown in the prompt.  For example, if the command was 'git push origin master' but the auto
complete was 'git push origin master v0.12.2' and v0.12.2 isn't typed or selected, on pressing
enter, it will appear as if the completion was executed but in fact it was not)
- Find auto-complete for relative path typing in nvim

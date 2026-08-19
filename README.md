# Premium Linux Dotfiles v2

A clean, safe Linux developer shell built around Zsh and Starship.

## Install

```bash
chmod +x install.sh bin/dotfiles-doctor
./install.sh
exec zsh
```

The installer creates timestamped backups before replacing existing dotfiles and is safe to run repeatedly. It never installs AI tools automatically.

## Optional tools

Install what you want with your distro package manager: `starship`, `zoxide`, `eza`, `bat`, `ripgrep`, `fzf`, `neovim`, and `nvm`.

## Diagnose

```bash
dotfiles-doctor
```

## Layout

- `shell/`: Zsh configuration and aliases
- `config/`: Starship prompt
- `bin/`: local utilities
- `install.sh`: idempotent installer

## Uninstall

Remove the symlinks `~/.zshrc`, `~/.aliases`, `~/.config/starship.toml`, and `~/.local/bin/dotfiles-doctor`. Timestamped backups are retained.

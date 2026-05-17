# .dotfiles

A MacOS-to-Linux development environment configured with dotfiles and secret management.

## Philosophy

```
┌────────────────────────────────────────┐
│   ~/.dotfiles (public, safe to share)  │
│  .config/, fish/, sbin/, zed, neovim   │
└──────────────────┬─────────────────────┘
                   │
        make install / clones + makes
                   │
                   ▼
┌────────────────────────────────────────┐
│  ~/.dotfiles-private (encrypted, creds)│
│   work.fish, .ssh, .git-crypt, tasks   │
└────────────────────────────────────────┘
```

## Prerequisites

1. Install Homebrew: https://brew.sh/
2. `brew install fish stow git-crypt gh`
3. `echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells`
4. `chsh -s /opt/homebrew/bin/fish`
5. `gh auth login` (browser flow)
6. Download GPG keys from my vault, unzip: `unzip ~/Downloads/sharran-gpg.zip`
7. `gpg --import ~/Downloads/sharran-gpg/sharran-secret-gpg.key`
8. `gpg --import-ownertrust ~/Downloads/sharran-gpg/sharran-ownertrust-gpg.txt`
9. `gh repo clone msharran/.dotfiles ~/.dotfiles`

## Install

```bash
cd ~/.dotfiles && make install
```

## What Lives Where

- **Public (~/.dotfiles)**: Editor config (nvim, zed, lazygit), shell base (fish, zsh), sbin scripts, system configs (aerospace, ghostty, k9s), jj base config, git settings, tmux
- **Private (~/.dotfiles-private)**: work.fish, jj work.toml, .git-crypt/, .ssh/, .gitconfig-work, zed tasks.json, .config/amp, .warp, .gemini, .claude
- **Linkage**: stow creates symlinks; private repo's Makefile unlocks git-crypt and stows its own files

# Aincrad - My Dotfiles Repo 

>_Aincrad is the central, 100-floor floating castle setting of the first story arc in the Sword Art Online series_

## A very rational one time installation on a macOS

1. Open macOS default terminal
2. Install home brew (Refer https://brew.sh/)
3. Set brew bin path to `PATH` temporarily. `set -x PATH $PATH /opt/homebrew/bin`
4. Install Fish and set as default shell
    ```bash
    /opt/homebrew/bin/brew install fish
    # Add fish to valid shells
    echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells
    # Set fish as default shell
    chsh -s /opt/homebrew/bin/fish
    ```
5. Install Zed
    ```bash
    /opt/homebrew/bin/brew install --cask zed
    ```
6. Configure **Zed Gemini CLI** for interactive help: [Installation Guide](https://zed.dev/acp/agent/gemini-cli)
7. Login using gh cli (browser flow, via HTTP)
    ```fish
    msharran@Akshayas-MacBook-Air-2 ~> /opt/homebrew/bin/gh auth login
    ? Where do you use GitHub? GitHub.com
    ? What is your preferred protocol for Git operations on this host? HTTPS
    ? Authenticate Git with your GitHub credentials? Yes
    ? How would you like to authenticate GitHub CLI? Login with a web browser
    ```
8. Clone aincrad in home dir `cd && /opt/homebrew/bin/gh repo clone msharran/aincrad`
9. Install git-crypt `/opt/homebrew/bin/brew install git-crypt`
10. Install gpg keys
    > Note: Download from GDrive
    ```fish
    unzip ~/Downloads/sharran-gpg.zip
    gpg --import ~/Downloads/sharran-gpg/sharran-secret-gpg.key
    gpg --import-ownertrust ~/Downloads/sharran-gpg/sharran-ownertrust-gpg.txt
    ```
11. Install everything via Zed's project task using `cmd+shift+r > install` or via `make install` in the terminal from the aincrad directory
     > Note: This will install all dependencies, create directories, and link dotfiles. It will also clear existing fish/zed configs to allow stow to link them correctly.
```fish
msharran@Akshayas-MacBook-Air-2 ~/aincrad (main)> make install
...
```

## Global Agent Configuration

All user-specific global agent files (Amp, Claude Code, etc.) are **symlinked from `.claude/CLAUDE.md`** to `.config/amp/AGENTS.md`. This ensures a single source of truth for global instructions across all projects and tools.

**Do not edit agent files in `.config/` directly.** Edit `.claude/CLAUDE.md` instead; changes propagate automatically via symlink.

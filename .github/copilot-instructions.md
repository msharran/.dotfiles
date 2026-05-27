# Copilot instructions for msharran/.dotfiles

Purpose: Provide repository-specific guidance for Copilot / AI-assisted sessions working in this dotfiles repo.

---

1) Build, test, and lint commands

- Bootstrap host / full install:
  - cd ~/.dotfiles && make install
  - make install clones ~/.dotfiles-private and runs its install step (git-crypt unlocks private files).
- Preview symlink changes (safe):
  - make dryrun  # runs `stow -v -n .` to preview
- Apply symlinks:
  - make stow-link  # runs `stow -v .`
- Remove symlinks created by this repo:
  - make clean  # runs `stow -v -D .`
- Inspect active dotfile symlinks in $HOME:
  - make ls

- Ruby linting (single file or repo):
  - bundle install        # install rubocop from Gemfile
  - bundle exec rubocop path/to/file.rb   # lint a single file
  - bundle exec rubocop                # lint all tracked ruby helpers

- Tests: There is no automated test suite in this repository. Validate changes locally by running `make dryrun` then `make stow-link`, and manually exercising the affected tool/config.

---

2) High-level architecture (big picture)

- Public repo: this repository is the public half of a macOS dotfiles setup, intended to be stowed into $HOME. Core configs live under `.config/` (nvim, zed, k9s, ghostty, etc.), helper scripts live in `sbin/`, and operational notes/screenshots live in `docs/`.

- Private repo: machine-specific credentials, work settings, and secrets live in `~/.dotfiles-private`. `make install` clones and invokes that repo's install step; private files are expected to be encrypted/unlocked (git-crypt/GPG).

- Linkage and bootstrapping: GNU Stow is used to create symlinks from this repo into $HOME. The Makefile orchestrates bootstrapping (brew deps, directory setup, cloning private repo) and stow operations.

- Notable components:
  - `.config/nvim` — Neovim config using lazy.nvim and per-plugin Lua modules.
  - `sbin/` — small shell helper scripts (sessionisers, launch config generators).
  - Root-level configs — `.tmux.conf`, terminfo files, and git settings are intended to be stowed to $HOME.

---

3) Key conventions and patterns

- Public/private split: Never commit credentials or machine-specific secrets into this repo. Private items belong under `~/.dotfiles-private`.

- Stow workflow:
  - Always prefer `make dryrun` before `make stow-link` to preview changes.
  - To apply a specific package: `stow -v <package-dir>` (e.g., `stow -v .config/nvim`).

- sbin scripts:
  - Use `#!/usr/bin/env bash` shebang unless a stricter shell is needed.
  - Follow existing style: small functions, straightforward control flow, 4-space indentation, kebab-case filenames (e.g., `zed-sessioniser`).
  - Test scripts locally by running them directly with safe inputs.

- Ruby helpers & linting: Run `bundle install` when modifying ruby helpers; lint per-file with `bundle exec rubocop path/to/file`.

- Changes and verification:
  - Keep edits surgical and self-contained. After edits, run `make dryrun` to check symlink impacts, then `make stow-link` if ready. Manually open the tool (tmux, nvim, kitty) to verify behavior.

- Check `.gitignore` before adding files; ephemeral local state belongs in the private repo.

---

4) Existing docs and AI-related files to consult

- README.md — repo overview and bootstrap steps
- docs/bootstrap.md — host bootstrap steps (make install)
- AGENTS.md — repository guidelines and conventions (overlaps with this file)

No CLAUDE.md, .cursorrules, .windsurfrules, AIDER_CONVENTIONS.md, or other known AI assistant rule files were found in the repo root.

---

Notes for Copilot sessions

- Prefer small, surgical edits and avoid introducing secrets. When asked to modify system/linkage files, call out the need to run `make dryrun` and `make stow-link` for verification.
- When requested to add new config that is machine-specific, recommend adding it to `~/.dotfiles-private` instead of this public repo.


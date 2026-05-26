# Repository Guidelines

## Project Structure & Module Organization
This repository contains the public half of a macOS dotfiles setup. Core configs live under [`.config/`](/Users/msharran/.dotfiles/.config), including `nvim`, `zed`, `ghostty`, `k9s`, and shell-related settings. Helper scripts live in [`sbin/`](/Users/msharran/.dotfiles/sbin). Operational notes and screenshots live in [`docs/`](/Users/msharran/.dotfiles/docs). Root-level files such as [`.gitconfig`](/Users/msharran/.dotfiles/.gitconfig), [`.tmux.conf`](/Users/msharran/.dotfiles/.tmux.conf), and terminfo files are symlinked into `$HOME` with GNU Stow. Private secrets and machine-specific config belong in `~/.dotfiles-private`, not here.

## Build, Test, and Development Commands
Use `make` targets instead of ad hoc Stow commands when possible:

- `make install` clones `~/.dotfiles-private`, runs its install step, creates local directories, installs brew packages, and stows this repo.
- `make dryrun` previews symlink changes with `stow -v -n .`.
- `make stow-link` applies symlinks to `$HOME`.
- `make clean` removes this repo's symlinks.
- `make ls` lists active dotfile symlinks in `$HOME`.

For Ruby linting support, install gems with `bundle install`; the `Gemfile` includes `rubocop`.

## Coding Style & Naming Conventions
Shell scripts in [`sbin/`](/Users/msharran/.dotfiles/sbin) should use `#!/usr/bin/env bash` unless a stricter shell is required. Follow existing shell style: small functions, straightforward control flow, and 4-space indentation inside blocks. Prefer descriptive kebab-case or lowercase names such as `warp-launch-config-generator.sh` and `zed-sessioniser`.

Keep configs scoped to the owning tool directory, and avoid committing ephemeral local state. Check [`.gitignore`](/Users/msharran/.dotfiles/.gitignore) before adding new files.

## Testing Guidelines
There is no formal automated test suite in this repo. Validate changes by running `make dryrun` before `make stow-link`, then open the affected tool locally and confirm behavior. For shell changes, run the script directly with a safe input path and, when applicable, lint Ruby helpers with `bundle exec rubocop`.

## Commit & Pull Request Guidelines
Recent history favors short, imperative commit subjects with optional scope prefixes, for example `sbin: Add mux` or `cleanup aerospace`. Keep subjects concise and focused on one change. PRs should describe the user-visible effect, note any manual setup required, and include screenshots only when updating UI-facing docs such as Zed or tmux images.

## Security & Configuration Tips
Do not commit credentials, tokens, SSH material, or host-specific secrets. Anything sensitive belongs in `~/.dotfiles-private`. When adding new tracked config, prefer portable defaults and keep machine-local overrides out of this repo.

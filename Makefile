SHELL := /bin/bash

.PHONY: install
install: private-clone private-install setup-dirs setup-brew stow-link

.PHONY: private-clone
private-clone:
	[ -d ~/.dotfiles-private ] || gh repo clone msharran/.dotfiles-private ~/.dotfiles-private

.PHONY: private-install
private-install:
	$(MAKE) -C ~/.dotfiles-private install

setup-dirs:
	mkdir -p ~/.local/bin ~/opt ~/.npm-global ~/go ~/.local/go ~/projects/work ~/projects/play

setup-brew:
	brew install wget stow direnv git-crypt go node kubectl k9s pyenv zig bat || true

stow-link:
	# stow is idempotent by design, -v for visibility
	stow -v .

.PHONY: ls
ls:
	ls -lhat ~ | grep ^l | grep -w dotfiles

.PHONY: dryrun
dryrun:
	stow -v -n .

.PHONY: clean
clean:
	stow -v -D .

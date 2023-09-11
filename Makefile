.PHONY: setup
setup:
	stow -v .

.PHONY: ls
ls:
	ls -lhat ~ | grep .dotfiles

.PHONY: dryrun
dryrun:
	stow -v -n .

.PHONY: clean
clean:
	stow -v -D .

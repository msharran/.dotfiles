SHELL := /bin/bash

.PHONY: setup
setup:
	stow -v .

.PHONY: ls
ls:
	ls -lhat ~ | grep ^l | grep -w .dotfiles

.PHONY: dryrun
dryrun:
	stow -v -n .

.PHONY: clean
clean:
	stow -v -D .

pack-install:
	git submodule update --init --recursive
	git submodule status

REPO ?= https://github.com
pack-add:
	@echo "Usage: make pack-add REPO=owner/repo"
	@echo "Adding package $(PACK)"
	git submodule add $(REPO)/$(PACK) .vim/pack/$(shell echo $(PACK) | cut -d/ -f1)/start/$(shell echo $(PACK) | cut -d/ -f2)
	git submodule status

pack-rm:
	git submodule deinit -f .vim/pack/$(shell echo $(PACK) | cut -d/ -f1)/start/$(shell echo $(PACK) | cut -d/ -f2)
	rm -rf .git/modules/.vim/pack/$(shell echo $(PACK) | cut -d/ -f1)/start/$(shell echo $(PACK) | cut -d/ -f2)
	git rm -f .vim/pack/$(shell echo $(PACK) | cut -d/ -f1)/start/$(shell echo $(PACK) | cut -d/ -f2)
	git submodule status

pack-list:
	git submodule status | grep .vim/pack

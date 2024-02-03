TEMPLATES := $(wildcard templates/*.yaml)

# Usage: make template/<template-name>.yaml
.PHONY: $(TEMPLATES)
$(TEMPLATES):
	cat $@ | limactl create --name $(shell basename $@ | cut -d. -f1) -

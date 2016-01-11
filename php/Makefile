VERSIONS := 5.5 5.6 7.0

.PHONY: build

build: $(foreach version,$(VERSIONS), $(version)-cli/Dockerfile.m4)

TOP := $(dir $(realpath $(lastword $(MAKEFILE_LIST))))

$(foreach version,$(VERSIONS), $(version)-cli/Dockerfile.m4):
	@m4 -I $(TOP)common $@ > $(subst .m4,,$@)

$(foreach version,$(VERSIONS), $(version)-cli/Dockerfile):
	@docker build --rm --no-cache -t stanangeloff/php:$(shell basename $(shell dirname $@)) $(shell dirname $@)

.PHONY: $(VERSIONS)

$(VERSIONS): % : %-cli/Dockerfile.m4 %-cli/Dockerfile

VERSIONS := 5.5 5.6 7.0 7.1 7.2

.PHONY: build

build: $(foreach version,$(VERSIONS), $(version)-cli/Dockerfile.m4)

TOP := $(dir $(realpath $(lastword $(MAKEFILE_LIST))))

$(foreach version,$(VERSIONS), $(version)-cli/Dockerfile.m4):
	@m4 -I $(TOP)common $@ > $(subst .m4,,$@)

DOCKER_OPTS ?=

$(foreach version,$(VERSIONS), $(version)-cli/Dockerfile):
	@docker build -t stanangeloff/php:$(shell basename $(shell dirname $@)) $(DOCKER_OPTS) $(shell dirname $@)

.PHONY: $(VERSIONS)

$(VERSIONS): % : %-cli/Dockerfile.m4 %-cli/Dockerfile

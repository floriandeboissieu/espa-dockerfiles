
TAG_PREFIX = usgs-espa

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# General targets
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

all: clean build-all

build-all: espa-node

espa: espa-node
espa-node: ubuntu-node

base: ubuntu-base

clean: clean-containers clean-images

clean-containers:
	@-./remove-all-stopped-containers.sh

clean-images:
	@-./remove-dangling-images.sh

.PHONY: all build-all espa espa-node base clean clean-containers clean-images base-build base-python base-cots base-development base-node ubuntu-base ubuntu-python ubuntu-cots ubuntu-development ubuntu-node

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Common
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

base-build:
	@docker build -t $(TAG_PREFIX)/$(SYSTEM)-base $(SYSTEM)/base

base-python:
	@docker build -t $(TAG_PREFIX)/$(SYSTEM)-python $(SYSTEM)/python

base-cots:
	@docker build -t $(TAG_PREFIX)/$(SYSTEM)-cots $(SYSTEM)/cots

base-development:
	@docker build -t $(TAG_PREFIX)/$(SYSTEM)-development $(SYSTEM)/development

base-node:
	@docker build -t $(TAG_PREFIX)/$(SYSTEM)-node $(SYSTEM)/node

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Ubuntu
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ubuntu-base:
	@SYSTEM=ubuntu make base-build

ubuntu-python: ubuntu-base
	@SYSTEM=ubuntu make base-python

ubuntu-cots: ubuntu-python
	@SYSTEM=ubuntu make base-cots

ubuntu-development: ubuntu-cots
	@SYSTEM=ubuntu make base-development

ubuntu-node: ubuntu-cots
	@SYSTEM=ubuntu make base-node


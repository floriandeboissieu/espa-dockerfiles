
TAG_PREFIX = usgs-espa

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# General targets
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

all: clean build-all

build-all: espa-node

base: ubuntu-base

clean: clean-containers clean-images

clean-containers:
	@-./remove-all-stopped-containers.sh

clean-images:
	@-./remove-dangling-images.sh

.PHONY: all build-all base clean clean-containers clean-images base-build base-python base-cots base-science ubuntu-base ubuntu-python ubuntu-cots ubuntu-science

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Common
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

base-build:
	@docker build -t $(TAG_PREFIX)/$(SYSTEM)-base $(SYSTEM)/base

base-python:
	@docker build -t $(TAG_PREFIX)/$(SYSTEM)-python $(SYSTEM)/python

base-cots:
	@docker build -t $(TAG_PREFIX)/$(SYSTEM)-cots $(SYSTEM)/cots

base-science:
	@docker build -t $(TAG_PREFIX)/$(SYSTEM)-science $(SYSTEM)/science

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Ubuntu
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ubuntu-base:
	@SYSTEM=ubuntu make base-build

ubuntu-python: ubuntu-base
	@SYSTEM=ubuntu make base-python

ubuntu-cots: ubuntu-python
	@SYSTEM=ubuntu make base-cots

ubuntu-science: ubuntu-cots
	@SYSTEM=ubuntu make base-science


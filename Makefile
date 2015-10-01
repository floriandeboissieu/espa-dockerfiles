
TAG_PREFIX = usgs-espa

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# General targets
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

all: clean build-all

build-all: espa

#espa: debian-espa ubuntu-espa
espa-node: espa-ubuntu

#debian-espa: debian-py-espa debian-lfe-espa debian-clj-espa

espa-ubuntu: ubuntu-cots

#base: debian-base ubuntu-base centos-base
base: ubuntu-base

clean:
	@-docker rm $(shell docker ps -a -q)
	@-docker rmi $(shell docker images -q --filter 'dangling=true')

.PHONY: all build-all espa-node espa-ubuntu base clean base-build base-python base-cots ubuntu-base ubuntu-python ubuntu-cots

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Common
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

base-build:
	@docker build -t $(TAG_PREFIX)/$(SYSTEM)-base $(SYSTEM)/base

base-python:
	@docker build -t $(TAG_PREFIX)/$(SYSTEM)-python $(SYSTEM)/python

base-cots:
	@docker build -t $(TAG_PREFIX)/$(SYSTEM)-cots $(SYSTEM)/cots

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Ubuntu
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ubuntu-base:
	@SYSTEM=ubuntu make base-build

ubuntu-python: ubuntu-base
	@SYSTEM=ubuntu make base-python

ubuntu-cots: ubuntu-python
	@SYSTEM=ubuntu make base-cots


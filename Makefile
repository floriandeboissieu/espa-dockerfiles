
TAG_PREFIX = usgs.espa

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# General targets
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

all: clean ubuntu.science

base: ubuntu.base

clean: clean-containers clean-images

clean.containers:
	@-./remove-all-stopped-containers.sh

clean.images:
	@-./remove-dangling-images.sh

.PHONY: all base clean clean.containers clean.images base.build base.python base.cots base.science ubuntu.base ubuntu.python ubuntu.cots ubuntu.science centos.base centos.python centos.cots centos.science

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Common
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

base.build:
	@docker build -t $(TAG_PREFIX).$(SYSTEM).base \
         -f $(SYSTEM)/base/Dockerfile .

base.external:
	@docker build -t $(TAG_PREFIX).$(SYSTEM).external \
         -f $(SYSTEM)/external/Dockerfile .

base.python:
	@docker build -t $(TAG_PREFIX).$(SYSTEM).python \
         -f $(SYSTEM)/python/Dockerfile .

base.cots:
	@docker build -t $(TAG_PREFIX).$(SYSTEM).cots \
         -f $(SYSTEM)/cots/Dockerfile .

base.science:
	@docker build -t $(TAG_PREFIX).$(SYSTEM).science \
         -f $(SYSTEM)/science/Dockerfile .

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Ubuntu
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ubuntu.base:
	@SYSTEM=ubuntu make base.build

ubuntu.python: ubuntu.base
	@SYSTEM=ubuntu make base.python

ubuntu.cots: ubuntu.python
	@SYSTEM=ubuntu make base.cots

ubuntu.science: ubuntu.cots
	@SYSTEM=ubuntu make base.science

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CentOS
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

centos.base:
	@SYSTEM=centos make base.build

centos.external: centos.base
	@SYSTEM=centos make base.external

centos.python: centos.cots
	@SYSTEM=centos make base.python

centos.science: centos.python
	@SYSTEM=centos make base.science


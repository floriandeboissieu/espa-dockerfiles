
TAG_PREFIX = usgs.espa
TAG_VERSION = 0.2.0

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# General targets
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

all: clean centos.modtran

clean: clean.containers clean.images

clean.containers:
	@-./scripts/remove-all-stopped-containers.sh

clean.images:
	@-./scripts/remove-dangling-images.sh

.PHONY: all base clean clean.containers clean.images base.build base.python base.cots base.science centos.base centos.python centos.cots centos.science centos.modtran

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Common
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

base.build:
	@docker build -t $(TAG_PREFIX).$(SYSTEM).base \
         -f $(SYSTEM)/base/Dockerfile .
	@docker tag $(TAG_PREFIX).$(SYSTEM).base \
        $(TAG_PREFIX).$(SYSTEM).base:$(TAG_VERSION)

base.external:
	@docker build -t $(TAG_PREFIX).$(SYSTEM).external \
         -f $(SYSTEM)/external/Dockerfile .
	@docker tag $(TAG_PREFIX).$(SYSTEM).external \
        $(TAG_PREFIX).$(SYSTEM).external:$(TAG_VERSION)

base.python:
	@docker build -t $(TAG_PREFIX).$(SYSTEM).python \
         -f $(SYSTEM)/python/Dockerfile .
	@docker tag $(TAG_PREFIX).$(SYSTEM).python \
        $(TAG_PREFIX).$(SYSTEM).python:$(TAG_VERSION)

base.cots:
	@docker build -t $(TAG_PREFIX).$(SYSTEM).cots \
         -f $(SYSTEM)/cots/Dockerfile .
	@docker tag $(TAG_PREFIX).$(SYSTEM).cots \
        $(TAG_PREFIX).$(SYSTEM).cots:$(TAG_VERSION)

base.science:
	@docker build -t $(TAG_PREFIX).$(SYSTEM).science \
         -f $(SYSTEM)/science/Dockerfile .
	@docker tag $(TAG_PREFIX).$(SYSTEM).science \
        $(TAG_PREFIX).$(SYSTEM).science:$(TAG_VERSION)

base.modtran:
	@docker build -t $(TAG_PREFIX).$(SYSTEM).modtran \
         -f $(SYSTEM)/modtran/Dockerfile .
	@docker tag $(TAG_PREFIX).$(SYSTEM).modtran \
        $(TAG_PREFIX).$(SYSTEM).modtran:$(TAG_VERSION)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CentOS
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

centos.base:
	@SYSTEM=centos make base.build

centos.external: centos.base
	@SYSTEM=centos make base.external

centos.science: centos.external
	@SYSTEM=centos make base.science

centos.modtran: centos.science
	@SYSTEM=centos make base.modtran


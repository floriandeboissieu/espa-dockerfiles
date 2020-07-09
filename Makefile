
TAG_PREFIX = espa
ESPA_VERSION = 3.00.0.0

.PHONY: all clean clean.containers clean.images build.base build.external build.science centos.base centos.external centos.science base external science

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# General targets
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

all: clean

clean: clean.containers clean.images

clean.containers:
	@-./scripts/remove-all-stopped-containers.sh

clean.images:
	@-./scripts/remove-dangling-images.sh

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Common
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

build.base:
	@docker build -t $(TAG_PREFIX)/base-c2 -f $(SYSTEM)/base/Dockerfile .
	@docker tag $(TAG_PREFIX)/base-c2 $(TAG_PREFIX)/base-c2:$(ESPA_VERSION)

build.external:
	@./fix-espa-versions.sh ${ESPA_VERSION} centos/external/Dockerfile.template centos/external/Dockerfile
	@docker build -t $(TAG_PREFIX)/external-c2 -f $(SYSTEM)/external/Dockerfile .
	@docker tag $(TAG_PREFIX)/external-c2 $(TAG_PREFIX)/external-c2:$(ESPA_VERSION)

build.science:
	@./fix-espa-versions.sh ${ESPA_VERSION} centos/science/Dockerfile.template centos/science/Dockerfile
	@docker build -t $(TAG_PREFIX)/science -f $(SYSTEM)/science/Dockerfile .
	@docker tag $(TAG_PREFIX)/science $(TAG_PREFIX)/science:$(ESPA_VERSION)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CentOS
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

centos.base:
	@SYSTEM=centos make build.base

centos.external:
	@SYSTEM=centos make build.external

centos.science:
	@SYSTEM=centos make build.science

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Shortcuts
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

base: centos.base
external: centos.external
science: centos.science

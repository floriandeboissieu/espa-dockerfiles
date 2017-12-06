
TAG_PREFIX = espa
ESPA_VERSION = 2.25.0.0.b

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
	@docker build -t $(TAG_PREFIX)/base -f $(SYSTEM)/base/Dockerfile .
	@docker tag $(TAG_PREFIX)/base $(TAG_PREFIX)/base:$(ESPA_VERSION)

build.external:
	@./fix-espa-versions.sh ${ESPA_VERSION} centos/external/Dockerfile.template centos/external/Dockerfile
	@docker build -t $(TAG_PREFIX)/external -f $(SYSTEM)/external/Dockerfile .
	@docker tag $(TAG_PREFIX)/external $(TAG_PREFIX)/external:$(ESPA_VERSION)

build.science:
	@./fix-espa-versions.sh ${ESPA_VERSION} centos/science/Dockerfile.template centos/science/Dockerfile
	@docker build -t $(TAG_PREFIX)/science -f $(SYSTEM)/science/Dockerfile .
	@docker tag $(TAG_PREFIX)/science $(TAG_PREFIX)/science:$(ESPA_VERSION)

build.modtran:
	@./fix-espa-versions.sh ${ESPA_VERSION} centos/modtran/Dockerfile.template centos/modtran/Dockerfile
	@docker build -t $(TAG_PREFIX)/modtran -f $(SYSTEM)/modtran/Dockerfile .
	@docker tag $(TAG_PREFIX)/modtran $(TAG_PREFIX)/modtran:$(ESPA_VERSION)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CentOS
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

centos.base:
	@SYSTEM=centos make build.base

centos.external:
	@SYSTEM=centos make build.external

centos.science:
	@SYSTEM=centos make build.science

centos.modtran:
	@SYSTEM=centos make build.modtran

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Shortcuts
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

base: centos.base
external: centos.external
science: centos.science
modtran: centos.modtran

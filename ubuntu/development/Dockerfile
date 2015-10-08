FROM usgs-espa/ubuntu-cots
MAINTAINER USGS LSRD http://eros.usgs.gov

LABEL description="This is a build containing all of the software we use for \
an ESPA processing node installed into the image."


# ---------------------------------------------------------------------------
# Install gosu so that the entrypoint script can change the the specified
# user.  "gosu is used for easy step-down from root"
RUN gpg --keyserver pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4
RUN curl -o /usr/local/bin/gosu -SL "https://github.com/tianon/gosu/releases/download/1.2/gosu-$(dpkg --print-architecture)" \
    && curl -o /usr/local/bin/gosu.asc -SL "https://github.com/tianon/gosu/releases/download/1.2/gosu-$(dpkg --print-architecture).asc" \
    && gpg --verify /usr/local/bin/gosu.asc \
    && rm /usr/local/bin/gosu.asc \
    && chmod +x /usr/local/bin/gosu

# Specify the user that will run everything
ENV THE_USER=espa-developer


# ---------------------------------------------------------------------------
# Configuration of many of the environment variables to reduce intermediate
# docker image generation.
# ---------------------------------------------------------------------------

# Define the installation and library locations
ENV PREFIX=/espa/runtime \
    ESPAINC=/espa/runtime/include \
    ESPALIB=/espa/runtime/lib

# Define the software tags that make up the current release
ENV ESPA_PRODUCT_FORMATTER_TAG=docker-development \
    ESPA_SPECTRAL_INDICES_TAG=docker-development \
    ESPA_CLOUD_MASKING_TAG=docker-development \
    ESPA_SURFACE_WATER_EXTENT_TAG=docker-development


# ---------------------------------------------------------------------------
# Clone the software and then build and install it
# ---------------------------------------------------------------------------

RUN mkdir -p /espa/src

RUN REPO_NAME=espa-product-formatter \
    && cd /espa/src \
    && git clone https://github.com/USGS-EROS/${REPO_NAME}.git ${REPO_NAME} \
    && cd ${REPO_NAME} \
    && git checkout $ESPA_PRODUCT_FORMATTER_TAG \
    && make -f Makefile.static \
    && make -f Makefile.static install \
    && cd .. \
    && rm -rf ${REPO_NAME}

RUN REPO_NAME=espa-spectral-indices \
    && cd /espa/src \
    && git clone https://github.com/USGS-EROS/${REPO_NAME}.git ${REPO_NAME} \
    && cd ${REPO_NAME} \
    && git checkout $ESPA_SPECTRAL_INDICES_TAG \
    && make BUILD_TYPE=-static \
    && make PREFIX=${PREFIX} install \
    && cd .. \
    && rm -rf ${REPO_NAME}

RUN REPO_NAME=espa-cloud-masking \
    && cd /espa/src \
    && git clone https://github.com/USGS-EROS/${REPO_NAME}.git ${REPO_NAME} \
    && cd ${REPO_NAME} \
    && git checkout $ESPA_CLOUD_MASKING_TAG \
    && make BUILD_TYPE=-static \
    && make PREFIX=${PREFIX} install \
    && cd .. \
    && rm -rf ${REPO_NAME}

RUN REPO_NAME=espa-surface-water-extent \
    && cd /espa/src \
    && git clone https://github.com/USGS-EROS/${REPO_NAME}.git ${REPO_NAME} \
    && cd ${REPO_NAME} \
    && git checkout $ESPA_SURFACE_WATER_EXTENT_TAG \
    && cd not-validated-prototype-dswe \
    && make -f Makefile.static \
    && make -f Makefile.static install \
    && cd ../.. \
    && rm -rf ${REPO_NAME}

ENV ESPA_SURFACE_REFLECTANCE_TAG=docker-development
RUN REPO_NAME=espa-surface-reflectance \
    && cd /espa/src \
    && git clone https://github.com/USGS-EROS/${REPO_NAME}.git ${REPO_NAME} \
    && cd ${REPO_NAME} \
    && git checkout $ESPA_SURFACE_REFLECTANCE_TAG \
    && cd ledaps/ledapsSrc/src/ \
    && make -f Makefile.static \
    && make -f Makefile.static install \
    && cd ../../../not-validated-prototype-l8_sr/c_version/src \
    && make -f Makefile.static \
    && make -f Makefile.static install \
    && cd ../../.. \
    && rm -rf ${REPO_NAME}

ENV ESPA_LAND_SURFACE_TEMPERATURE_TAG=docker-development

ENV ESPA_BURNED_AREA_TAG=docker-development

ENV ESPA_SNOW_COVERED_AREA_TAG=docker-development


# ---------------------------------------------------------------------------
# Add an entrypoint so that we execute as a specific user
COPY container-entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]


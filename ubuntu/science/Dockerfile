FROM usgs-espa/ubuntu-cots
MAINTAINER USGS LSRD http://eros.usgs.gov

LABEL description="This is a build containing all of the science processing \
software we use installed into the image."


# ----------------------------------------------------------------------------
# Configuration of many of the environment variables to reduce intermediate
# docker image generation.
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# Define the installation and library locations
ENV PREFIX=/espa/runtime \
    ESPAINC=/espa/runtime/include \
    ESPALIB=/espa/runtime/lib \
    ESPA_SCHEMA=/espa/runtime/espa-product-formatter/schema/espa_internal_metadata_v1_3.xsd

# ----------------------------------------------------------------------------
# Clone the software and then build and install it
# ----------------------------------------------------------------------------
RUN mkdir -p /espa/src

RUN REPO_NAME=espa-product-formatter \
    && REPO_TAG=remotes/origin/docker-development \
    && cd /espa/src \
    && git clone https://github.com/USGS-EROS/${REPO_NAME}.git ${REPO_NAME} \
    && cd ${REPO_NAME} \
    && git checkout ${REPO_TAG} \
    && make BUILD_STATIC=yes \
    && make install \
    && cd .. \
    && rm -rf ${REPO_NAME}

RUN REPO_NAME=espa-spectral-indices \
    && REPO_TAG=remotes/origin/docker-development \
    && cd /espa/src \
    && git clone https://github.com/USGS-EROS/${REPO_NAME}.git ${REPO_NAME} \
    && cd ${REPO_NAME} \
    && git checkout ${REPO_TAG} \
    && make BUILD_STATIC=yes \
    && make install \
    && cd .. \
    && rm -rf ${REPO_NAME}

RUN REPO_NAME=espa-cloud-masking \
    && REPO_TAG=dev_mar2016 \
    && cd /espa/src \
    && git clone https://github.com/USGS-EROS/${REPO_NAME}.git ${REPO_NAME} \
    && cd ${REPO_NAME} \
    && git checkout ${REPO_TAG} \
    && make BUILD_STATIC=yes \
    && make install \
    && cd .. \
    && rm -rf ${REPO_NAME}

RUN REPO_NAME=espa-surface-water-extent \
    && REPO_TAG=docker-development \
    && cd /espa/src \
    && git clone https://github.com/USGS-EROS/${REPO_NAME}.git ${REPO_NAME} \
    && cd ${REPO_NAME} \
    && git checkout ${REPO_TAG} \
    && make BUILD_STATIC=yes \
    && make install \
    && cd ../.. \
    && rm -rf ${REPO_NAME}

RUN REPO_NAME=espa-surface-reflectance \
    && REPO_TAG=docker-development \
    && cd /espa/src \
    && git clone https://github.com/USGS-EROS/${REPO_NAME}.git ${REPO_NAME} \
    && cd ${REPO_NAME} \
    && git checkout ${REPO_TAG} \
    && make BUILD_STATIC=yes \
    && make install \
    && cd .. \
    && rm -rf ${REPO_NAME}

RUN REPO_NAME=espa-land-surface-temperature \
    && REPO_TAG=2015_Dec \
    && cd /espa/src \
    && git clone https://github.com/USGS-EROS/${REPO_NAME}.git ${REPO_NAME} \
    && cd ${REPO_NAME} \
    && git checkout ${REPO_TAG} \
    && make BUILD_STATIC=yes \
    && make install \
    && cd .. \
    && rm -rf ${REPO_NAME}


# ----------------------------------------------------------------------------
# Add an entrypoint so that we execute the specified application as the
# specified user (THE_USER specified below)
ENV THE_USER=espa
COPY science-entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

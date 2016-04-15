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
ENV PREFIX=/usr/local \
    ESPAINC=/usr/local/include \
    ESPALIB=/usr/local/lib

# ----------------------------------------------------------------------------
# Clone the software and then build and install it
# ----------------------------------------------------------------------------
RUN mkdir -p /espa/src

RUN REPO_NAME=espa-product-formatter \
    && REPO_TAG=product_formatter_v1.6.0 \
    && cd /espa/src \
    && git clone https://github.com/USGS-EROS/${REPO_NAME}.git ${REPO_NAME} \
    && cd ${REPO_NAME} \
    && git checkout ${REPO_TAG} \
    && make BUILD_STATIC=no \
    && make install \
    && cd .. \
    && rm -rf ${REPO_NAME}

RUN REPO_NAME=espa-spectral-indices \
    && REPO_TAG=spectral_indices_v2.4.0 \
    && cd /espa/src \
    && git clone https://github.com/USGS-EROS/${REPO_NAME}.git ${REPO_NAME} \
    && cd ${REPO_NAME} \
    && git checkout ${REPO_TAG} \
    && make BUILD_STATIC=no \
    && make install \
    && cd .. \
    && rm -rf ${REPO_NAME}

RUN REPO_NAME=espa-cloud-masking \
    && REPO_TAG=2016_Mar \
    && cd /espa/src \
    && git clone https://github.com/USGS-EROS/${REPO_NAME}.git ${REPO_NAME} \
    && cd ${REPO_NAME} \
    && git checkout ${REPO_TAG} \
    && make BUILD_STATIC=no \
    && make install \
    && cd .. \
    && rm -rf ${REPO_NAME}

RUN REPO_NAME=espa-surface-water-extent \
    && REPO_TAG=2016_Mar \
    && cd /espa/src \
    && git clone https://github.com/USGS-EROS/${REPO_NAME}.git ${REPO_NAME} \
    && cd ${REPO_NAME} \
    && git checkout ${REPO_TAG} \
    && make BUILD_STATIC=no \
    && make install \
    && cd .. \
    && rm -rf ${REPO_NAME}

RUN REPO_NAME=espa-surface-reflectance \
    && REPO_TAG=surface_reflectance_mar2016 \
    && cd /espa/src \
    && git clone https://github.com/USGS-EROS/${REPO_NAME}.git ${REPO_NAME} \
    && cd ${REPO_NAME} \
    && git checkout ${REPO_TAG} \
    && make BUILD_STATIC=no \
    && make install \
    && cd .. \
    && rm -rf ${REPO_NAME}

RUN REPO_NAME=espa-land-surface-temperature \
    && REPO_TAG=2016_Mar \
    && cd /espa/src \
    && git clone https://github.com/USGS-EROS/${REPO_NAME}.git ${REPO_NAME} \
    && cd ${REPO_NAME} \
    && git checkout ${REPO_TAG} \
    && make BUILD_STATIC=no \
    && make install \
    && cd .. \
    && rm -rf ${REPO_NAME}

# ----------------------------------------------------------------------------
# Install the espa-python-library
RUN . /python-virtual/bin/activate \
    && pip install \
        --upgrade git+https://github.com/USGS-EROS/espa-python-library

# ----------------------------------------------------------------------------
# Add an entrypoint so that we execute the specified application as the
# specified user (THE_USER specified below)
ENV THE_USER=espa
COPY science-entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

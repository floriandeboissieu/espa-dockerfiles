FROM espa/external:2.13.0


MAINTAINER USGS EROS LSRD http://eros.usgs.gov


LABEL description="Adds the science processing applications required for Bridge processing"


# ----------------------------------------------------------------------------
# Install the espa-python-library
RUN pip install \
       git+https://github.com/USGS-EROS/espa-python-library.git@v1.0.1#espa


# ----------------------------------------------------------------------------
# Configuration of environment variables
# ----------------------------------------------------------------------------
ENV PREFIX=/usr/local \
    ESPAINC=/usr/local/include \
    ESPALIB=/usr/local/lib \
    ESPA_LEVEL2QA_INC=/usr/local/include \
    ESPA_LEVEL2QA_LIB=/usr/local/lib


# ----------------------------------------------------------------------------
# Clone each science application and then build and install it
# ----------------------------------------------------------------------------

RUN REPO_NAME=espa-product-formatter \
    && REPO_TAG=dev_v1.10.0 \
    && cd $SRC_DIR \
    && git clone https://github.com/USGS-EROS/${REPO_NAME}.git ${REPO_NAME} \
    && cd ${REPO_NAME} \
    && git checkout ${REPO_TAG} \
    && make BUILD_STATIC=yes \
    && make install \
    && cd $SRC_DIR \
    && rm -rf ${REPO_NAME}


RUN REPO_NAME=espa-l2qa-tools \
    && REPO_TAG=l2qa_tools_v1.0.0 \
    && cd $SRC_DIR \
    && git clone https://github.com/USGS-EROS/${REPO_NAME}.git ${REPO_NAME} \
    && cd ${REPO_NAME} \
    && git checkout ${REPO_TAG} \
    && make BUILD_STATIC=yes \
    && make install \
    && cd $SRC_DIR \
    && rm -rf ${REPO_NAME}


# ONLY NEED CFMASK BASED WATER DETECTION FOR BRIDGE
RUN REPO_NAME=espa-surface-water-extent \
    && REPO_TAG=dev_espa_v2.13.0 \
    && cd $SRC_DIR \
    && git clone https://github.com/USGS-EROS/${REPO_NAME}.git ${REPO_NAME} \
    && cd ${REPO_NAME} \
    && git checkout ${REPO_TAG} \
    && make BUILD_STATIC=yes \
    && make install \
    && cd $SRC_DIR \
    && rm -rf ${REPO_NAME}


RUN REPO_NAME=espa-surface-reflectance \
    && REPO_TAG=neednewtag \
    && cd $SRC_DIR \
    && git clone https://github.com/USGS-EROS/${REPO_NAME}.git ${REPO_NAME} \
    && cd ${REPO_NAME} \
    && git checkout ${REPO_TAG} \
    && make BUILD_STATIC=yes \
    && make install \
    && cd $SRC_DIR \
    && rm -rf ${REPO_NAME}


RUN echo "Codename: Fun-n-Games"
RUN REPO_NAME=espa-processing \
    && REPO_TAG=dev_espa_v2.13.0 \
    && cd $SRC_DIR \
    && git clone https://github.com/USGS-EROS/${REPO_NAME}.git ${REPO_NAME} \
    && cd ${REPO_NAME} \
    && git checkout ${REPO_TAG} \
    && make install \
    && cd $SRC_DIR \
    && rm -rf ${REPO_NAME}


# ----------------------------------------------------------------------------
# Add an entrypoint so that we can do some internal setup and then execute the
# specified application
COPY centos/bridge/science-entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

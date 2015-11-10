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


# ---------------------------------------------------------------------------
# Clone the software and then build and install it
# ---------------------------------------------------------------------------

RUN mkdir -p /espa/src

RUN REPO_NAME=espa-product-formatter \
    && REPO_TAG=docker-development \
    && cd /espa/src \
    && git clone https://github.com/USGS-EROS/${REPO_NAME}.git ${REPO_NAME} \
    && cd ${REPO_NAME} \
    && git checkout $REPO_TAG \
    && make -f Makefile.static \
    && make -f Makefile.static install \
    && cd .. \
    && rm -rf ${REPO_NAME}

RUN REPO_NAME=espa-spectral-indices \
    && REPO_TAG=docker-development \
    && cd /espa/src \
    && git clone https://github.com/USGS-EROS/${REPO_NAME}.git ${REPO_NAME} \
    && cd ${REPO_NAME} \
    && git checkout $REPO_TAG \
    && make BUILD_TYPE=-static \
    && make PREFIX=${PREFIX} install \
    && cd .. \
    && rm -rf ${REPO_NAME}

RUN REPO_NAME=espa-cloud-masking \
    && REPO_TAG=docker-development \
    && cd /espa/src \
    && git clone https://github.com/USGS-EROS/${REPO_NAME}.git ${REPO_NAME} \
    && cd ${REPO_NAME} \
    && git checkout $REPO_TAG \
    && make BUILD_TYPE=-static \
    && make PREFIX=${PREFIX} install \
    && cd .. \
    && rm -rf ${REPO_NAME}

RUN REPO_NAME=espa-surface-water-extent \
    && REPO_TAG=docker-development \
    && cd /espa/src \
    && git clone https://github.com/USGS-EROS/${REPO_NAME}.git ${REPO_NAME} \
    && cd ${REPO_NAME} \
    && git checkout $REPO_TAG \
    && cd not-validated-prototype-dswe \
    && make -f Makefile.static \
    && make -f Makefile.static install \
    && cd ../.. \
    && rm -rf ${REPO_NAME}

RUN REPO_NAME=espa-surface-reflectance \
    && REPO_TAG=docker-development \
    && cd /espa/src \
    && git clone https://github.com/USGS-EROS/${REPO_NAME}.git ${REPO_NAME} \
    && cd ${REPO_NAME} \
    && git checkout $REPO_TAG \
    && cd ledaps/ledapsSrc/src/ \
    && make -f Makefile.static \
    && make -f Makefile.static install \
    && cd ../../../not-validated-prototype-l8_sr/c_version/src \
    && make -f Makefile.static \
    && make -f Makefile.static install \
    && cd ../../.. \
    && rm -rf ${REPO_NAME}

RUN REPO_NAME=espa-land-surface-temperature \
    && REPO_TAG=dev_v0.0.1 \
    && cd /espa/src \
    && git clone https://github.com/USGS-EROS/${REPO_NAME}.git ${REPO_NAME} \
    && cd ${REPO_NAME} \
    && git checkout $REPO_TAG \
    && make BUILD_TYPE=-static \
    && make PREFIX=${PREFIX} install \
    && cd .. \
    && rm -rf ${REPO_NAME}


RUN REPO_NAME=espa-burned-area \
    && REPO_TAG=docker-development \
    && cd /espa/src

RUN REPO_NAME=espa-snow-covered-area \
    && REPO_TAG=docker-development \
    && cd /espa/src

RUN cd /espa

RUN . /python-virtual/bin/activate \
    && pip install \
        python-dateutil==1.5 \
        requests==2.2.1 \
        lxml==3.3.3

#        scipy==0.13.3 \
#        numpy==1.8.2 \
#        GDAL==1.11.2 \
#        GDAL==1.10.1 \
#        matplotlib==1.3.1 \
#

# ---------------------------------------------------------------------------
# Add an entrypoint so that we execute as a specific user
COPY container-entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]


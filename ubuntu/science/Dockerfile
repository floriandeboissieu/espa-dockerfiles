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
    && REPO_TAG=remotes/origin/dev_v1.6.0 \
    && cd /espa/src \
    && git clone https://github.com/USGS-EROS/${REPO_NAME}.git ${REPO_NAME} \
    && cd ${REPO_NAME} \
    && git checkout ${REPO_TAG} \
    && make BUILD_STATIC=yes \
    && make install \
    && cd .. \
    && rm -rf ${REPO_NAME}

RUN REPO_NAME=espa-spectral-indices \
    && REPO_TAG=remotes/origin/dev_v2.4.0 \
    && cd /espa/src \
    && git clone https://github.com/USGS-EROS/${REPO_NAME}.git ${REPO_NAME} \
    && cd ${REPO_NAME} \
    && git checkout ${REPO_TAG} \
    && make BUILD_STATIC=yes \
    && make install \
    && cd .. \
    && rm -rf ${REPO_NAME}

RUN REPO_NAME=espa-cloud-masking \
    && REPO_TAG=remotes/origin/dev_mar2016 \
    && cd /espa/src \
    && git clone https://github.com/USGS-EROS/${REPO_NAME}.git ${REPO_NAME} \
    && cd ${REPO_NAME} \
    && git checkout ${REPO_TAG} \
    && make BUILD_STATIC=yes \
    && make install \
    && cd .. \
    && rm -rf ${REPO_NAME}

RUN REPO_NAME=espa-surface-water-extent \
    && REPO_TAG=remotes/origin/dev_mar2016 \
    && cd /espa/src \
    && git clone https://github.com/USGS-EROS/${REPO_NAME}.git ${REPO_NAME} \
    && cd ${REPO_NAME} \
    && git checkout ${REPO_TAG} \
    && make BUILD_STATIC=yes \
    && make install \
    && cd .. \
    && rm -rf ${REPO_NAME}

RUN REPO_NAME=espa-surface-reflectance \
    && REPO_TAG=remotes/origin/dev_mar2016 \
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
# ESPA Runtime Environment Variable Configuration
# /usr/local/.....
ENV ESPA_SCHEMA=/usr/local/espa-product-formatter/schema/espa_internal_metadata_v1_3.xsd \
    ESUN=/usr/local/espa-cloud-masking/static_data \
    LST_DATA_DIR=/usr/local/espa-land-surface-temperature/l5-7_lst/static_data

# /home/espa/.....
ENV ESPA_LAND_MASS_POLYGON=/home/espa/auxiliaries/land_water_polygon/land_no_buf.ply \
    ESPA_WORK_DIR=/home/espa/work-dir \
    ESPA_DISTRIBUTION_DIR=/home/espa/output-data \
    IAS_DATA_DIR=/home/espa/auxiliaries/gls-dem \
    LEDAPS_AUX_DIR=/home/espa/auxiliaries/L17 \
    L8_AUX_DIR=/home/espa/auxiliaries/L8 \
    LST_AUX_DIR=/home/espa/auxiliaries/LST/NARR

# Other
ENV ESPA_DISTRIBUTION_METHOD=local \
    ASTER_GED_SERVER_NAME=e4ftl01.cr.usgs.gov

# Python
ENV PYTHONPATH=/usr/local/espa-product-formatter/python

# Threading
ENV OMP_NUM_THREADS=1

# MODTRAN_PATH=/home/espa/MODTRAN
# MODTRAN_DATA_DIR=/home/espa/MODTRAN/DATA


# ----------------------------------------------------------------------------
# Add an entrypoint so that we execute the specified application as the
# specified user (THE_USER specified below)
ENV THE_USER=espa
COPY science-entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

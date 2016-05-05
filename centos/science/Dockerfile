FROM usgs.espa.centos.external


MAINTAINER USGS LSRD http://eros.usgs.gov


LABEL description="This is a build containing all of the science processing software we use within ESPA-Fulfillment."


# ----------------------------------------------------------------------------
# Configuration of environment variables to reduce intermediate docker image
# generation.
# ----------------------------------------------------------------------------

ENV PREFIX=/usr/local \
    ESPAINC=/usr/local/include \
    ESPALIB=/usr/local/lib

# --------------------------------------
# Include and library paths
#    SZIPINC=$SZIP_PREFIX/include \
#    SZIPLIB=$SZIP_PREFIX/lib \
#    PNGINC=$PNG_PREFIX/include \
#    PNGLIB=$PNG_PREFIX/lib \
#    FREETYPE2INC=$FREETYPE2_PREFIX/include \
#    FREETYPE2LIB=$FREETYPE2_PREFIX/lib \
#    IDNINC=$IDN_PREFIX/include \
#    IDNLIB=$IDN_PREFIX/lib \
#    CURLINC=$CURL_PREFIX/include \
#    CURLLIB=$CURL_PREFIX/lib \
#    JPEGINC=$JPEG_PREFIX/include \
#    JPEGLIB=$JPEG_PREFIX/lib \
#    JBIGINC=$JBIG_PREFIX/include \
#    JBIGLIB=$JBIG_PREFIX/lib \
#    NCDF4INC=$NETCDF4_PREFIX/include \
#    NCDF4LIB=$NETCDF4_PREFIX/lib \
#    NETCDF4INC=$NETCDF4_PREFIX/include \
#    NETCDF4LIB=$NETCDF4_PREFIX/lib \
#    PROJ4_INC=$PROJ4_PREFIX/include \
#    PROJ4_LIB=$PROJ4_PREFIX/lib \
#    GDAL_INC=$GDAL_PREFIX/include \
#    GDAL_LIB=$GDAL_PREFIX/lib

#ENV ZLIBINC=/usr/include \
#    ZLIBLIB=/usr/lib64 \
#    XZINC=/usr/include \
#    XZLIB=/usr/lib64 \
#    LZMAINC=/usr/include \
#    LZMALIB=/usr/lib64 \
#    XML2INC=/usr/local/include/libxml2 \
#    XML2LIB=/usr/local/lib \
#    XSLTINC=/usr/local/include/libxslt \
#    XSLTLIB=/usr/local/lib \
#    TIFFINC=/usr/include \
#    TIFFLIB=/usr/lib64 \
#    GEOTIFFINC=/usr/local/include \
#    GEOTIFFLIB=/usr/local/lib \
#    GEOTIFF_INC=/usr/local/include \
#    GEOTIFF_LIB=/usr/local/lib \
#    HDFINC=/usr/local/include \
#    HDFLIB=/usr/local/lib \
#    HDF4INC=/usr/local/include \
#    HDF4LIB=/usr/local/lib \
#    HDF5INC=/usr/local/include \
#    HDF5LIB=/usr/local/lib \
#    HDFEOSINC=/usr/local/include \
#    HDFEOSLIB=/usr/local/lib \
#    HDFEOS_INC=/usr/local/include \
#    HDFEOS_LIB=/usr/local/lib \
#    HDFEOS_GCTPINC=/usr/local/include \
#    HDFEOS_GCTPLIB=/usr/local/lib

# ----------------------------------------------------------------------------
# Clone the software and then build and install it
# ----------------------------------------------------------------------------

# --------------------------------------
# ESPA Product Formatter
RUN REPO_NAME=espa-product-formatter \
    && REPO_TAG=product_formatter_v1.6.0 \
    && cd /usr/local/src \
    && git clone https://github.com/USGS-EROS/${REPO_NAME}.git ${REPO_NAME} \
    && cd ${REPO_NAME} \
    && git checkout ${REPO_TAG}
#    && make BUILD_STATIC=no \
#    && make install \
#    && cd .. \
#    && rm -rf ${REPO_NAME}


# --------------------------------------
# ESPA Spectral Indices
RUN REPO_NAME=espa-spectral-indices \
    && REPO_TAG=spectral_indices_v2.4.0 \
    && cd /usr/local/src \
    && git clone https://github.com/USGS-EROS/${REPO_NAME}.git ${REPO_NAME} \
    && cd ${REPO_NAME} \
    && git checkout ${REPO_TAG}
#    && make BUILD_STATIC=no \
#    && make install \
#    && cd .. \
#    && rm -rf ${REPO_NAME}


RUN REPO_NAME=espa-cloud-masking \
    && REPO_TAG=2016_Mar \
    && cd /usr/local/src \
    && git clone https://github.com/USGS-EROS/${REPO_NAME}.git ${REPO_NAME} \
    && cd ${REPO_NAME} \
    && git checkout ${REPO_TAG}
#    && make BUILD_STATIC=no \
#    && make install \
#    && cd .. \
#    && rm -rf ${REPO_NAME}
#
#RUN REPO_NAME=espa-surface-water-extent \
#    && REPO_TAG=2016_Mar \
#    && cd /espa/src \
#    && git clone https://github.com/USGS-EROS/${REPO_NAME}.git ${REPO_NAME} \
#    && cd ${REPO_NAME} \
#    && git checkout ${REPO_TAG} \
#    && make BUILD_STATIC=no \
#    && make install \
#    && cd .. \
#    && rm -rf ${REPO_NAME}
#
#RUN REPO_NAME=espa-surface-reflectance \
#    && REPO_TAG=surface_reflectance_mar2016 \
#    && cd /espa/src \
#    && git clone https://github.com/USGS-EROS/${REPO_NAME}.git ${REPO_NAME} \
#    && cd ${REPO_NAME} \
#    && git checkout ${REPO_TAG} \
#    && make BUILD_STATIC=no \
#    && make install \
#    && cd .. \
#    && rm -rf ${REPO_NAME}
#
#RUN REPO_NAME=espa-land-surface-temperature \
#    && REPO_TAG=2016_Mar \
#    && cd /espa/src \
#    && git clone https://github.com/USGS-EROS/${REPO_NAME}.git ${REPO_NAME} \
#    && cd ${REPO_NAME} \
#    && git checkout ${REPO_TAG} \
#    && make BUILD_STATIC=no \
#    && make install \
#    && cd .. \
#    && rm -rf ${REPO_NAME}

## ----------------------------------------------------------------------------
## Install the espa-python-library
#RUN . /python-virtual/bin/activate \
#    && pip install --upgrade \
#       git+https://github.com/USGS-EROS/espa-python-library.git@v1.0.0#espa

## ----------------------------------------------------------------------------
## Add an entrypoint so that we execute the specified application as the
## specified user (THE_USER specified below)
#ENV THE_USER=espa
#COPY science-entrypoint.sh /entrypoint.sh
#RUN chmod 755 /entrypoint.sh
#ENTRYPOINT ["/entrypoint.sh"]

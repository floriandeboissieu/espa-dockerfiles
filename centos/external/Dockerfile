FROM usgs.espa.centos.base


MAINTAINER USGS LSRD http://eros.usgs.gov


LABEL description="This is a build containing all of the cots software we use installed into the image as well as additional CENTOS repo packages required for building and executing ESPA-Fulfillment."


# ----------------------------------------------------------------------------
# Configuration of environment variables to reduce intermediate docker image
# generation.
# ----------------------------------------------------------------------------

# --------------------------------------
# Source and installation locations
ENV SRC_DIR=/usr/local/src \
    ZLIB_PREFIX=/usr/local \
    XZ_PREFIX=/usr/local \
    SZIP_PREFIX=/usr/local \
    PNG_PREFIX=/usr/local \
    FREETYPE2_PREFIX=/usr/local \
    XML2_PREFIX=/usr/local \
    XSLT_PREFIX=/usr/local \
    IDN_PREFIX=/usr/local \
    CURL_PREFIX=/usr/local \
    WGRIB_PREFIX=/usr/local \
    JPEG_PREFIX=/usr/local \
    JBIG_PREFIX=/usr/local \
    TIFF_PREFIX=/usr/local \
    GEOTIFF_PREFIX=/usr/local \
    HDF4_PREFIX=/usr/local \
    HDF5_PREFIX=/usr/local \
    NETCDF4_PREFIX=/usr/local \
    HDFEOS_PREFIX=/usr/local \
    PROJ4_PREFIX=/usr/local \
    GDAL_PREFIX=/usr/local

# --------------------------------------
# Include and library paths
ENV ZLIBINC=$ZLIB_PREFIX/include \
    ZLIBLIB=$ZLIB_PREFIX/lib \
    XZINC=$XZ_PREFIX/include \
    XZLIB=$XZ_PREFIX/lib \
    LZMAINC=$XZ_PREFIX/include \
    LZMALIB=$XZ_PREFIX/lib \
    SZIPINC=$SZIP_PREFIX/include \
    SZIPLIB=$SZIP_PREFIX/lib \
    PNGINC=$PNG_PREFIX/include \
    PNGLIB=$PNG_PREFIX/lib \
    FREETYPE2INC=$FREETYPE2_PREFIX/include \
    FREETYPE2LIB=$FREETYPE2_PREFIX/lib \
    XML2INC=$XML2_PREFIX/include/libxml2 \
    XML2LIB=$XML2_PREFIX/lib \
    XSLTINC=$XSLT_PREFIX/include/libxslt \
    XSLTLIB=$XSLT_PREFIX/lib \
    IDNINC=$IDN_PREFIX/include \
    IDNLIB=$IDN_PREFIX/lib \
    CURLINC=$CURL_PREFIX/include \
    CURLLIB=$CURL_PREFIX/lib \
    JPEGINC=$JPEG_PREFIX/include \
    JPEGLIB=$JPEG_PREFIX/lib \
    JBIGINC=$JBIG_PREFIX/include \
    JBIGLIB=$JBIG_PREFIX/lib \
    TIFFINC=$TIFF_PREFIX/include \
    TIFFLIB=$TIFF_PREFIX/lib \
    GEOTIFFINC=$GEOTIFF_PREFIX/include \
    GEOTIFFLIB=$GEOTIFF_PREFIX/lib \
    GEOTIFF_INC=$GEOTIFF_PREFIX/include \
    GEOTIFF_LIB=$GEOTIFF_PREFIX/lib \
    HDFINC=$HDF4_PREFIX/include \
    HDFLIB=$HDF4_PREFIX/lib \
    HDF4INC=$HDF4_PREFIX/include \
    HDF4LIB=$HDF4_PREFIX/lib \
    HDF5INC=$HDF5_PREFIX/include \
    HDF5LIB=$HDF5_PREFIX/lib \
    NCDF4INC=$NETCDF4_PREFIX/include \
    NCDF4LIB=$NETCDF4_PREFIX/lib \
    NETCDF4INC=$NETCDF4_PREFIX/include \
    NETCDF4LIB=$NETCDF4_PREFIX/lib \
    HDFEOSINC=$HDFEOS_PREFIX/include \
    HDFEOSLIB=$HDFEOS_PREFIX/lib \
    HDFEOS_INC=$HDFEOS_PREFIX/include \
    HDFEOS_LIB=$HDFEOS_PREFIX/lib \
    HDFEOS_GCTPINC=$HDFEOS_PREFIX/include \
    HDFEOS_GCTPLIB=$HDFEOS_PREFIX/lib \
    PROJ4_INC=$PROJ4_PREFIX/include \
    PROJ4_LIB=$PROJ4_PREFIX/lib \
    GDAL_INC=$GDAL_PREFIX/include \
    GDAL_LIB=$GDAL_PREFIX/lib


# --------------------------------------
# Needed for python to find installed shared libraries
# May also solve some hdfeos issues
ENV LD_LIBRARY_PATH=/usr/local/lib


# ----------------------------------------------------------------------------
# Section for building each of the external packages
# ----------------------------------------------------------------------------

# --------------------------------------
# Other libraries required from the CENTOS repo
#RUN yum install -y libjpeg-turbo libjpeg-turbo-devel libjpeg-turbo-static \
#    && yum clean metadata
#RUN yum install -y jbigkit jbigkit-devel jbigkit-libs \
#    && yum clean metadata
#RUN yum install -y libtiff libtiff-devel libtiff-static \
#    && yum clean metadata

# --------------------------------------
# Required for matplotlib only
RUN yum install -y freetype freetype-devel \
    && yum clean metadata
RUN yum install -y libpng libpng-devel libpng-static \
    && yum clean metadata


# --------------------------------------
# Install zlib
COPY external_tools/zlib-1.2.8.tar.gz $SRC_DIR
RUN cd $SRC_DIR \
    && tar -xvf zlib-1.2.8.tar.gz \
    && cd zlib-1.2.8 \
    && ./configure --prefix=$ZLIB_PREFIX \
    && make \
    && make install \
    && cd $SRC_DIR \
    && rm -rf zlib-1.2.8 zlib-1.2.8.tar.gz


# --------------------------------------
# Install xz to get the lzma library
COPY external_tools/xz-5.2.2.tar.gz $SRC_DIR
RUN cd $SRC_DIR \
    && tar -xvf xz-5.2.2.tar.gz \
    && cd xz-5.2.2 \
    && ./configure --prefix=$XZ_PREFIX \
        --enable-shared \
        --enable-static \
    && make \
    && make install \
    && cd $SRC_DIR \
    && rm -rf xz-5.2.2 xz-5.2.2.tar.gz


# --------------------------------------
# Install szip
COPY external_tools/szip-2.1.tar.gz $SRC_DIR
RUN cd $SRC_DIR \
    && tar -xvf szip-2.1.tar.gz \
    && cd szip-2.1 \
    && ./configure --prefix=$SZIP_PREFIX \
        --enable-shared \
        --enable-static \
    && make \
    && make install \
    && cd $SRC_DIR \
    && rm -rf szip-2.1 szip-2.1.tar.gz


# USE THE CENTOS REPO VERSIONS OF THIS????????
# CURRENTLY USING THE REPO VERSIONS
## --------------------------------------
## Install libpng
#COPY external_tools/libpng-1.6.21.tar.gz $SRC_DIR
#RUN cd $SRC_DIR \
#    && tar -xvf libpng-1.6.21.tar.gz \
#    && cd libpng-1.6.21 \
#    && ./configure --prefix=$PNG_PREFIX \
#        --with-zlib-prefix=$ZLIB_PREFIX \
#        --enable-shared \
#        --enable-static \
#    && make \
#    && make install \
#    && cd $SRC_DIR \
#    && rm -rf libpng-1.6.21 libpng-1.6.21.tar.gz


# USE THE CENTOS REPO VERSIONS OF THIS????????
# CURRENTLY USING THE REPO VERSIONS
## --------------------------------------
## Install freetype2
#COPY external_tools/freetype-2.6.3.tar.gz $SRC_DIR
#RUN cd $SRC_DIR \
#    && tar -xvf freetype-2.6.3.tar.gz \
#    && cd freetype-2.6.3 \
#    && ./configure --prefix=$FREETYPE2_PREFIX \
#        --with-zlib=yes \
#        --with-png=yes \
#        --enable-shared \
#        --enable-static \
#    && make \
#    && make install \
#    && cd $SRC_DIR \
#    && rm -rf freetype-2.6.3 freetype-2.6.3.tar.gz


# --------------------------------------
# Install libxml2
COPY external_tools/libxml2-2.9.3.tar.gz $SRC_DIR
RUN source /python-env/bin/activate \
    && cd $SRC_DIR \
    && tar -xvf libxml2-2.9.3.tar.gz \
    && cd libxml2-2.9.3 \
    && ./configure --prefix=$XML2_PREFIX \
        --with-zlib=$ZLIB_PREFIX \
        --with-lzma=$XZ_PREFIX \
        --with-python \
        --enable-shared \
        --enable-static \
    && make \
    && make install \
    && cd $SRC_DIR \
    && rm -rf libxml2-2.9.3 libxml2-2.9.3.tar.gz


# --------------------------------------
# Install libxslt
COPY external_tools/libxslt-1.1.28.tar.gz $SRC_DIR
RUN source /python-env/bin/activate \
    && cd $SRC_DIR \
    && tar -xvf libxslt-1.1.28.tar.gz \
    && cd libxslt-1.1.28 \
    && ./configure --prefix=$XSLT_PREFIX \
        --with-libxml-libs-prefix=$XML2LIB \
        --with-python \
        --enable-shared \
        --enable-static \
    && make \
    && make install \
    && cd $SRC_DIR \
    && rm -rf libxslt-1.1.28 libxslt-1.1.28.tar.gz


## --------------------------------------
## Install wgrib
#COPY external_tools/wgrib.tar.v1.8.1.2c /usr/local/src
#RUN cd /usr/local/src \
#    && mkdir wgrib \
#    && tar -xvf wgrib.tar.v1.8.1.2c -C wgrib \
#    && cd wgrib \
#    && make \
#    && cp wgrib /usr/local/bin \
#    && cd .. \
#    && rm -rf wgrib wgrib.tar.v1.8.1.2c
#
#
## --------------------------------------
## Install proj4
#COPY external_tools/proj-4.9.1.tar.gz /usr/local/src
#RUN cd /usr/local/src \
#    && tar -xvf proj-4.9.1.tar.gz \
#    && cd proj-4.9.1 \
#    && ./configure --prefix=/usr/local \
#       --enable-shared \
#       --enable-static \
#    && make \
#    && make install \
#    && cd .. \
#    && rm -rf proj-4.9.1 proj-4.9.1.tar.gz
#
#
## --------------------------------------
## Install libgeotiff
#COPY external_tools/libgeotiff-1.4.1.tar.gz /usr/local/src
#RUN cd /usr/local/src \
#    && tar -xvf libgeotiff-1.4.1.tar.gz \
#    && cd libgeotiff-1.4.1 \
#    && ./configure --prefix=/usr/local \
#       --with-jpeg=yes \
#       --with-zlib=yes \
#       --enable-shared \
#       --enable-static \
#    && make \
#    && make install \
#    && cd .. \
#    && rm -rf libgeotiff-1.4.1 libgeotiff-1.4.1.tar.gz
#
#
## --------------------------------------
## Install HDF4
#COPY external_tools/hdf-4.2.11.tar.gz /usr/local/src
#RUN cd /usr/local/src \
#    && tar -xvf hdf-4.2.11.tar.gz \
#    && cd hdf-4.2.11 \
#    && ./configure --prefix=/usr/local \
#       --disable-fortran \
#       --enable-shared \
#       --enable-static \
#       --enable-static-exec \
#    && make \
#    && make install \
#    && cd .. \
#    && rm -rf hdf-4.2.11  hdf-4.2.11.tar.gz
#
#
## --------------------------------------
## Install HDF5
#COPY external_tools/hdf5-1.8.16.tar.gz /usr/local/src
#RUN cd /usr/local/src \
#    && tar -xvf hdf5-1.8.16.tar.gz \
#    && cd hdf5-1.8.16 \
#    && ./configure --prefix=/usr/local \
#       --enable-threadsafe \
#       --enable-unsupported \
#       --with-pthread=/usr/lib64 \
#       --enable-shared \
#       --enable-static \
#    && make \
#    && make install \
#    && cd .. \
#    && rm -rf hdf5-1.8.16  hdf5-1.8.16.tar.gz
#
#
## --------------------------------------
## Install netcdf-4
#COPY external_tools/netcdf-4.4.0.tar.gz /usr/local/src
#RUN cd /usr/local/src \
#    && tar -xvf netcdf-4.4.0.tar.gz \
#    && cd netcdf-4.4.0 \
#    && ./configure --prefix=/usr/local \
#       --enable-netcdf-4 \
#       --enable-hdf4 \
#       --enable-shared \
#       --enable-static \
#    && make \
#    && make install \
#    && cd .. \
#    && rm -rf netcdf-4.4.0 netcdf-4.4.0.tar.gz
#
#
## --------------------------------------
## Install HDFEOS2
#COPY external_tools/HDF-EOS2.19v1.00.tar.Z /usr/local/src
#RUN cd /usr/local/src \
#    && tar -xvf HDF-EOS2.19v1.00.tar.Z \
#    && cd hdfeos \
#    && ./configure --prefix=/usr/local \
#       --enable-install-include \
#       --disable-shared \
#       --enable-static \
#       CC="/usr/local/bin/h4cc -Df2cFortran" \
#    && make \
#    && make install \
#    && cd .. \
#    && rm -rf hdfeos HDF-EOS2.19v1.00.tar.Z
#
#
## ----------------------------------------------------------------------------
## Python virtual environment setup
## GDAL is installed into python through the below installation, because Numpy
## must be installed into python before building GDAL
## --------------------------------------
#RUN source /python-env/bin/activate \
#    && pip install --upgrade pip \
#    && pip install \
#       python-dateutil==1.5 \
#       requests==2.2.1 \
#       lxml==3.3.3 \
#       numpy==1.10.2 \
#       matplotlib==1.5.0
#
#
## --------------------------------------
## Install GDAL
#COPY external_tools/gdal-1.11.4.tar.gz /usr/local/src
#RUN source /python-env/bin/activate \
#    && cd /usr/local/src \
#    && tar -xvf gdal-1.11.4.tar.gz \
#    && cd gdal-1.11.4 \
#    && ./configure --prefix=/usr/local \
#       --with-liblzma \
#       --with-python=yes \
#       --with-static-proj4=/usr/local/lib \
#       --enable-shared \
#       --enable-static \
#    && make \
#    && make install \
#    && cd .. \
#    && rm -rf gdal-1.11.4 gdal-1.11.4.tar.gz

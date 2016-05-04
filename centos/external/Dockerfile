FROM usgs.espa.centos.base
MAINTAINER USGS LSRD http://eros.usgs.gov

LABEL description="This is a build containing all of the cots software we use installed into the image."


# ----------------------------------------------------------------------------
# Configuration of many of the environment variables to reduce intermediate
# docker image generation.
# ----------------------------------------------------------------------------

# --------------------------------------
# Source and installation locations
#ENV ZLIB_SOURCE=/usr/local/src/zlib \
#    ZLIB_PREFIX=/usr/local \
#    XZ_SOURCE=/usr/local/src/xz \
#    XZ_PREFIX=/usr/local \
#    SZIP_SOURCE=/usr/local/src/szip \
#    SZIP_PREFIX=/usr/local \
#    PNG_SOURCE=/usr/local/src/libpng \
#    PNG_PREFIX=/usr/local \
#    FREETYPE2_SOURCE=/usr/local/src/freetype2 \
#    FREETYPE2_PREFIX=/usr/local \
#    XML2_SOURCE=/usr/local/src/xml2 \
#    XML2_PREFIX=/usr/local \
#    XSLT_SOURCE=/usr/local/src/xslt \
#    XSLT_PREFIX=/usr/local \
#    IDN_SOURCE=/usr/local/src/idn \
#    IDN_PREFIX=/usr/local \
#    CURL_SOURCE=/usr/local/src/curl \
#    CURL_PREFIX=/usr/local \
#    WGRIB_SOURCE=/usr/local/src/wgrib \
#    WGRIB_PREFIX=/usr/local \
#    JPEG_SOURCE=/usr/local/src/jpeg \
#    JPEG_PREFIX=/usr/local \
#    JBIG_SOURCE=/usr/local/src/libjbigkit \
#    JBIG_PREFIX=/usr/local \
#    TIFF_SOURCE=/usr/local/src/tiff \
#    TIFF_PREFIX=/usr/local \
#    GEOTIFF_SOURCE=/usr/local/src/libgeotiff \
#    GEOTIFF_PREFIX=/usr/local \
#    HDF4_SOURCE=/usr/local/src/hdf4 \
#    HDF4_PREFIX=/usr/local \
#    HDF5_SOURCE=/usr/local/src/hdf5 \
#    HDF5_PREFIX=/usr/local \
#    NETCDF4_SOURCE=/usr/local/src/netcdf4 \
#    NETCDF4_PREFIX=/usr/local \
#    HDFEOS_SOURCE=/usr/local/src/hdfeos \
#    HDFEOS_PREFIX=/usr/local \
#    PROJ4_SOURCE=/usr/local/src/proj4 \
#    PROJ4_PREFIX=/usr/local \
#    GDAL_SOURCE=/usr/local/src/gdal \
#    GDAL_PREFIX=/usr/local
#
# --------------------------------------
# Include and library paths
#ENV ZLIBINC=$ZLIB_PREFIX/include \
#    ZLIBLIB=$ZLIB_PREFIX/lib \
#    XZINC=$XZ_PREFIX/include \
#    XZLIB=$XZ_PREFIX/lib \
#    LZMAINC=$XZ_PREFIX/include \
#    LZMALIB=$XZ_PREFIX/lib \
#    SZIPINC=$SZIP_PREFIX/include \
#    SZIPLIB=$SZIP_PREFIX/lib \
#    PNGINC=$PNG_PREFIX/include \
#    PNGLIB=$PNG_PREFIX/lib \
#    FREETYPE2INC=$FREETYPE2_PREFIX/include \
#    FREETYPE2LIB=$FREETYPE2_PREFIX/lib \
#    XML2INC=$XML2_PREFIX/include/libxml2 \
#    XML2LIB=$XML2_PREFIX/lib \
#    XSLTINC=$XSLT_PREFIX/include/libxslt \
#    XSLTLIB=$XSLT_PREFIX/lib \
#    IDNINC=$IDN_PREFIX/include \
#    IDNLIB=$IDN_PREFIX/lib \
#    CURLINC=$CURL_PREFIX/include \
#    CURLLIB=$CURL_PREFIX/lib \
#    JPEGINC=$JPEG_PREFIX/include \
#    JPEGLIB=$JPEG_PREFIX/lib \
#    JBIGINC=$JBIG_PREFIX/include \
#    JBIGLIB=$JBIG_PREFIX/lib \
#    TIFFINC=$TIFF_PREFIX/include \
#    TIFFLIB=$TIFF_PREFIX/lib \
#    GEOTIFFINC=$GEOTIFF_PREFIX/include \
#    GEOTIFFLIB=$GEOTIFF_PREFIX/lib \
#    GEOTIFF_INC=$GEOTIFF_PREFIX/include \
#    GEOTIFF_LIB=$GEOTIFF_PREFIX/lib \
#    HDFINC=$HDF4_PREFIX/include \
#    HDFLIB=$HDF4_PREFIX/lib \
#    HDF4INC=$HDF4_PREFIX/include \
#    HDF4LIB=$HDF4_PREFIX/lib \
#    HDF5INC=$HDF5_PREFIX/include \
#    HDF5LIB=$HDF5_PREFIX/lib \
#    NCDF4INC=$NETCDF4_PREFIX/include \
#    NCDF4LIB=$NETCDF4_PREFIX/lib \
#    NETCDF4INC=$NETCDF4_PREFIX/include \
#    NETCDF4LIB=$NETCDF4_PREFIX/lib \
#    HDFEOSINC=$HDFEOS_PREFIX/include \
#    HDFEOSLIB=$HDFEOS_PREFIX/lib \
#    HDFEOS_INC=$HDFEOS_PREFIX/include \
#    HDFEOS_LIB=$HDFEOS_PREFIX/lib \
#    HDFEOS_GCTPINC=$HDFEOS_PREFIX/include \
#    HDFEOS_GCTPLIB=$HDFEOS_PREFIX/lib \
#    PROJ4_INC=$PROJ4_PREFIX/include \
#    PROJ4_LIB=$PROJ4_PREFIX/lib \
#    GDAL_INC=$GDAL_PREFIX/include \
#    GDAL_LIB=$GDAL_PREFIX/lib


# --------------------------------------
# Needed for python to find installed shared libraries
ENV LD_LIBRARY_PATH=/usr/local/lib


# ----------------------------------------------------------------------------
# Section for building each of the external packages
# ----------------------------------------------------------------------------

# Other libraries required from centos
RUN yum install -y freetype freetype-devel \
    && yum clean metadata
RUN yum install -y libpng libpng-devel libpng-static \
    && yum clean metadata
RUN yum install -y libxml2 libxml2-devel libxslt libxslt-devel \
    && yum clean metadata
RUN yum install -y libjpeg-turbo libjpeg-turbo-devel libjpeg-turbo-static \
    && yum clean metadata
RUN yum install -y jbigkit jbigkit-devel jbigkit-libs \
    && yum clean metadata
RUN yum install -y libtiff libtiff-devel libtiff-static \
    && yum clean metadata

# --------------------------------------
# Install szip
COPY external_tools/szip-2.1.tar.gz /usr/local/src
RUN cd /usr/local/src \
    && tar -xvf szip-2.1.tar.gz \
    && cd szip-2.1 \
    && ./configure --prefix=/usr/local \
        --enable-shared \
        --enable-static \
    && make \
    && make install \
    && make clean \
    && cd .. \
    && rm -rf szip-2.1 szip-2.1.tar.gz

# --------------------------------------
# Install wgrib
COPY external_tools/wgrib.tar.v1.8.1.2c /usr/local/src
RUN cd /usr/local/src \
    && mkdir wgrib \
    && tar -xvf wgrib.tar.v1.8.1.2c -C wgrib \
    && cd wgrib \
    && make \
    && cp wgrib /usr/local/bin \
    && cd .. \
    && rm -rf wgrib wgrib.tar.v1.8.1.2c

# --------------------------------------
# Install proj4
COPY external_tools/proj-4.9.1.tar.gz /usr/local/src
RUN cd /usr/local/src \
    && tar -xvf proj-4.9.1.tar.gz \
    && cd proj-4.9.1 \
    && ./configure --prefix=/usr/local \
       --enable-shared \
       --enable-static \
    && make \
    && make install \
    && cd .. \
    && rm -rf proj-4.9.1 proj-4.9.1.tar.gz

# --------------------------------------
# Install libgeotiff
COPY external_tools/libgeotiff-1.4.1.tar.gz /usr/local/src
RUN cd /usr/local/src \
    && tar -xvf libgeotiff-1.4.1.tar.gz \
    && cd libgeotiff-1.4.1 \
    && ./configure --prefix=/usr/local \
       --with-jpeg=yes \
       --with-zlib=yes \
       --enable-shared \
       --enable-static \
    && make \
    && make install \
    && cd .. \
    && rm -rf libgeotiff-1.4.1 libgeotiff-1.4.1.tar.gz

# --------------------------------------
# Install HDF4
COPY external_tools/hdf-4.2.11.tar.gz /usr/local/src
RUN cd /usr/local/src \
    && tar -xvf hdf-4.2.11.tar.gz \
    && cd hdf-4.2.11 \
    && ./configure --prefix=/usr/local \
       --disable-fortran \
       --enable-shared \
       --enable-static \
       --enable-static-exec \
    && make \
    && make install \
    && cd .. \
    && rm -rf hdf-4.2.11  hdf-4.2.11.tar.gz

# --------------------------------------
# Install HDF5
COPY external_tools/hdf5-1.8.16.tar.gz /usr/local/src
RUN cd /usr/local/src \
    && tar -xvf hdf5-1.8.16.tar.gz \
    && cd hdf5-1.8.16 \
    && ./configure --prefix=/usr/local \
       --enable-threadsafe \
       --enable-unsupported \
       --with-pthread=/usr/lib64 \
       --enable-shared \
       --enable-static \
    && make \
    && make install \
    && cd .. \
    && rm -rf hdf5-1.8.16  hdf5-1.8.16.tar.gz


# --------------------------------------
# Install netcdf-4
COPY external_tools/netcdf-4.4.0.tar.gz /usr/local/src
RUN cd /usr/local/src \
    && tar -xvf netcdf-4.4.0.tar.gz \
    && cd netcdf-4.4.0 \
    && ./configure --prefix=/usr/local \
       --enable-netcdf-4 \
       --enable-hdf4 \
       --enable-shared \
       --enable-static \
    && make \
    && make install \
    && cd .. \
    && rm -rf netcdf-4.4.0 netcdf-4.4.0.tar.gz

# --------------------------------------
# Install HDFEOS2
COPY external_tools/HDF-EOS2.19v1.00.tar.Z /usr/local/src
RUN cd /usr/local/src \
    && tar -xvf HDF-EOS2.19v1.00.tar.Z \
    && cd hdfeos \
    && ./configure --prefix=/usr/local \
       --enable-install-include \
       --disable-shared \
       --enable-static \
       CC="/usr/local/bin/h4cc -Df2cFortran" \
    && make \
    && make install \
    && cd .. \
    && rm -rf hdfeos HDF-EOS2.19v1.00.tar.Z


# ----------------------------------------------------------------------------
# Python virtual environment setup
# GDAL is installed into python through the below installation
# ----------------------------------------------------------------------------
# ----------------------------------------------------------------------------
# ----------------------------------------------------------------------------
# Numpy must be installed into python before building GDAL
# ----------------------------------------------------------------------------
# ----------------------------------------------------------------------------
# ----------------------------------------------------------------------------
RUN source /python-env/bin/activate \
    && pip install --upgrade pip \
    && pip install \
       python-dateutil==1.5 \
       requests==2.2.1 \
       lxml==3.3.3 \
       numpy==1.10.2 \
       matplotlib==1.5.0

# --------------------------------------
# Install GDAL
COPY external_tools/gdal-1.11.4.tar.gz /usr/local/src
RUN source /python-env/bin/activate \
    && cd /usr/local/src \
    && tar -xvf gdal-1.11.4.tar.gz \
    && cd gdal-1.11.4 \
    && ./configure --prefix=/usr/local \
       --with-python=yes \
       --with-static-proj4=/usr/local/lib \
       --enable-shared \
       --enable-static \
    && make \
    && make install \
    && cd .. \
    && rm -rf gdal-1.11.4 gdal-1.11.4.tar.gz

FROM usgs-espa/ubuntu-python
MAINTAINER USGS LSRD http://eros.usgs.gov

LABEL description="This is a build containing all of the cots software we use \
installed into the image."


# ----------------------------------------------------------------------------
# Configuration of many of the environment variables to reduce intermediate
# docker image generation.
# ----------------------------------------------------------------------------

# --------------------------------------
# Source and installation locations
ENV ZLIB_SOURCE=/usr/local/src/zlib \
    ZLIB_PREFIX=/usr/local \
    XZ_SOURCE=/usr/local/src/xz \
    XZ_PREFIX=/usr/local \
    SZIP_SOURCE=/usr/local/src/szip \
    SZIP_PREFIX=/usr/local \
    XML2_SOURCE=/usr/local/src/xml2 \
    XML2_PREFIX=/usr/local \
    XSLT_SOURCE=/usr/local/src/xslt \
    XSLT_PREFIX=/usr/local \
    IDN_SOURCE=/usr/local/src/idn \
    IDN_PREFIX=/usr/local \
    CURL_SOURCE=/usr/local/src/curl \
    CURL_PREFIX=/usr/local \
    WGRIB_SOURCE=/usr/local/src/wgrib \
    WGRIB_PREFIX=/usr/local \
    JPEG_SOURCE=/usr/local/src/jpeg \
    JPEG_PREFIX=/usr/local \
    JBIG_SOURCE=/usr/local/src/libjbigkit \
    JBIG_PREFIX=/usr/local \
    TIFF_SOURCE=/usr/local/src/tiff \
    TIFF_PREFIX=/usr/local \
    GEOTIFF_SOURCE=/usr/local/src/libgeotiff \
    GEOTIFF_PREFIX=/usr/local \
    HDF4_SOURCE=/usr/local/src/hdf4 \
    HDF4_PREFIX=/usr/local \
    HDF5_SOURCE=/usr/local/src/hdf5 \
    HDF5_PREFIX=/usr/local \
    NETCDF4_SOURCE=/usr/local/src/netcdf4 \
    NETCDF4_PREFIX=/usr/local \
    HDFEOS_SOURCE=/usr/local/src/hdfeos \
    HDFEOS_PREFIX=/usr/local \
    GDAL_SOURCE=/usr/local/src/gdal \
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
    GDAL_INC=$GDAL_PREFIX/include \
    GDAL_LIB=$GDAL_PREFIX/lib


# ----------------------------------------------------------------------------
# Section for building each of the cots packages
# ----------------------------------------------------------------------------

# --------------------------------------
# Install zlib
COPY ./cots_src/zlib-1.2.8 $ZLIB_SOURCE
RUN cd $ZLIB_SOURCE \
    && ./configure --prefix=$ZLIB_PREFIX \
    && make \
    && make install \
    && make clean \
    && cd ..
#    && rm -rf $ZLIB_SOURCE

# --------------------------------------
# Install xz
COPY ./cots_src/xz-5.2.1 $XZ_SOURCE
RUN cd $XZ_SOURCE \
    && ./configure --prefix=$XZ_PREFIX \
    && make \
    && make install \
    && make clean \
    && cd ..
#    && rm -rf $XZ_SOURCE

# --------------------------------------
# Install szip
COPY ./cots_src/szip-2.1 $SZIP_SOURCE
RUN cd $SZIP_SOURCE \
    && ./configure --prefix=$SZIP_PREFIX \
    && make \
    && make install \
    && make clean \
    && cd ..
#    && rm -rf $SZIP_SOURCE

# --------------------------------------
# Install libxml2
COPY ./cots_src/libxml2-2.9.3 $XML2_SOURCE
RUN cd $XML2_SOURCE \
    && ./configure --prefix=$XML2_PREFIX \
        --with-zlib=$ZLIB_PREFIX \
        --with-lzma=$XZ_PREFIX \
        --without-python \
        --enable-shared \
        --enable-static \
    && make \
    && make install \
    && make clean \
    && cd ..
#    && rm -rf $XML2_SOURCE

# --------------------------------------
# Install libxslt
COPY ./cots_src/libxslt-1.1.28 $XSLT_SOURCE
RUN cd $XSLT_SOURCE \
    && ./configure --prefix=$XSLT_PREFIX \
        --with-libxml-libs-prefix=$XSLTLIB \
        --without-python \
        --enable-shared \
        --enable-static \
    && make \
    && make install \
    && make clean \
    && cd ..
#    && rm -rf $XSLT_SOURCE

# --------------------------------------
# Install libidn
COPY ./cots_src/libidn-1.32 $IDN_SOURCE
RUN cd $IDN_SOURCE \
    && ./configure --prefix=$IDN_PREFIX \
        --enable-shared \
        --enable-static \
    && make \
    && make install \
    && make clean \
    && cd ..
#    && rm -rf $IDN_SOURCE

# --------------------------------------
# Install curl
COPY ./cots_src/curl-7.43.0 $CURL_SOURCE
RUN cd $CURL_SOURCE \
    && ./configure --prefix=$CURL_PREFIX \
        --with-zlib=$ZLIB_PREFIX \
        --without-ssl \
        --without-gssapi \
        --enable-shared \
        --enable-static \
    && make \
    && make install \
    && make clean \
    && cd ..
#    && rm -rf $CURL_SOURCE

# --------------------------------------
# Install wgrib
COPY ./cots_src/wgrib.v1.8.1.2c $WGRIB_SOURCE
RUN cd $WGRIB_SOURCE \
    && make \
    && mkdir -p $WGRIB_PREFIX/bin \
    && cp wgrib $WGRIB_PREFIX/bin \
    && rm -rf $WGRIB_SOURCE

# --------------------------------------
# Install jpeg
# These are needed with jpeg-6b
#    && make install-lib \
#    && make install-headers \
#
COPY ./cots_src/jpeg-9a $JPEG_SOURCE
RUN cd $JPEG_SOURCE \
    && mkdir -p $JPEG_PREFIX/bin/cjpeg \
    && mkdir -p $JPEG_PREFIX/man/man1 \
    && mkdir -p $JPEGINC \
    && mkdir -p $JPEGLIB \
    && ./configure --prefix=$JPEG_PREFIX \
    && make \
    && make install \
    && make clean \
    && cd ..
#    && rm -rf $JPEG_SOURCE

# --------------------------------------
# Install jbigkit
COPY ./cots_src/jbigkit-2.1 $JBIG_SOURCE
RUN cd $JBIG_SOURCE \
    && make \
    && mkdir -p $JBIGINC \
    && mkdir -p $JBIGLIB \
    && /usr/bin/install libjbig/libjbig.a $JBIGLIB/libjbig.a \
    && /usr/bin/install libjbig/libjbig85.a $JBIGLIB/libjbig85.a \
    && /usr/bin/install libjbig/*.h $JBIGINC \
    && make clean \
    && cd ..
#    && rm -rf $JBIG_SOURCE

# --------------------------------------
# Install tiff
COPY ./cots_src/tiff-4.0.6 $TIFF_SOURCE
RUN cd $TIFF_SOURCE \
    && ./configure --prefix=$TIFF_PREFIX \
        --with-jpeg-include-dir=$JPEGINC \
        --with-jpeg-lib-dir=$JPEGLIB \
        --with-jbig-include-dir=$JBIGINC \
        --with-jbig-lib-dir=$JBIGLIB \
        --with-zlib-include-dir=$ZLIBINC \
        --with-zlib-lib-dir=$ZLIBLIB \
        --with-lzma-include-dir=$LZMAINC \
        --with-lzma-lib-dir=$LZMALIB \
        --enable-shared \
        --enable-static \
    && make \
    && make install \
    && make clean \
    && cd ..
#    && rm -rf $TIFF_SOURCE

# --------------------------------------
# Install libgeotiff
COPY ./cots_src/libgeotiff-1.4.1 $GEOTIFF_SOURCE
RUN cd $GEOTIFF_SOURCE \
    && ./configure --prefix=$GEOTIFF_PREFIX \
        --with-jpeg-include-dir=$JPEGINC \
        --with-jpeg-lib-dir=$JPEGLIB \
        --with-zlib-include-dir=$ZLIBINC \
        --with-zlib-lib-dir=$ZLIBLIB \
        --with-libtiff=$TIFF_PREFIX \
        --without-proj \
        --enable-shared \
        --enable-static \
    && make \
    && make install \
    && make clean \
    && cd ..
#    && rm -rf $GEOTIFF_SOURCE

# --------------------------------------
# Install HDF4
COPY ./cots_src/hdf-4.2.11 $HDF4_SOURCE
RUN cd $HDF4_SOURCE \
    && ./configure --prefix=$HDF4_PREFIX \
        --with-jpeg=$JPEGLIB \
        --with-zlib=$ZLIBLIB \
        --with-szlib=$SZIPLIB \
        --disable-netcdf \
        --disable-fortran \
        --enable-shared \
        --enable-static \
        --enable-static-exec \
        --with-gnu-ld \
    && make \
    && make install \
    && make clean \
    && cd ..
#    && rm -rf $HDF4_SOURCE

# --------------------------------------
# Install HDF5
COPY ./cots_src/hdf5-1.8.15-patch1 $HDF5_SOURCE
RUN cd $HDF5_SOURCE \
    && ./configure --prefix=$HDF5_PREFIX \
        --with-zlib=$ZLIBINC,$ZLIBLIB \
        --with-szlib=$SZIPINC,$SZIPLIB \
        --enable-threadsafe \
        --with-pthread=/usr/lib64 \
        --enable-shared \
        --enable-static \
    && make \
    && make install \
    && make clean \
    && cd ..
#    && rm -rf $HDF5_SOURCE

# --------------------------------------
# Install netcdf-4
COPY ./cots_src/netcdf-4.3.3.1 $NETCDF4_SOURCE
RUN cd $NETCDF4_SOURCE \
    && CPPFLAGS="-I$CURLINC -I$ZLIBINC -I$SZIPINC -I$HDF5INC" \
       LDFLAGS="-L$CURLLIB -L$ZLIBLIB -L$SZIPLIB -L$HDF5LIB" \
       ./configure --prefix=$NETCDF4_PREFIX \
           --enable-netcdf-4 \
           --enable-shared \
           --enable-static \
    && make \
    && make install \
    && make clean \
    && cd ..
#    && rm -rf $NETCDF4_SOURCE

# --------------------------------------
# Install hdfeos2
COPY ./cots_src/hdfeos-2.19 $HDFEOS_SOURCE
RUN cd $HDFEOS_SOURCE \
    && ./configure CC="$HDF4_PREFIX/bin/h4cc -Df2cFortran" \
        --prefix=$HDFEOS_PREFIX \
        --with-jpeg=$JPEGLIB \
        --with-zlib=$ZLIBLIB \
        --disable-shared \
        --enable-static \
        --with-gnu-ld \
    && make \
    && make install \
    && make clean \
    && cd ..
#    && rm -rf $HDFEOS_SOURCE

# --------------------------------------
# Install GDAL
COPY ./cots_src/gdal-1.11.1 $GDAL_SOURCE
RUN . /python-virtual/bin/activate \
    && cd $GDAL_SOURCE \
    && ./configure --prefix=$GDAL_PREFIX \
        --with-liblzma \
        --enable-shared \
        --enable-static \
        --with-python=yes \
    && make \
    && make install \
    && make clean \
    && cd ..
#    && rm -rf $GDAL_SOURCE


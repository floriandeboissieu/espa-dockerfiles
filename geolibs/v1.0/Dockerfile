# =======================================================
#   Environments Layer
# =======================================================
FROM centos:7.3.1611 as environvars
MAINTAINER USGS EROS LSRD http://eros.usgs.gov

# ` Compilers and all the rquired libraries
ENV GIT_VERSION=2.9.5 \
	GIT_SHA256=36658cb768a54c1d4dec43c3116c27ed893e88b02ecfcb44f2166f9c0b7f2a0d \
	XZ_VERSION=5.2.2 \
	XZ_SHA256=73df4d5d34f0468bd57d09f2d8af363e95ed6cc3a4a86129d2f2c366259902a2 \
    CURL_VERSION=7.48.0 \
    CURL_SHA256=d248f3f9288ae20b8a7e462cb1909a6e67ad5c585040bca64fa2a71d993f3b1b  \
    HDFEOS_VERSION=2.19v1.00 \
    HDFEOS_SHA256=3fffa081466e85d2b9436d984bc44fe97bbb33ad9d8b7055a322095dc4672e31  \
	GDAL_VERSION=1.11.4 \
    GDAL_SHA256=f60e736db626b9d7ca3549bdd53d1699950af488ed4190b4ddb54c71d22411be  \
	HDF4_VERSION=4.2.11 \
    HDF4_SHA256=c3f7753b2fb9b27d09eced4d2164605f111f270c9a60b37a578f7de02de86d24  \
	HDF5_VERSION=1.8.16 \
    HDF5_SHA256=ed17178abd9928a7237f30370189ba767b9e39e0db45917c2ac4665eb9cb4771  \
	JBIGKIT_VERSION=2.1 \
    JBIGKIT_SHA256=de7106b6bfaf495d6865c7dd7ac6ca1381bd12e0d81405ea81e7f2167263d932  \
	JPEG_VERSION=v9b \
	JPEG_SHA256=240fd398da741669bf3c90366f58452ea59041cacc741a489b99f2f6a0bad052  \
	LIBGEOTIFF_VERSION=1.4.1 \
	LIBGEOTIFF_SHA256=acfc76ee19b3d41bb9c7e8b780ca55d413893a96c09f3b27bdb9b2573b41fd23  \
	LIBIDN_VERSION=1.32 \
	LIBIDN_SHA256=ba5d5afee2beff703a34ee094668da5c6ea5afa38784cebba8924105e185c4f5  \
	LIBXML2_VERSION=2.9.3 \
	LIBXML2_SHA256=4de9e31f46b44d34871c22f54bfc54398ef124d6f7cafb1f4a5958fbcd3ba12d  \
	LIBXSLT_VERSION=1.1.28 \
	LIBXSLT_SHA256=5fc7151a57b89c03d7b825df5a0fae0a8d5f05674c0e7cf2937ecec4d54a028c  \
	NETCDF4_VERSION=4.4.0 \
	NETCDF4_SHA256=0d40cb7845abd03c363abcd5f57f16e3c0685a0faf8badb2c59867452f6bcf78  \
	PROJ4_VERSION=4.9.1 \
	PROJ4_SHA256=fca0388f3f8bc5a1a803d2f6ff30017532367992b30cf144f2d39be88f36c319  \
	SZIP_VERSION=2.1 \
	SZIP_SHA256=a816d95d5662e8279625abdbea7d0e62157d7d1f028020b1075500bf483ed5ef  \
	TIFF_VERSION=4.0.6 \
	TIFF_SHA256=4d57a50907b510e3049a4bba0d7888930fdfc16ce49f1bf693e5b6247370d68c


# ` Source and installation locations
ENV PREFIX=/usr/local \
    SRC_DIR=/usr/local/src \
    ZLIB_PREFIX=/usr/local \
    XZ_PREFIX=/usr/local \
    SZIP_PREFIX=/usr/local \
    XML2_PREFIX=/usr/local \
    XSLT_PREFIX=/usr/local \
    IDN_PREFIX=/usr/local/idn \
    CURL_PREFIX=/usr/local/curl \
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


# ` Include and library paths
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
    PROJ4_INC=$PROJ4_PREFIX/include \
    PROJ4_LIB=$PROJ4_PREFIX/lib \
    GDAL_INC=$GDAL_PREFIX/include \
    GDAL_LIB=$GDAL_PREFIX/lib


# ` Needed for python to find installed shared libraries
# ` May also solve some hdfeos issues
ENV LD_LIBRARY_PATH=/usr/lib64:/usr/local/lib

# =======================================================
#   Build Layer
# =======================================================
FROM environvars as builders
WORKDIR ${SRC_DIR}}


# ` Update the OS packages to the latest versions
RUN yum update -y \
    && yum clean metadata


# ` Required for additional tools installed later
RUN yum install -y \
        epel-release \
    && yum clean metadata


# ` Initial Python Configuration
RUN yum install -y \
        python-pip \
        python-devel \
    && pip install --upgrade pip \
    && yum clean metadata


# ` Additional tools provided by the OS required for ESPA
RUN yum install -y \
        wget \
        wgrib \
    && yum clean metadata


# ` Compilers and all the rquired libraries
RUN yum group install -y "Development Tools" \
    && yum install -y \
        e2fsprogs \
        expat-devel \
        freetype-devel \
        glibc-static \
        libcurl-devel \
        libidn-devel \
        libgfortran-static \
        libquadmath-static \
        perl-ExtUtils-MakeMaker \
        texinfo \
        bzip2-devel \
        zlib-devel \
        zlib-static \
        libpng-devel \
        libpng-static \
        rpm-build \
    && yum clean metadata


# ` Update git to a version that isn't broken
RUN wget -nv https://mirrors.edge.kernel.org/pub/software/scm/git/git-${GIT_VERSION}.tar.gz \
    && sha256sum git-${GIT_VERSION}.tar.gz | grep -E "^${GIT_SHA256}" \
    && cd ${SRC_DIR} \
    && tar -xvf git-${GIT_VERSION}.tar.gz \
    && cd git-${GIT_VERSION} \
    && make configure \
    && ./configure --without-tcltk \
    && make -j4 \
    && make install \
    && cd ${SRC_DIR} \
    && rm -rf .*


# ` Install xz to get the lzma library
RUN wget -nv http://tukaani.org/xz/xz-${XZ_VERSION}.tar.gz \
    && sha256sum xz-${XZ_VERSION}.tar.gz | grep -E "^${XZ_SHA256}" \
    && cd ${SRC_DIR} \
    && tar -xvf xz-${XZ_VERSION}.tar.gz \
    && cd xz-${XZ_VERSION} \
    && ./configure --prefix=$XZ_PREFIX \
        --enable-static \
    && make -j4 \
    && make install \
    && cd ${SRC_DIR} \
    && rm -rf .*


# ` Install szip
RUN wget -nv http://www.hdfgroup.org/ftp/lib-external/szip/previous/${SZIP_VERSION}/src/szip-${SZIP_VERSION}.tar.gz \
    && sha256sum szip-${SZIP_VERSION}.tar.gz | grep -E "^${SZIP_SHA256}" \
    && cd ${SRC_DIR} \
    && tar -xvf szip-${SZIP_VERSION}.tar.gz \
    && cd szip-${SZIP_VERSION} \
    && ./configure --prefix=$SZIP_PREFIX \
        --enable-shared \
        --enable-static \
    && make -j4 \
    && make install \
    && cd ${SRC_DIR} \
    && rm -rf .*


# ` Install libxml2
RUN wget -nv ftp://xmlsoft.org/libxml2/libxml2-${LIBXML2_VERSION}.tar.gz \
    && sha256sum libxml2-${LIBXML2_VERSION}.tar.gz | grep -E "^${LIBXML2_SHA256}" \
    && cd ${SRC_DIR} \
    && tar -xvf libxml2-${LIBXML2_VERSION}.tar.gz \
    && cd libxml2-${LIBXML2_VERSION} \
    && ./configure --prefix=${XML2_PREFIX} \
        --with-zlib=${ZLIB_PREFIX} \
        --with-lzma=${XZ_PREFIX} \
        --with-python \
        --enable-shared \
        --enable-static \
    && make -j4 \
    && make install \
    && cd ${SRC_DIR} \
    && rm -rf .*


# ` Install libxslt
RUN wget -nv ftp://xmlsoft.org/libxslt/libxslt-${LIBXSLT_VERSION}.tar.gz \
    && sha256sum libxslt-${LIBXSLT_VERSION}.tar.gz | grep -E "^${LIBXSLT_SHA256}" \
    && cd ${SRC_DIR} \
    && tar -xvf libxslt-${LIBXSLT_VERSION}.tar.gz \
    && cd libxslt-${LIBXSLT_VERSION} \
    && ./configure --prefix=${XSLT_PREFIX} \
        --with-libxml-libs-prefix=${XML2LIB} \
        --with-python \
        --enable-shared \
        --enable-static \
    && make -j4 \
    && make install \
    && cd ${SRC_DIR} \
    && rm -rf .*


# ` Install jpeg
RUN wget -nv http://www.ijg.org/files/jpegsrc.${JPEG_VERSION}.tar.gz \
    && sha256sum jpegsrc.${JPEG_VERSION}.tar.gz | grep -E "^${JPEG_SHA256}" \
    && cd ${SRC_DIR} \
    && tar -xvf jpegsrc.${JPEG_VERSION}.tar.gz \
    && cd jpeg-${JPEG_VERSION} \
    && ./configure --prefix=${JPEG_PREFIX} \
        --enable-shared \
        --enable-static \
    && make -j4 \
    && make install \
    && cd ${SRC_DIR} \
    && rm -rf .*


# ` Install jbigkit
RUN wget -nv https://www.cl.cam.ac.uk/~mgk25/jbigkit/download/jbigkit-${JBIGKIT_VERSION}.tar.gz \
    && sha256sum jbigkit-${JBIGKIT_VERSION}.tar.gz | grep -E "^${JBIGKIT_SHA256}" \
    && cd ${SRC_DIR} \
    && tar -xvf jbigkit-${JBIGKIT_VERSION}.tar.gz \
    && cd jbigkit-${JBIGKIT_VERSION} \
    && make -j4 \
    && /usr/bin/install libjbig/libjbig.a ${JBIGLIB}/libjbig.a \
    && /usr/bin/install libjbig/libjbig85.a ${JBIGLIB}/libjbig85.a \
    && /usr/bin/install libjbig/*.h ${JBIGINC} \
    && cd ${SRC_DIR} \
    && rm -rf .*


# ` Install proj4
RUN wget -nv http://download.osgeo.org/proj/proj-${PROJ4_VERSION}.tar.gz \
    && sha256sum proj-${PROJ4_VERSION}.tar.gz | grep -E "^${PROJ4_SHA256}" \
    && cd ${SRC_DIR} \
    && tar -xvf proj-${PROJ4_VERSION}.tar.gz \
    && cd proj-${PROJ4_VERSION} \
    && ./configure --prefix=${PROJ4_PREFIX} \
        --enable-shared \
        --enable-static \
    && make -j4 \
    && make install \
    && cd ${SRC_DIR} \
    && rm -rf .*


# ` Install tiff
RUN wget -nv http://download.osgeo.org/libtiff/tiff-${TIFF_VERSION}.tar.gz \
    && sha256sum tiff-${TIFF_VERSION}.tar.gz | grep -E "^${TIFF_SHA256}" \
    && cd ${SRC_DIR} \
    && tar -xvf tiff-${TIFF_VERSION}.tar.gz \
    && cd tiff-${TIFF_VERSION} \
    && ./configure --prefix=${TIFF_PREFIX} \
        --with-jpeg-include-dir=${JPEGINC} \
        --with-jpeg-lib-dir=${JPEGLIB} \
        --with-jbig-include-dir=${JBIGINC} \
        --with-jbig-lib-dir=${JBIGLIB} \
        --with-zlib-include-dir=${ZLIBINC} \
        --with-zlib-lib-dir=${ZLIBLIB} \
        --with-lzma-include-dir=${LZMAINC} \
        --with-lzma-lib-dir=${LZMALIB} \
        --enable-shared \
        --enable-static \
    && make -j4 \
    && make install \
    && cd ${SRC_DIR} \
    && rm -rf .*


# ` Install libgeotiff
RUN wget -nv http://download.osgeo.org/geotiff/libgeotiff/libgeotiff-${LIBGEOTIFF_VERSION}.tar.gz \
    && sha256sum libgeotiff-${LIBGEOTIFF_VERSION}.tar.gz | grep -E "^${LIBGEOTIFF_SHA256}" \
    && cd ${SRC_DIR} \
    && tar -xvf libgeotiff-${LIBGEOTIFF_VERSION}.tar.gz \
    && cd libgeotiff-${LIBGEOTIFF_VERSION} \
    && ./configure --prefix=${GEOTIFF_PREFIX} \
        --with-jpeg-include-dir=${JPEGINC} \
        --with-jpeg-lib-dir=${JPEGLIB} \
        --with-zlib-include-dir=${ZLIBINC} \
        --with-zlib-lib-dir=${ZLIBLIB} \
        --enable-shared \
        --enable-static \
    && make -j4 \
    && make install \
    && cd ${SRC_DIR} \
    && rm -rf .*


# ` Install curl
RUN wget -nv https://curl.haxx.se/download/curl-${CURL_VERSION}.tar.gz \
    && sha256sum curl-${CURL_VERSION}.tar.gz | grep -E "^${CURL_SHA256}" \
    && cd ${SRC_DIR} \
    && tar -xvf curl-${CURL_VERSION}.tar.gz \
    && cd curl-${CURL_VERSION} \
    && ./configure --prefix=${CURL_PREFIX} \
        --enable-shared \
        --enable-static \
    && make -j4 \
    && make install \
    && cd ${SRC_DIR} \
    && rm -rf .*


# ` Install idn
RUN wget -nv ftp://ftp.gnu.org/gnu/libidn/libidn-${LIBIDN_VERSION}.tar.gz \
    && sha256sum libidn-${LIBIDN_VERSION}.tar.gz | grep -E "^${LIBIDN_SHA256}" \
    && cd ${SRC_DIR} \
    && tar -xvf libidn-${LIBIDN_VERSION}.tar.gz \
    && cd libidn-${LIBIDN_VERSION} \
    && ./configure --prefix=${IDN_PREFIX} \
        --enable-shared \
        --enable-static \
    && make -j4 \
    && make install \
    && cd ${SRC_DIR} \
    && rm -rf .*


# ` Install HDF4
RUN wget -nv https://www.hdfgroup.org/ftp/HDF/releases/HDF${HDF4_VERSION}/src/hdf-${HDF4_VERSION}.tar.gz \
    && sha256sum hdf-${HDF4_VERSION}.tar.gz | grep -E "^${HDF4_SHA256}" \
    && cd ${SRC_DIR} \
    && tar -xvf hdf-${HDF4_VERSION}.tar.gz \
    && cd hdf-${HDF4_VERSION} \
    && ./configure --prefix=${HDF4_PREFIX} \
        --with-jpeg=${JPEGLIB} \
        --with-zlib=${ZLIBLIB} \
        --with-szlib=${SZIPLIB} \
        --disable-fortran \
        --disable-netcdf \
        --enable-shared \
        --enable-static \
        --enable-static-exec \
    && make -j4 \
    && make install \
    && cd ${SRC_DIR} \
    && rm -rf .*


# ` Install HDF5
RUN wget -nv http://www.hdfgroup.org/ftp/HDF5/releases/hdf5-${HDF5_VERSION:0:3}/hdf5-${HDF5_VERSION}/src/hdf5-${HDF5_VERSION}.tar.gz \
    && sha256sum hdf5-${HDF5_VERSION}.tar.gz | grep -E "^${HDF5_SHA256}" \
    && cd ${SRC_DIR} \
    && tar -xvf hdf5-${HDF5_VERSION}.tar.gz  \
    && cd hdf5-${HDF5_VERSION} \
    && ./configure --prefix=${HDF5_PREFIX} \
        --with-jpeg=${JPEGINC},${JPEGLIB} \
        --with-zlib=${ZLIBINC},${ZLIBLIB} \
        --with-szlib=${SZIPINC},${SZIPLIB} \
        --enable-threadsafe \
        --enable-unsupported \
        --with-pthread=/usr/lib64 \
        --enable-shared \
        --enable-static \
    && make -j4 \
    && make install \
    && cd ${SRC_DIR} \
    && rm -rf .*


# Install netcdf-4
RUN wget -nv ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-${NETCDF4_VERSION}.tar.gz \
    && sha256sum netcdf-${NETCDF4_VERSION}.tar.gz | grep -E "^${NETCDF4__SHA256}" \
    && cd ${SRC_DIR} \
    && tar -xvf netcdf-${NETCDF4_VERSION}.tar.gz \
    && cd netcdf-${NETCDF4_VERSION} \
    && env CPPFLAGS="-I/usr/local/curl/include" LDFLAGS="-L/usr/local/curl/lib" \
        ./configure --prefix=${NETCDF4_PREFIX} \
        --enable-netcdf-4 \
        --enable-shared \
        --enable-static \
    && make -j5 \
    && make install \
    && cd ${SRC_DIR} \
    && rm -rf .*


# Install HDFEOS2
RUN wget -nv ftp://edhs1.gsfc.nasa.gov/edhs/hdfeos/latest_release/HDF-EOS${HDFEOS_VERSION}.tar.Z \
    && sha256sum HDF-EOS${HDFEOS_VERSION}.tar.Z | grep -E "^${HDFEOS_SHA256}" \
    && cd ${SRC_DIR} \
    && tar -xvf HDF-EOS${HDFEOS_VERSION}.tar.Z \
    && cd hdfeos \
    && ./configure --prefix=${HDFEOS_PREFIX} \
        --with-jpeg=${JPEGLIB} \
        --with-zlib=${ZLIBLIB} \
        --with-szlib=${SZIPINC},${SZIPLIB} \
        --enable-install-include \
        --disable-shared \
        --enable-static \
        CC="/usr/local/bin/h4cc -Df2cFortran" \
    && make -j4 \
    && make install \
    && cd ${SRC_DIR} \
    && rm -rf .*


# Python environment setup
# GDAL is installed into python through the below installation, because Numpy
# must be installed into python before building GDAL
RUN pip install --upgrade pip \
    && pip install \
        --global-option=build_ext \
        --global-option="-L/usr/local/lib" \
        --global-option="-I/usr/local/include" \
        --global-option="-I/usr/local/include/libxml2" \
        python-dateutil==2.5.3 \
        requests==2.10.0 \
        lxml==3.6.0 \
        numpy==1.11.0 \
        matplotlib==1.5.1 \
    && pip install \
        scipy==0.11.0
# Force matplotlib to build the font cache
RUN python -c 'import matplotlib.pyplot'


# Install GDAL
RUN wget -nv http://download.osgeo.org/gdal/${GDAL_VERSION}/gdal-${GDAL_VERSION}.tar.gz \
    && sha256sum gdal-${GDAL_VERSION}.tar.gz | grep -E "^${GDAL_SHA256}" \
    && cd ${SRC_DIR} \
    && tar -xvf gdal-${GDAL_VERSION}.tar.gz \
    && cd gdal-${GDAL_VERSION} \
    && ./configure --prefix=${GDAL_PREFIX} \
        --with-liblzma \
        --with-python=yes \
        --with-static-proj4=${PROJ4_LIB} \
        --enable-shared \
        --enable-static \
    && make -j4 \
    && make install \
    && cd ${SRC_DIR} \
    && rm -rf .*

####### TODO: NOW, JUST GET THE BINARIES BACK OUT AGAIN!

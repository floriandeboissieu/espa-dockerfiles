FROM ubuntu:15.04


##############################################################################
# Common tool and applications provided by the base system
RUN apt-get update && apt-get install -y --no-install-recommends \
        openssh-client \
        ca-certificates \
        file \
        curl \
        wget \
        git \
        subversion \
        unzip \
        bzip2 \
        gzip \
        xz-utils \
        vim \
    && rm -rf /var/lib/apt/lists/*

# C, C++, and Python, along with more standard development tools
RUN apt-get update && apt-get install -y --no-install-recommends \
        autoconf \
        automake \
        g++ \
        gcc \
        gfortran \
        make \
        patch \
        python \
        python-setuptools \
        python-dev \
        python-pip \
    && rm -rf /var/lib/apt/lists/*

# Had to split these out for USGS/DOI blockpage crap
RUN apt-get update && apt-get install -y --no-install-recommends \
        python-virtualenv \
    && rm -rf /var/lib/apt/lists/*


##############################################################################
# Update git to the version we want to use
RUN apt-get update && apt-get install -y --no-install-recommends \
        expat \
        gettext \
        tcl \
        tk \
        libcurl4-openssl-dev \
        libexpat-dev \
        libssl-dev \
        zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

ENV GIT_VERSION v2.5.0
RUN set -xe \
    && cd /usr/src \
    && git clone --branch $GIT_VERSION https://github.com/git/git.git git.git \
    && cd git.git \
    && make configure \
    && ./configure CFLAGS="${CFLAGS} -static-libgcc" \
    && make \
    && make install \
    && cd .. \
    && rm -rf git.git


##############################################################################
# Remove things we don't need anymore
RUN apt-get update && apt-get remove -y \
        expat \
        gettext \
        tcl \
        tk \
        libcurl4-openssl-dev \
        libexpat-dev \
        libssl-dev \
        zlib1g-dev \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*


##############################################################################
# install our COTS packages

# ----------------------------------------------
# Install zlib
ENV ZLIB_VERSION 1.2.8
ENV ZLIB_SOURCE /usr/src/zlib
ENV ZLIB_PREFIX /usr/cots/zlib
ENV ZLIBINC $ZLIB_PREFIX/include
ENV ZLIBLIB $ZLIB_PREFIX/lib

COPY ./zlib-$ZLIB_VERSION $ZLIB_SOURCE
WORKDIR $ZLIB_SOURCE
RUN ./configure --prefix=$ZLIB_PREFIX \
    && make \
    && make install \
    && cd .. \
    && rm -rf $ZLIB_SOURCE

# ----------------------------------------------
# Install xz
ENV XZ_VERSION 5.2.1
ENV XZ_SOURCE /usr/src/xz
ENV XZ_PREFIX /usr/cots/xz
ENV XZINC $XZ_PREFIX/include
ENV XZLIB $XZ_PREFIX/lib
ENV LZMAINC $XZ_PREFIX/include
ENV LZMALIB $XZ_PREFIX/lib

COPY ./xz-$XZ_VERSION $XZ_SOURCE
WORKDIR $XZ_SOURCE
RUN ./configure --prefix=$XZ_PREFIX \
    && make \
    && make install \
    && cd .. \
    && rm -rf $XZ_SOURCE

# ----------------------------------------------
# Install szip
ENV SZIP_VERSION 2.1
ENV SZIP_SOURCE /usr/src/szip
ENV SZIP_PREFIX /usr/cots/szip
ENV SZIPINC $SZIP_PREFIX/include
ENV SZIPLIB $SZIP_PREFIX/lib

COPY ./szip-$SZIP_VERSION $SZIP_SOURCE
WORKDIR $SZIP_SOURCE
RUN ./configure --prefix=$SZIP_PREFIX \
    && make \
    && make install \
    && cd .. \
    && rm -rf $SZIP_SOURCE

# ----------------------------------------------
# Install jbigkit
ENV JBIG_VERSION 2.1
ENV JBIG_SOURCE /usr/src/jbigkit
ENV JBIG_PREFIX /usr/cots/jbigkit
ENV JBIGINC $JBIG_PREFIX/include
ENV JBIGLIB $JBIG_PREFIX/lib

COPY ./jbigkit-$JBIG_VERSION $JBIG_SOURCE
WORKDIR $JBIG_SOURCE
RUN make \
    && mkdir -p $JBIGINC \
    && mkdir -p $JBIGLIB \
    && /usr/bin/install libjbig/libjbig.a $JBIGLIB/libjpeg.a \
    && /usr/bin/install libjbig/libjbig85.a $JBIGLIB/libjpeg85.a \
    && /usr/bin/install libjbig/*.h $JBIGINC \
    && cd .. \
    && rm -rf $JBIG_SOURCE

# ----------------------------------------------
# Install jpeg
ENV JPEG_VERSION 9a
ENV JPEG_SOURCE /usr/src/jpeg
ENV JPEG_PREFIX /usr/cots/jpeg
ENV JPEGINC $JPEG_PREFIX/include
ENV JPEGLIB $JPEG_PREFIX/lib

# These are needed with jpeg-6b
#    && make install-lib \
#    && make install-headers \
#
COPY ./jpeg-$JPEG_VERSION $JPEG_SOURCE
WORKDIR $JPEG_SOURCE
RUN mkdir -p $JPEG_PREFIX/bin/cjpeg \
    && mkdir -p $JPEG_PREFIX/man/man1 \
    && mkdir -p $JPEGINC \
    && mkdir -p $JPEGLIB \
    && ./configure --prefix=$JPEG_PREFIX \
    && make \
    && make install \
    && cd .. \
    && rm -rf $JPEG_SOURCE

# ----------------------------------------------
# Install libxml2
ENV XML2_VERSION 2.9.1
ENV XML2_SOURCE /usr/src/xml2
ENV XML2_PREFIX /usr/cots/xml2
ENV XML2INC $XML2_PREFIX/include
ENV XML2LIB $XML2_PREFIX/lib

COPY ./libxml2-$XML2_VERSION $XML2_SOURCE
WORKDIR $XML2_SOURCE
RUN ./configure --prefix=$XML2_PREFIX \
    --with-zlib=$ZLIB_PREFIX \
    --with-lzma=$XZ_PREFIX \
    --without-python \
    --enable-shared \
    --enable-static \
    && make \
    && make install \
    && cd .. \
    && rm -rf $XML2_SOURCE

# ----------------------------------------------
# Install libidn
ENV IDN_VERSION 1.17
ENV IDN_SOURCE /usr/src/idn
ENV IDN_PREFIX /usr/cots/idn
ENV IDNINC $IDN_PREFIX/include
ENV IDNLIB $IDN_PREFIX/lib

COPY ./libidn-$IDN_VERSION $IDN_SOURCE
WORKDIR $IDN_SOURCE
RUN ./configure --prefix=$IDN_PREFIX \
    --enable-shared \
    --enable-static \
    && make \
    && make install \
    && cd .. \
    && rm -rf $IDN_SOURCE

# ----------------------------------------------
# Install curl
ENV CURL_VERSION 7.43.0
ENV CURL_SOURCE /usr/src/curl
ENV CURL_PREFIX /usr/cots/curl
ENV CURLINC $CURL_PREFIX/include
ENV CURLLIB $CURL_PREFIX/lib

COPY ./curl-$CURL_VERSION $CURL_SOURCE
WORKDIR $CURL_SOURCE
RUN ./configure --prefix=$CURL_PREFIX \
    --with-zlib=$ZLIB_PREFIX \
    --without-ssl \
    --without-gssapi \
    --enable-shared \
    --enable-static \
    && make \
    && make install \
    && cd .. \
    && rm -rf $CURL_SOURCE

# ----------------------------------------------
ENV USER_WORK_DIR /home/user
WORKDIR $USER_WORK_DIR

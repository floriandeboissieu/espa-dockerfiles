FROM ubuntu:15.04


##############################################################################
# From docker-library/buildpack-deps/vivid/curl/Dockerfile
RUN apt-get update && apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        wget \
    && rm -rf /var/lib/apt/lists/*


##############################################################################
# From docker-library/buildpack-deps/vivid/scm/Dockerfile
# RDD - Removed - bzr
# RDD - Removed - mercurial

# Install SCM Tools
RUN apt-get update && apt-get install -y --no-install-recommends \
        git \
        openssh-client \
        subversion \
    && rm -rf /var/lib/apt/lists/*


##############################################################################
# From docker-library/buildpack-deps/vivid/Dockerfile
# RDD - Removed - imagemagick \
# RDD - Removed - libyaml-dev \
# RDD - Removed - libbz2-dev \
# RDD - Removed - libc6-dev \
# RDD - Removed - libevent-dev \
# RDD - Removed - libffi-dev \
# RDD - Removed - libglib2.0-dev \
# RDD - Removed - libjpeg-dev \
# RDD - Removed - liblzma-dev \
# RDD - Removed - libmagickcore-dev \
# RDD - Removed - libmagickwand-dev \
# RDD - Removed - libmysqlclient-dev \
# RDD - Removed - libncurses-dev \
# RDD - Removed - libpq-dev \
# RDD - Removed - libreadline-dev \
# RDD - Removed - libsqlite3-dev \
# RDD - Removed - libtool \
# RDD - Removed - libwebp-dev \
# RDD - Removed - libxml2-dev \
# RDD - Removed - libxslt-dev \
#

# Install System Tools
RUN apt-get update && apt-get install -y --no-install-recommends \
        file \
    && rm -rf /var/lib/apt/lists/*

# Install Compiling and Tools
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
        python-pip \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y --no-install-recommends \
        python-virtualenv \
    && rm -rf /var/lib/apt/lists/*

# Install Compression
RUN apt-get update && apt-get install -y --no-install-recommends \
        bzip2 \
        gzip \
        xz-utils \
    && rm -rf /var/lib/apt/lists/*

# Install Dev Libraries
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


##############################################################################
# Update git to the version we want to use
ENV GIT_VERSION v2.5.0
RUN set -xe \
    && cd /usr/src \
    && git clone --branch $GIT_VERSION https://github.com/git/git.git git.git \
    && cd git.git \
    && make configure \
    && ./configure CFLAGS="${CFLAGS} -static-libgcc" \
    && make \
    && make install \
    && rm -rf git.git

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

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
RUN apt-get update && apt-get install -y --no-install-recommends \
        git \
        openssh-client \
        subversion \
    && rm -rf /var/lib/apt/lists/*


##############################################################################
# From docker-library/buildpack-deps/vivid/Dockerfile
# RDD - Removed - imagemagick
# RDD - Removed - libyaml-dev
# RDD - Removed - libbz2-dev
# RDD - Removed - libcurl4-openssl-dev
# RDD - Removed - libc6-dev
# RDD - Removed - libevent-dev
# RDD - Removed - libffi-dev
# RDD - Removed - libglib2.0-dev
# RDD - Removed - libjpeg-dev
# RDD - Removed - liblzma-dev
# RDD - Removed - libmagickcore-dev
# RDD - Removed - libmagickwand-dev
# RDD - Removed - libmysqlclient-dev
# RDD - Removed - libncurses-dev
# RDD - Removed - libpq-dev
# RDD - Removed - libreadline-dev
# RDD - Removed - libsqlite3-dev
# RDD - Removed - libssl-dev
# RDD - Removed - libtool
# RDD - Removed - libwebp-dev
# RDD - Removed - libxml2-dev
# RDD - Removed - libxslt-dev
# RDD - Removed - zlib1g-dev
RUN apt-get update && apt-get install -y --no-install-recommends \
        autoconf \
        automake \
        bzip2 \
        gzip \
        xz-utils \
        file \
        g++ \
        gcc \
        make \
        patch \
    && rm -rf /var/lib/apt/lists/*

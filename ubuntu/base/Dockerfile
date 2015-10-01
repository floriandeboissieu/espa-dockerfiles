FROM ubuntu:15.04
MAINTAINER USGS LSRD http://eros.usgs.gov

LABEL description="This is a build of our base system with some essential \
tools installed and/or upgraded."

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends \
        apt-utils \
    && rm -rf /var/lib/apt/lists/*

# ----------------------------------------------
# Common tool and applications provided by the base system
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
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
        build-essential \
        bison \
        flex \
        gfortran \
        autoconf \
        automake \
        texinfo \
        vim \
    && rm -rf /var/lib/apt/lists/*

# ----------------------------------------------
# Update git to a version that isn't broken
ENV GIT_VERSION v2.6.0
ENV GIT_SOURCE /usr/src/git.git

WORKDIR $GIT_SOURCE
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        expat \
        gettext \
        libcurl4-openssl-dev \
        libexpat-dev \
        libssl-dev \
    && apt-get install -y --no-install-recommends \
        zlib1g-dev \
    && git clone --depth 1 \
       --branch $GIT_VERSION \
       https://github.com/git/git.git . \
    && make configure \
    && ./configure --without-tcltk \
    && make \
    && make install \
    && cd .. \
    && rm -rf $GIT_SOURCE \
    && apt-get remove -y \
        expat \
        gettext \
        libcurl4-openssl-dev \
        libexpat-dev \
        libssl-dev \
        zlib1g-dev \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*


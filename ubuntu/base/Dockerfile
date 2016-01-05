FROM ubuntu:15.04
MAINTAINER USGS LSRD http://eros.usgs.gov

LABEL description="This is a build of our base system with some essential \
tools installed and/or upgraded."


ENV DEBIAN_FRONTEND noninteractive


# ----------------------------------------------------------------------------
RUN apt-get update \
    && apt-get upgrade -y \
    && rm -rf /var/lib/apt/lists/*


# ----------------------------------------------------------------------------
# Common tool and applications provided by the base system
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        apt-utils \
        build-essential \
    && apt-get install -y --no-install-recommends \
        openssh-client \
        ca-certificates \
    && apt-get install -y --no-install-recommends \
        file \
        curl \
    && apt-get install -y --no-install-recommends \
        wget \
        git \
    && apt-get install -y --no-install-recommends \
        subversion \
        unzip \
    && apt-get install -y --no-install-recommends \
        bzip2 \
        gzip \
    && apt-get install -y --no-install-recommends \
        xz-utils \
        bison \
    && apt-get install -y --no-install-recommends \
        flex \
        gfortran \
    && apt-get install -y --no-install-recommends \
        autoconf \
        automake \
    && apt-get install -y --no-install-recommends \
        texinfo \
        vim \
    && apt-get install -y --no-install-recommends \
        libcurl4-openssl-dev \
        mlocate \
    && apt-get install -y --no-install-recommends \
        pkg-config \
        expat \
    && apt-get install -y --no-install-recommends \
        gettext \
        libexpat-dev \
    && rm -rf /var/lib/apt/lists/*


# ----------------------------------------------------------------------------
# Install gosu so that the entrypoint script (installed later) can change the
# specified user.  "gosu is used for easy step-down from root"
# - This is where it can be found
#     https://github.com/tianon/gosu/releases
# - This is the source I used to figure out how to install it
#     https://github.com/docker-library/redis/blob/master/2.8/Dockerfile
RUN gpg --keyserver pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4
RUN curl -o /usr/local/bin/gosu -fSL "https://github.com/tianon/gosu/releases/download/1.7/gosu-$(dpkg --print-architecture)" \
    && curl -o /usr/local/bin/gosu.asc -fSL "https://github.com/tianon/gosu/releases/download/1.7/gosu-$(dpkg --print-architecture).asc" \
    && gpg --verify /usr/local/bin/gosu.asc \
    && rm /usr/local/bin/gosu.asc \
    && chmod +x /usr/local/bin/gosu


# ----------------------------------------------------------------------------
# Update git to a version that isn't broken
ENV GIT_VERSION=v2.7.0 \
    GIT_SOURCE=/usr/local/src/git.git

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        zlib1g-dev \
    && mkdir $GIT_SOURCE \
    && cd $GIT_SOURCE \
    && git clone \
       --depth 1 \
       --branch $GIT_VERSION \
       https://github.com/git/git.git . \
    && make configure \
    && ./configure --without-tcltk \
    && make \
    && make install \
    && cd .. \
    && rm -rf $GIT_SOURCE \
    && apt-get remove -y \
        zlib1g-dev \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

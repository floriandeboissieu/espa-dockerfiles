FROM alpine:3.3
MAINTAINER USGS LSRD http://eros.usgs.gov

LABEL description="This is a build of our base system with some essential tools installed and/or upgraded."


# ----------------------------------------------------------------------------
#RUN apt-get update \
#    && apt-get upgrade -y \
#    && rm -rf /var/lib/apt/lists/*
RUN apk upgrade && rm -rf /var/cache/apk/*
RUN apk add --update \
        openssl \
        openssl-dev \
        ca-certificates \
        openssh-client \
        pkgconf \
        pkgconfig \
        zlib \
        zlib-dev \
        curl \
        curl-dev \
        libssh2 \
        libssh2-dev \
        xz \
        xz-libs \
        xz-dev \
        libgpg-error \
        libassuan \
        libattr \
        libcap \
        ncurses-terminfo-base \
        ncurses-terminfo \
        ncurses-libs \
        pinentry \
        libgcrypt \
        libksba \
        db \
        libsasl \
        libldap \
        npth \
        gnupg \
        unzip \
        bzip2 \
        gzip \
        expat \
        pcre \
        git \
        wget \
        binutils-libs \
        binutils \
        gmp \
        isl \
        libgomp \
        libatomic \
        libgcc \
        mpfr3 \
        mpc1 \
        libstdc++ \
        gcc \
        libquadmath \
        libgfortran \
        gfortran \
        readline \
        bash \
     && rm -rf /var/cache/apk/*

#RUN apk add --update \
#     && rm -rf /var/cache/apk/*


#        bison \
#        flex \
#        autoconf \
#        automake \
#        texinfo \
#        gettext \
#        vim \
#     && rm -rf /var/cache/apk/*

#RUN apk add --update gcc && rm -rf /var/cache/apk/*

#        mlocate \
#

# ----------------------------------------------------------------------------
# Common tool and applications provided by the base system
#RUN apt-get update \
#    && apt-get install -y --no-install-recommends \
#        apt-utils \
#        build-essential \
#    && apt-get install -y --no-install-recommends \
#        file \
#    && apt-get install -y --no-install-recommends \
#        wget \
#    && apt-get install -y --no-install-recommends \
#        xz-utils \
#        bison \
#    && apt-get install -y --no-install-recommends \
#        flex \
#        gfortran \
#    && apt-get install -y --no-install-recommends \
#        autoconf \
#        automake \
#    && apt-get install -y --no-install-recommends \
#        texinfo \
#        vim \
#    && apt-get install -y --no-install-recommends \
#        libcurl4-openssl-dev \
#        mlocate \
#    && apt-get install -y --no-install-recommends \
#        pkg-config \
#    && apt-get install -y --no-install-recommends \
#        gettext \
#        libexpat-dev \
#    && rm -rf /var/lib/apt/lists/*


# ----------------------------------------------------------------------------
# Install gosu so that the entrypoint script (installed later) can change the
# specified user.  "gosu is used for easy step-down from root"
# - This is where it can be found
#     https://github.com/tianon/gosu/releases
# - This is the source I used to figure out how to install it
#     https://github.com/docker-library/redis/blob/master/2.8/Dockerfile
# NOTE apk --print-arch returnes x86_64, when it should probably return amd64
#
RUN gpg --keyserver pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4
RUN curl -o /usr/local/bin/gosu -fSL "https://github.com/tianon/gosu/releases/download/1.7/gosu-amd64" \
    && curl -o /usr/local/bin/gosu.asc -fSL "https://github.com/tianon/gosu/releases/download/1.7/gosu-amd64.asc" \
    && gpg --verify /usr/local/bin/gosu.asc \
    && rm /usr/local/bin/gosu.asc \
    && chmod +x /usr/local/bin/gosu

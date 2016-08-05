FROM centos:7.2.1511


MAINTAINER USGS LSRD http://eros.usgs.gov


LABEL description="This is a build of our base system with some essential tools installed and/or upgraded."


# ----------------------------------------------------------------------------
# Update the OS packages to the latest versions
RUN yum update -y && yum clean metadata


# ----------------------------------------------------------------------------
# Required for additional tools installed later
RUN yum install -y epel-release && yum clean metadata


# ----------------------------------------------------------------------------
# Tools and libraries required for development and compiling external
# tools and libraries
RUN yum group install -y "Development Tools" \
    && yum install -y \
        e2fsprogs \
        expat-devel \
        glibc-static \
        libcurl-devel \
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


# ----------------------------------------------------------------------------
# Update git to a version that isn't broken
RUN cd /usr/local/src \
    && git clone \
       --depth 1 \
       --branch v2.9.0 \
       https://github.com/git/git.git git.git \
    && cd git.git \
    && make configure \
    && ./configure --without-tcltk \
    && make \
    && make install \
    && cd .. \
    && rm -rf git.git


# ----------------------------------------------------------------------------
# Initial Python Configuration
RUN yum install -y python-virtualenv \
    && cd / \
    && virtualenv python-env \
    && yum clean metadata

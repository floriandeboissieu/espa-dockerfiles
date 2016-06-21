FROM centos:7


MAINTAINER USGS LSRD http://eros.usgs.gov


LABEL description="This is a build of our base system with some essential tools installed and/or upgraded."


# ----------------------------------------------------------------------------
RUN yum update -y && yum clean metadata

# ----------------------------------------------------------------------------
# Required for wgrib install later
RUN yum install -y epel-release && yum clean metadata


# ----------------------------------------------------------------------------
# Install gosu so that the entrypoint script (installed later) can change the
# specified user.  "gosu is used for easy step-down from root"
COPY external_tools/gosu-amd64 /usr/local/bin/gosu
RUN chmod +x /usr/local/bin/gosu


# ----------------------------------------------------------------------------
# Tools and libraries required for development
RUN yum group install -y "Development Tools" \
    && yum install -y expat-devel glibc-static libcurl-devel \
                      libgfortran-static libquadmath-static zlib-devel \
    && yum clean metadata


# ----------------------------------------------------------------------------
# Tools required for development and system usage
RUN yum install -y e2fsprogs mlocate perl-ExtUtils-MakeMaker sudo texinfo \
                   valgrind vim-enhanced wget wgrib which \
    && yum clean metadata


# ----------------------------------------------------------------------------
# Update git to a version that isn't broken
RUN cd /usr/local/src \
    && git clone \
       --depth 1 \
       --branch v2.8.1 \
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

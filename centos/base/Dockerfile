FROM centos:7


MAINTAINER USGS LSRD http://eros.usgs.gov


LABEL description="This is a build of our base system with some essential tools installed and/or upgraded."


# ----------------------------------------------------------------------------
RUN yum update -y && yum clean metadata


# ----------------------------------------------------------------------------
# Install gosu so that the entrypoint script (installed later) can change the
# specified user.  "gosu is used for easy step-down from root"
COPY external_tools/gosu-amd64 /usr/local/bin/gosu
RUN chmod +x /usr/local/bin/gosu


# ----------------------------------------------------------------------------
# Common tool and applications provided by the base system
RUN yum group install -y "Development Tools" \
    && yum clean metadata

RUN yum install -y which \
    && yum install -y wget \
    && yum install -y texinfo \
    && yum install -y vim-enhanced \
    && yum install -y mlocate \
    && yum install -y zlib-devel \
    && yum install -y perl-ExtUtils-MakeMaker \
    && yum clean metadata


# ----------------------------------------------------------------------------
# Update git to a version that isn't broken
RUN GIT_SOURCE=/usr/local/src/git.git \
    && mkdir $GIT_SOURCE \
    && cd $GIT_SOURCE \
    && git clone \
       --depth 1 \
       --branch v2.8.1 \
       https://github.com/git/git.git . \
    && make configure \
    && ./configure --without-tcltk \
    && make \
    && make install \
    && cd .. \
    && rm -rf $GIT_SOURCE


# ----------------------------------------------------------------------------
# Initial Python Configuration
RUN yum install -y python-virtualenv \
    && cd / \
    && virtualenv python_env \
    && yum clean metadata

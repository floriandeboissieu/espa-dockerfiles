FROM centos:6.9


MAINTAINER USGS EROS LSRD http://eros.usgs.gov


LABEL description="CentOS with updated repo and python packages"


# Update the OS packages to the latest versions
RUN yum update -y \
    && yum clean metadata


# Required for additional tools installed later
RUN yum install -y \
        epel-release \
    && yum clean metadata


FROM centos:7.2.1511


MAINTAINER USGS LSRD http://eros.usgs.gov


LABEL description="This is a build utilized to create RPMs."


ENV PREFIX=/usr/local \
    ESPAINC=/usr/local/include \
    ESPALIB=/usr/local/lib


COPY RPMS/espa-product-formatter.1.8.0.1.20160808152440.el7.centos.x86_64.rpm /RPMS/espa-product-formatter.1.8.0.1.20160808152440.el7.centos.x86_64.rpm
COPY RPMS/espa-cloud-masking-cfmask.2.0.1.1.20160808153258.el7.centos.x86_64.rpm /RPMS/espa-cloud-masking-cfmask.2.0.1.1.20160808153258.el7.centos.x86_64.rpm

RUN rpm -i /RPMS/espa-product-formatter.1.8.0.1.20160808152440.el7.centos.x86_64.rpm
RUN rpm -i /RPMS/espa-cloud-masking-cfmask.2.0.1.1.20160808153258.el7.centos.x86_64.rpm

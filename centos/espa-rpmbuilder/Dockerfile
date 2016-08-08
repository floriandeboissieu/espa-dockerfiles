FROM rpmbuilder:0.3.0


MAINTAINER USGS LSRD http://eros.usgs.gov


LABEL description="This is a build utilized to create RPMs."


ENV PREFIX=/usr/local \
    ESPAINC=/usr/local/include \
    ESPALIB=/usr/local/lib


COPY RPMS/espa-product-formatter.1.8.0.1.20160808152440.el7.centos.x86_64.rpm /RPMS/espa-product-formatter.1.8.0.1.20160808152440.el7.centos.x86_64.rpm

RUN rpm -i /RPMS/espa-product-formatter.1.8.0.1.20160808152440.el7.centos.x86_64.rpm

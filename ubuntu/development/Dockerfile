FROM usgs-espa/ubuntu-cots
MAINTAINER USGS LSRD http://eros.usgs.gov

LABEL description="This is a build containing all of the software we use for \
an ESPA processing node installed into the image."

# ---------------------------------------------------------------------------
# Configuration of many of the environment variables to reduce intermediate
# docker image generation.
# ---------------------------------------------------------------------------

# Specify the user that will run everything
ENV THE_USER=espa-developer

# Define the installation and library locations
ENV PREFIX=/usr/local \
    ESPAINC=/usr/local/include \
    ESPALIB=/usr/local/lib

# Define the software tags that make up the current production release
ENV ESPA_PRODUCT_FORMATTER_TAG=docker-development

# ---------------------------------------------------------------------------
# Clone the software and then build and install it
RUN mkdir -p /espa/src/espa-product-formatter \
    && cd /espa/src/espa-product-formatter \
    && git clone https://github.com/USGS-EROS/espa-product-formatter.git . \
    && git checkout $ESPA_PRODUCT_FORMATTER_TAG \
    && make -f Makefile.static \
    && make -f Makefile.static install \
    && rm -rf /espa/src/espa-product-formatter

# grab gosu for easy step-down from root
RUN gpg --keyserver pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4
RUN curl -o /usr/local/bin/gosu -SL "https://github.com/tianon/gosu/releases/download/1.2/gosu-$(dpkg --print-architecture)" \
    && curl -o /usr/local/bin/gosu.asc -SL "https://github.com/tianon/gosu/releases/download/1.2/gosu-$(dpkg --print-architecture).asc" \
    && gpg --verify /usr/local/bin/gosu.asc \
    && rm /usr/local/bin/gosu.asc \
    && chmod +x /usr/local/bin/gosu

# ---------------------------------------------------------------------------
# Add an entrypoint so that we execute as a specific user
COPY container-entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]


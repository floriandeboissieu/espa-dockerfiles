FROM usgs-espa/ubuntu-cots
MAINTAINER USGS LSRD http://eros.usgs.gov

LABEL description="This is a build containing all of the software we use for \
an ESPA processing node installed into the image."

# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------
# This is broken, because it is not anywhere near working
# This is broken, because it is not anywhere near working
# This is broken, because it is not anywhere near working
# This is broken, because it is not anywhere near working
# This is broken, because it is not anywhere near working
# This is broken, because it is not anywhere near working
# This is broken, because it is not anywhere near working
# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------

# ---------------------------------------------------------------------------
# Configuration of many of the environment variables to reduce intermediate
# docker image generation.
# ---------------------------------------------------------------------------

# Define the installation and library locations
ENV PREFIX=/usr/local \
    ESPAINC=/usr/local/include \
    ESPALIB=/usr/local/lib

# Define the software tags that make up the current production release
ENV ESPA_PRODUCT_FORMATTER_TAG=docker-development

RUN mkdir -p /espa/src/espa-product-formatter \
    && cd /espa/src/espa-product-formatter \
    && git clone https://github.com/USGS-EROS/espa-product-formatter.git . \
    && git checkout $ESPA_PRODUCT_FORMATTER_TAG \
    && make -f Makefile.static \
    && make -f Makefile.static install


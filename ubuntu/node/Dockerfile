FROM usgs-espa/ubuntu-science
MAINTAINER USGS LSRD http://eros.usgs.gov

LABEL description="This is a build adding in the espa-processing software we \
use for an ESPA processing node installed into the image."


RUN REPO_NAME=espa-processing \
    && REPO_TAG=espa-2.10.0-release \
    && cd /espa/src \
    && git clone https://github.com/USGS-EROS/${REPO_NAME}.git ${REPO_NAME} \
    && cd ${REPO_NAME} \
    && git checkout ${REPO_TAG}

RUN cd /espa/src/espa-processing

# ----------------------------------------------------------------------------
# Add an entrypoint so that we execute as a specific user
ENV THE_USER=espa
COPY node-entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]


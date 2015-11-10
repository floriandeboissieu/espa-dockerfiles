FROM usgs-espa/ubuntu-base
MAINTAINER USGS LSRD http://eros.usgs.gov

LABEL description="This is a build from our base system which includes \
the default python along with some python tools"

# ----------------------------------------------
# Install the core python
RUN apt-get update && apt-get install -y --no-install-recommends \
        python \
        python-pip \
        python-dev \
    && rm -rf /var/lib/apt/lists/*

# ----------------------------------------------
# Install virtualenv and primary python development tools
RUN pip install virtualenv

RUN virtualenv /python-virtual

RUN . /python-virtual/bin/activate \
    && pip install pep8==1.6.2 pylint==1.4.4


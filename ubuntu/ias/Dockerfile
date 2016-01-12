FROM usgs-espa/ubuntu-science
MAINTAINER USGS LSRD http://eros.usgs.gov

LABEL description="This is a build containing all of the IAS cots software we \
use installed into the image."


# ----------------------------------------------------------------------------
# Configuration of many of the environment variables to reduce intermediate
# docker image generation.
# ----------------------------------------------------------------------------

ENV BUILDROOT=/usr/local \
    SRCROOT=/usr/local/src/IAS_3_6_1_OPS


# ----------------------------------------------------------------------------
# Required to build IAS software
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        g++-multilib \
        libtool-bin \
        tcsh \
    && rm -rf /var/lib/apt/lists/*


# --------------------------------------
# Required by the build script
RUN ln -sf /usr/bin/make /usr/bin/gmake

# --------------------------------------
# IAS COTS
COPY ./ias_src/IAS_COTS_3_6_1 /usr/local/src/IAS_COTS_3_6_1

# --------------------------------------
# IAS SOURCE
COPY ./ias_src/IAS_3_6_1_OPS/ias_base /usr/local/src/IAS_3_6_1_OPS/ias_base
COPY ./ias_src/IAS_3_6_1_OPS/ias_lib /usr/local/src/IAS_3_6_1_OPS/ias_lib

# --------------------------------------
# Build the IAS software in one tsch command so that we don't have to mess
# with our environment variables out side of the tcsh shell
RUN tcsh -c 'source $SRCROOT/ias_lib/setup/iaslib_setup --enable-dev --disable-db-tests --64 $BUILDROOT/build_ias; source $SRCROOT/ias_base/setup/iasbase_setup /$HOST/data2/$USER/ias_sys; cd /usr/local/src/IAS_COTS_3_6_1; source setup --64 --cots-dir /home/ipecm/COTS64; make common; setenv TIFF_HOME $TIFF_PREFIX; setenv GEOTIFF_HOME $GEOTIFF_PREFIX; setenv HDF5_HOME $HDF5_PREFIX; setenv HDF_HOME $HDF4_PREFIX; setenv GEOTIFF_LIB $GEOTIFF_PREFIX/lib; setenv HDFINC $HDF4_PREFIX/include; setenv HDFLIB $HDF4_PREFIX/lib; setenv HDF4INC $HDF4_PREFIX/include; setenv HDF4LIB $HDF4_PREFIX/lib; setenv HDF5INC $HDF5_PREFIX/include; setenv HDF5LIB $HDF5_PREFIX/lib; cd /usr/local/src/IAS_3_6_1_OPS/ias_lib; ./autogen.sh; ./configure --disable-ias_python_lib --disable-ias_qt_lib; ./build; cd /usr/local/src/IAS_3_6_1_OPS/ias_base; ./autogen.sh; ./configure --disable-python; make; make install;'

# --------------------------------------
# Configure the path to include the IAS software
# TODO TODO TODO


# --------------------------------------
# Remove the IAS source
#RUN rm -rf /usr/local/src/IAS_COTS_3_6_1 /usr/local/src/IAS_3_6_1_OPS

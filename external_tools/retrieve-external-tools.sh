#!/bin/bash

#-----------------------------------------------------------------------------
validate_tool () {
    sha256sum -c external_sha256_sums/$1.sha | grep OK
    if [ $? != 0 ]; then
        echo "Failed to validate [$1]"
        exit 1
    fi
}

#-----------------------------------------------------------------------------
retrieve_tool () {
    if [ ! -f $1 ]; then
        wget $2/$1
        if [ $? != 0 ]; then
            echo "Failed to retrieve [$1]"
            exit 1
        fi
    fi
}

#-----------------------------------------------------------------------------
tool=curl-7.48.0.tar.gz
retrieve_tool $tool https://curl.haxx.se/download
validate_tool $tool

#-----------------------------------------------------------------------------
tool=libidn-1.32.tar.gz
retrieve_tool $tool ftp://ftp.gnu.org/gnu/libidn
validate_tool $tool

#-----------------------------------------------------------------------------
tool=jbigkit-2.1.tar.gz
retrieve_tool $tool https://www.cl.cam.ac.uk/~mgk25/jbigkit//download
validate_tool $tool

#-----------------------------------------------------------------------------
tool=jpegsrc.v9b.tar.gz
retrieve_tool $tool http://www.ijg.org/files
validate_tool $tool

#-----------------------------------------------------------------------------
tool=libxml2-2.9.3.tar.gz
retrieve_tool $tool ftp://xmlsoft.org/libxml2
validate_tool $tool

#-----------------------------------------------------------------------------
tool=libxslt-1.1.28.tar.gz
retrieve_tool $tool ftp://xmlsoft.org/libxslt
validate_tool $tool

#-----------------------------------------------------------------------------
tool=szip-2.1.tar.gz
retrieve_tool $tool http://www.hdfgroup.org/ftp/lib-external/szip/2.1/src
validate_tool $tool

#-----------------------------------------------------------------------------
tool=tiff-4.0.6.tar.gz
retrieve_tool $tool http://download.osgeo.org/libtiff
validate_tool $tool

#-----------------------------------------------------------------------------
tool=libgeotiff-1.4.1.tar.gz
retrieve_tool $tool http://download.osgeo.org/geotiff/libgeotiff
validate_tool $tool

#-----------------------------------------------------------------------------
tool=xz-5.2.2.tar.gz
retrieve_tool $tool http://tukaani.org/xz
validate_tool $tool

#-----------------------------------------------------------------------------
tool=zlib-1.2.8.tar.gz
retrieve_tool $tool http://zlib.net
validate_tool $tool

#-----------------------------------------------------------------------------
tool=hdf-4.2.11.tar.gz
retrieve_tool $tool http://www.hdfgroup.org/ftp/HDF/HDF_Current/src
validate_tool $tool

#-----------------------------------------------------------------------------
tool=hdf5-1.8.16.tar.gz
retrieve_tool $tool http://www.hdfgroup.org/ftp/HDF5/current/src
validate_tool $tool

#-----------------------------------------------------------------------------
#tool=XXX
#retrieve_tool $tool XXX
#validate_tool $tool

#-----------------------------------------------------------------------------
#tool=XXX
#retrieve_tool $tool XXX
#validate_tool $tool

#-----------------------------------------------------------------------------
#tool=XXX
#retrieve_tool $tool XXX
#validate_tool $tool

#-----------------------------------------------------------------------------
#tool=XXX
#retrieve_tool $tool XXX
#validate_tool $tool

#-----------------------------------------------------------------------------
#tool=XXX
#retrieve_tool $tool XXX
#validate_tool $tool

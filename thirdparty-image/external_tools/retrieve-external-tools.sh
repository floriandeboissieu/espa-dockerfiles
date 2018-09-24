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
retrieve_tool $tool http://www.hdfgroup.org/ftp/lib-external/szip/previous/2.1/src
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
#tool=zlib-1.2.8.tar.gz
#retrieve_tool $tool http://zlib.net
#validate_tool $tool

#-----------------------------------------------------------------------------
version=4.2.11
tool=hdf-$version.tar.gz
retrieve_tool $tool https://www.hdfgroup.org/ftp/HDF/releases/HDF$version/src
validate_tool $tool

#-----------------------------------------------------------------------------
version=hdf5-1.8.16
release=$(echo $version | cut -c 1-8)
tool=$version.tar.gz
retrieve_tool $tool http://www.hdfgroup.org/ftp/HDF5/releases/$release/$version/src
validate_tool $tool

#-----------------------------------------------------------------------------
tool=netcdf-4.4.0.tar.gz
retrieve_tool $tool ftp://ftp.unidata.ucar.edu/pub/netcdf
validate_tool $tool

#-----------------------------------------------------------------------------
tool=HDF-EOS2.19v1.00.tar.Z
#retrieve_tool $tool ftp://edhs1.gsfc.nasa.gov/edhs/hdfeos/latest_release
retrieve_tool $tool ftp://edhs1.gsfc.nasa.gov/edhs/hdfeos/previous_releases
validate_tool $tool

#-----------------------------------------------------------------------------
#version=2.6.3
#tool=freetype-$version\.tar.gz
#retrieve_tool $tool https://sourceforge.net/projects/freetype/files/freetype2/$version
#validate_tool $tool

#-----------------------------------------------------------------------------
#version=1.6.21
#tool=libpng-$version\.tar.gz
#retrieve_tool $tool https://sourceforge.net/projects/libpng/files/libpng16/older-releases/$version
#validate_tool $tool

#-----------------------------------------------------------------------------
tool=proj-4.9.1.tar.gz
retrieve_tool $tool http://download.osgeo.org/proj
validate_tool $tool

#-----------------------------------------------------------------------------
version=1.11.4
tool=gdal-$version\.tar.gz
retrieve_tool $tool http://download.osgeo.org/gdal/$version
validate_tool $tool

#-----------------------------------------------------------------------------
#tool=wgrib.tar.v1.8.1.2c
#retrieve_tool $tool ftp://ftp.cpc.ncep.noaa.gov/wd51we/wgrib
#validate_tool $tool

#-----------------------------------------------------------------------------
#tool=Python-2.7.11.tgz
#retrieve_tool $tool https://www.python.org/ftp/python/2.7.11
#validate_tool $tool

#-----------------------------------------------------------------------------
#tool=gosu-amd64
#retrieve_tool $tool https://github.com/tianon/gosu/releases/download/1.8
#validate_tool $tool

#-----------------------------------------------------------------------------
#tool=package_name
#retrieve_tool $tool URL
#validate_tool $tool

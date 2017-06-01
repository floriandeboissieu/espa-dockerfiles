#!/usr/bin/bash

cat ${2} | sed \
    -e "s/ESPA_VERSION/${1}/" \
    -e "s/ESPA_PRODUCT_FORMATTER/dev_v1.13.0/" \
    -e "s/ESPA_L2QA_TOOLS/dev_v1.5.0/" \
    -e "s/ESPA_SURFACE_REFLECTANCE/dev_june2017/" \
    -e "s/ESPA_LAND_SURFACE_TEMPERATURE/dev_0.3.0/" \
    -e "s/ESPA_SPECTRAL_INDICES/dev_v2.6.0/" \
    -e "s/ESPA_SURFACE_WATER_EXTENT/espa-v2.17.0/" \
    -e "s/ESPA_ELEVATION/v2.3.0/" \
    -e "s/ESPA_PYTHON_LIBRARY/v1.1.0/" \
    -e "s/ESPA_PROCESSING/rb-2.19.0/" > ${3}

#!/usr/bin/bash

cat ${2} | sed \
    -e "s/ESPA_VERSION/${1}/" \
    -e "s/ESPA_PRODUCT_FORMATTER/dev_v1.12.0/" \
    -e "s/ESPA_L2QA_TOOLS/dev_v1.4.0/" \
    -e "s/ESPA_CLOUD_MASKING/cfmask-v2.0.2/" \
    -e "s/ESPA_SURFACE_REFLECTANCE/dev_may2017/" \
    -e "s/ESPA_LAND_SURFACE_TEMPERATURE/dev_0.1.4/" \
    -e "s/ESPA_SPECTRAL_INDICES/spectral_indices_v2.5.0/" \
    -e "s/ESPA_SURFACE_WATER_EXTENT/espa-v2.17.0/" \
    -e "s/ESPA_ELEVATION/rb-v2.3.0/" \
    -e "s/ESPA_PYTHON_LIBRARY/rb-v1.1.0/" \
    -e "s/ESPA_PROCESSING/rb-2.18.0/" > ${3}

#!/usr/bin/bash

cat ${2} | sed \
    -e "s/ESPA_VERSION/${1}/" \
    -e "s/ESPA_PRODUCT_FORMATTER/dev_v1.11.1/" \
    -e "s/ESPA_L2QA_TOOLS/dev_v1.3.0/" \
    -e "s/ESPA_CLOUD_MASKING/cfmask-v2.0.2/" \
    -e "s/ESPA_SURFACE_REFLECTANCE/dev_march2017/" \
    -e "s/ESPA_LAND_SURFACE_TEMPERATURE/dev_0.1.3/" \
    -e "s/ESPA_SPECTRAL_INDICES/spectral_indices_v2.5.0/" \
    -e "s/ESPA_SURFACE_WATER_EXTENT/fb-dswe-1.1.3/" \
    -e "s/ESPA_ELEVATION/v2.2.0/" \
    -e "s/ESPA_PYTHON_LIBRARY/v1.0.1/" \
    -e "s/ESPA_PROCESSING/rb-2.17.0/" > ${3}

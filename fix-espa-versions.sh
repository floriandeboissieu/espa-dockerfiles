#!/usr/bin/bash

cat ${2} | sed \
    -e "s/ESPA_VERSION/${1}/" \
    -e "s/ESPA_PRODUCT_FORMATTER/dev_v1.11.1/" \
    -e "s/ESPA_L2QA_TOOLS/l2qa_tools_v1.2.0/" \
    -e "s/ESPA_CLOUD_MASKING/cfmask-v2.0.2/" \
    -e "s/ESPA_SURFACE_REFLECTANCE/dev_march2017/" \
    -e "s/ESPA_LAND_SURFACE_TEMPERATURE/lst-rit-v0.1.2/" \
    -e "s/ESPA_SPECTRAL_INDICES/spectral_indices_v2.5.0/" \
    -e "s/ESPA_SURFACE_WATER_EXTENT/espa-v2.15.0/" \
    -e "s/ESPA_ELEVATION/v2.2.0/" \
    -e "s/ESPA_PYTHON_LIBRARY/v1.0.1/" \
    -e "s/ESPA_PROCESSING/espa-2.16.0-release/" > ${3}

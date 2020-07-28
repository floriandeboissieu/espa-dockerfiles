
cat ${2} | sed \
    -e "s/ESPA_VERSION/${1}/" \
    -e "s/ESPA_PRODUCT_FORMATTER/master/" \
    -e "s/ESPA_L2QA_TOOLS/l2qa_tools_v1.7.1/" \
    -e "s/ESPA_SURFACE_REFLECTANCE/master/" \
    -e "s/ESPA_LAND_SURFACE_TEMPERATURE/st-rit-v1.3.0/" \
    -e "s/ESPA_SURFACE_TEMPERATURE/dev_1.4/" \
    -e "s/ESPA_SPECTRAL_INDICES/spectral_indices_v2.7.0/" \
    -e "s/ESPA_SURFACE_WATER_EXTENT/espa-v2.27.0/" \
    -e "s/ESPA_ELEVATION/v2.3.1/" \
    -e "s/ESPA_REPROJECTION/v1.0.3/" \
    -e "s/ESPA_PYTHON_LIBRARY/v1.1.0/" \
    -e "s/ESPA_PROCESSING/2.30.0/" > ${3}

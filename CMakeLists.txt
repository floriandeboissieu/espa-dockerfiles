cmake_minimum_required ( VERSION 3.6 )


include ( InstallExecutable.cmake )


project ( bridge NONE )


set ( ${PROJECT_NAME}_VERSION_MAJOR 0 )
set ( ${PROJECT_NAME}_VERSION_MINOR 8 )
set ( ${PROJECT_NAME}_VERSION_PATCH 1 )
set ( ${PROJECT_NAME}_VERSION_TWEAK 0 )
set ( VERSION ${${PROJECT_NAME}_VERSION_MAJOR}.${${PROJECT_NAME}_VERSION_MINOR}.${${PROJECT_NAME}_VERSION_PATCH}.${${PROJECT_NAME}_VERSION_TWEAK} )


set ( PROJECT_INSTALL_PATH ${CMAKE_INSTALL_PREFIX}/usgs/bridge )
set ( LINK_PROJECT_EXECUTABLES true )


set ( ESPA_PYTHON_LIBRARY v1.1.0 )
set ( ESPA_PRODUCT_FORMATTER product_formatter_v1.13.2.b )
set ( ESPA_L2QA_TOOLS l2qa_tools_v1.6.0 )
set ( ESPA_SPECTRAL_INDICES spectral_indices_v2.6.0 )
set ( ESPA_SURFACE_WATER_EXTENT espa-v2.27.0 )
set ( ESPA_SURFACE_REFLECTANCE surface_reflectance_sept2017 )
set ( ESPA_SURFACE_TEMPERATURE dev_1.2 )
set ( ESPA_ELEVATION v2.3.1 )
set ( ESPA_REPROJECTION v1.0.2 )
set ( ESPA_PLOTTING v0.1.0 )
set ( ESPA_PROCESSING v2.25.0 )


add_subdirectory ( base-image )
add_subdirectory ( thirdparty-image )
add_subdirectory ( science-image )
add_subdirectory ( modtran-build-image )
add_subdirectory ( modtran-image )

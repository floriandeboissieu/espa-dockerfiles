cmake_minimum_required ( VERSION 3.6 )


set ( IMAGE_BASE_NAME ${PROJECT_NAME}/science )
set ( IMAGE_NAME ${PROJECT_NAME}/modtran_build )


configure_file ( ${CMAKE_CURRENT_SOURCE_DIR}/Dockerfile.in
                 Dockerfile
                 @ONLY )

if (NOT EXISTS ${CMAKE_CURRENT_BINARY_DIR}/modtran-5.3.2.tar.gz)
    message(WARNING "modtran-5.3.2.tar.gz not found in build directory.  "
                    "Needed to build the MODTRAN Docker image.")
endif ()

add_custom_target (
    modtran-build-image
    COMMAND docker build --tag ${IMAGE_NAME}:${VERSION} --file Dockerfile .
    DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/modtran-5.3.2.tar.gz
)

add_dependencies(modtran-build-image science-image)

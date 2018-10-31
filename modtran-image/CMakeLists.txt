cmake_minimum_required ( VERSION 3.6 )


set ( IMAGE_BASE_NAME ${PROJECT_NAME}/modtran_build )
set ( IMAGE_SCIENCE_NAME ${PROJECT_NAME}/science )
set ( IMAGE_NAME ${PROJECT_NAME}/modtran )


configure_file ( ${CMAKE_CURRENT_SOURCE_DIR}/Dockerfile.in
                 Dockerfile
                 @ONLY )


add_custom_target (
    modtran-image ALL
    COMMAND docker build --tag ${IMAGE_NAME}:${VERSION} --file Dockerfile .
)

add_dependencies(modtran-image modtran-build-image)

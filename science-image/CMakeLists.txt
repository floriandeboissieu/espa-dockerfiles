cmake_minimum_required ( VERSION 3.6 )


set ( IMAGE_BASE_NAME ${PROJECT_NAME}/external )
set ( IMAGE_NAME ${PROJECT_NAME}/science )


configure_file ( ${CMAKE_CURRENT_SOURCE_DIR}/Dockerfile.in
                 Dockerfile
                 @ONLY )


add_custom_target (
    science-image
    COMMAND cp ${CMAKE_CURRENT_SOURCE_DIR}/science-entrypoint.sh .
    COMMAND docker build --tag ${IMAGE_NAME}:${VERSION} --file Dockerfile .
)

add_dependencies(science-image thirdparty-image)

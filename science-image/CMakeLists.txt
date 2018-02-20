cmake_minimum_required ( VERSION 3.6 )


set ( IMAGE_BASE_NAME ${PROJECT_NAME}/external )
set ( IMAGE_NAME ${PROJECT_NAME}/science )


configure_file ( ${CMAKE_CURRENT_SOURCE_DIR}/Dockerfile.in
                 ${CMAKE_CURRENT_SOURCE_DIR}/Dockerfile
                 @ONLY )


add_custom_target (
    science-image ALL
    COMMAND docker build --tag ${IMAGE_NAME}:${VERSION} --file Dockerfile .
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
)

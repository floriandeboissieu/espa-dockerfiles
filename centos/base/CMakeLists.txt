cmake_minimum_required ( VERSION 3.6 )


set ( IMAGE_NAME ${PROJECT_NAME}/base )


add_custom_target (
    base ALL
    COMMAND docker build --tag ${IMAGE_NAME}:${VERSION} --file Dockerfile .
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
)

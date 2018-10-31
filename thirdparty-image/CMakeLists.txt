cmake_minimum_required ( VERSION 3.6 )


set ( IMAGE_BASE_NAME ${PROJECT_NAME}/base )
set ( IMAGE_NAME ${PROJECT_NAME}/external )


configure_file ( ${CMAKE_CURRENT_SOURCE_DIR}/Dockerfile.in
                 Dockerfile
                 @ONLY )

add_custom_target(retrieve-tools
    COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/retrieve-external-tools.sh)

add_custom_target (
    thirdparty-image
    COMMAND docker build --tag ${IMAGE_NAME}:${VERSION} --file Dockerfile .
)

add_dependencies(thirdparty-image base-image retrieve-tools)

if (NOT IN_SOURCE_BUILD)
    add_custom_target(sha_sum_links
             COMMAND ln -sf ${CMAKE_CURRENT_SOURCE_DIR}/external_sha256_sums
                            ${CMAKE_CURRENT_BINARY_DIR})
    add_dependencies(retrieve-tools sha_sum_links)
endif ()

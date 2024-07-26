cmake_minimum_required(VERSION 3.24)

project(library VERSION "1.0.0" LANGUAGES CXX)

add_compile_options(-Wall -Wextra -pedantic)

include(.cmake/All.cmake)

set(LIBRARY_SOURCE_LOCATION ${CMAKE_CURRENT_SOURCE_DIR}/source)
set(LIBRARY_HEADER_FILES_LOCATION ${CMAKE_CURRENT_SOURCE_DIR}/include/my_library)

add_subdirectory(source)

add_library(my_library ${SOURCE_FILES} ${HEADER_FILES})

configure_file(
    "${CMAKE_CURRENT_SOURCE_DIR}/Config.h.in"
    "${CMAKE_CURRENT_SOURCE_DIR}/Config.h"
)

prepare_for_installation(
    TARGET my_library
    PACKAGE_NAME "my_library"
    HEADERS_LOCATION ${LIBRARY_HEADER_FILES_LOCATION}
)

set(CPACK_PACKAGE_VERSION_MAJOR "${${PROJECT_NAME}_VERSION_MAJOR}")
set(CPACK_PACKAGE_VERSION_MINOR "${${PROJECT_NAME}_VERSION_MINOR}")
set(CPACK_PACKAGE_NAME "my_library")
set(CPACK_GENERATOR "TGZ")
set(CPACK_PACKAGE_FILE_NAME "${CPACK_PACKAGE_NAME}")
include(CPack)

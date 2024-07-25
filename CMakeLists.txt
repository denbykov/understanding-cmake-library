cmake_minimum_required(VERSION 3.24)

project(library VERSION "1.0.0" LANGUAGES CXX)

add_compile_options(-Wall -Wextra -pedantic)

set(SOURCE_FILES
    source/my_library.cpp
)

set(HEADER_FILES
    include/my_library/my_library.h
)

add_library(my_library ${SOURCE_FILES} ${HEADER_FILES})

configure_file(
    "${CMAKE_CURRENT_SOURCE_DIR}/Config.h.in"
    "${CMAKE_CURRENT_SOURCE_DIR}/Config.h"
)

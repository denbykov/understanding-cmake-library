cmake_minimum_required(VERSION 3.24)

macro(propagate_library_sources)
    if (NOT DEFINED LIBRARY_SOURCE_LOCATION)
        message(FATAL_ERROR "LIBRARY_SOURCE_LOCATION is not defined")
    endif()
    
    if (NOT DEFINED LIBRARY_HEADER_FILES_LOCATION)
        message(FATAL_ERROR "LIBRARY_HEADER_FILES_LOCATION is not defined")
    endif()

    foreach (file ${LOCAL_SOURCE_FILES})
        list(APPEND SOURCE_FILES "${CMAKE_CURRENT_SOURCE_DIR}/${file}")
    endforeach ()

    foreach (file ${LOCAL_INTERFACE_HEADER_FILES})
        set(local_file "${CMAKE_CURRENT_SOURCE_DIR}/${file}")
        string(REPLACE "${LIBRARY_SOURCE_LOCATION}" "" include_file ${local_file})
        list(APPEND INTERFACE_HEADER_FILES "${LIBRARY_HEADER_FILES_LOCATION}/${include_file}")
    endforeach ()

    foreach (file ${LOCAL_HEADER_FILES})
        list(APPEND HEADER_FILES "${CMAKE_CURRENT_SOURCE_DIR}/${file}")
    endforeach ()

    set(SOURCE_FILES "${SOURCE_FILES}" PARENT_SCOPE)
    set(INTERFACE_HEADER_FILES "${INTERFACE_HEADER_FILES}" PARENT_SCOPE)
    set(HEADER_FILES "${HEADER_FILES}" PARENT_SCOPE)
endmacro()

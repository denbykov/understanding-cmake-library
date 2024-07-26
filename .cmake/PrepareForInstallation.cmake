cmake_minimum_required(VERSION 3.24)

# Prepare includes, binaries and cmake targets of the given library for installation.

function(prepare_for_installation)
    set(oneValueArgs TARGET PACKAGE_NAME HEADERS_LOCATION)
    cmake_parse_arguments(
        PREPARE_FOR_INSTALLATION "${options}" "${oneValueArgs}"
        "${multiValueArgs}" ${ARGN}
    )

    foreach (file ${INTERFACE_HEADER_FILES})
        string(REPLACE "${${PREPARE_FOR_INSTALLATION_TARGET}_HEADER_FILES_LOCATION}" "" relative_file_path ${file})
        get_filename_component(dir ${relative_file_path} DIRECTORY)
        install(FILES ${file} DESTINATION ${PREPARE_FOR_INSTALLATION_HEADERS_LOCATION}/${dir})
    endforeach ()

    install(TARGETS ${PREPARE_FOR_INSTALLATION_TARGET}
        EXPORT ${PREPARE_FOR_INSTALLATION_TARGET}Targets
        DESTINATION lib)

    install(EXPORT ${PREPARE_FOR_INSTALLATION_TARGET}Targets
        FILE ${PREPARE_FOR_INSTALLATION_TARGET}Targets.cmake
        DESTINATION lib/cmake/${PREPARE_FOR_INSTALLATION_TARGET}
    )

    include(CMakePackageConfigHelpers)

    # generate the config file that is includes the exports
    configure_package_config_file(${CMAKE_CURRENT_SOURCE_DIR}/Config.cmake.in
        "${CMAKE_CURRENT_BINARY_DIR}/${PREPARE_FOR_INSTALLATION_TARGET}Config.cmake"
        INSTALL_DESTINATION "lib/cmake/${PREPARE_FOR_INSTALLATION_TARGET}"
        NO_SET_AND_CHECK_MACRO
        NO_CHECK_REQUIRED_COMPONENTS_MACRO
    )

    write_basic_package_version_file(
        "${CMAKE_CURRENT_BINARY_DIR}/${PREPARE_FOR_INSTALLATION_TARGET}ConfigVersion.cmake"
        VERSION "${test_VERSION_MAJOR}.${test_VERSION_MINOR}"
        COMPATIBILITY AnyNewerVersion
    )

    install(FILES
        ${CMAKE_CURRENT_BINARY_DIR}/${PREPARE_FOR_INSTALLATION_TARGET}Config.cmake
        ${CMAKE_CURRENT_BINARY_DIR}/${PREPARE_FOR_INSTALLATION_TARGET}ConfigVersion.cmake
        DESTINATION lib/cmake/${PREPARE_FOR_INSTALLATION_TARGET}
    )
endfunction()

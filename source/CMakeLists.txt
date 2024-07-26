list(APPEND LOCAL_SOURCE_FILES
    my_library.cpp
)

list(APPEND LOCAL_INTERFACE_HEADER_FILES
    my_library.h
)

propagate_library_sources()

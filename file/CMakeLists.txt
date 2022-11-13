add_executable(decode_file_cxx main.cpp)
target_link_libraries(decode_file_cxx FLAC++)

set_target_properties(decode_file_cxx PROPERTIES LINK_FLAGS "-sFORCE_FILESYSTEM=1 -sEXPORTED_FUNCTIONS=_mains -sEXPORTED_RUNTIME_METHODS=ccall")
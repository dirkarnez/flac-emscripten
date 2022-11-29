cmake_minimum_required(VERSION 3.14)

# set(CMAKE_CXX_STANDARD 11)
# set(CMAKE_CXX_STANDARD_REQUIRED ON)

project(flac-playground)

find_package(flac REQUIRED)

SET(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -static")

add_executable(${PROJECT_NAME} 
    "src/main.cpp"
)

target_link_libraries(${PROJECT_NAME} FLAC::FLAC++)
set_target_properties(${PROJECT_NAME} PROPERTIES LINK_FLAGS "-sFORCE_FILESYSTEM=1 -sEXPORTED_FUNCTIONS=_mains -sEXPORTED_RUNTIME_METHODS=ccall")
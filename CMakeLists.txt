cmake_minimum_required(VERSION 3.14)

SET (CMAKE_CXX_STANDARD 11)
SET (CMAKE_CXX_STANDARD_REQUIRED ON)

project(flac-emscripten)

set(CMAKE_VERBOSE_MAKEFILE on)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/build.emscripten)

find_package(flac REQUIRED)

SET(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -static")

add_executable(${PROJECT_NAME} 
    "src/main.cpp"
)

target_link_libraries(${PROJECT_NAME} FLAC::FLAC++)
set_target_properties(${PROJECT_NAME} PROPERTIES LINK_FLAGS "-sDEMANGLE_SUPPORT=1 -sFORCE_FILESYSTEM=1 --bind")
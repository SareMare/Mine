cmake_minimum_required(VERSION 3.18)

project(oop2)

set(OOP2_DIR ${CMAKE_CURRENT_SOURCE_DIR}/oop2)
set(OOP2_INCLUDE_DIR ${OOP2_DIR}/include)
message("OOP2_DIR = ${OOP2_DIR}")
message("OOP2_INCLUDE_DIR = ${OOP2_INCLUDE_DIR}")

add_subdirectory(oop2)
add_subdirectory(googletest)

include_directories(${OOP2_INCLUDE_DIR})

add_executable(main main.cpp)
target_link_libraries(main oop2)

add_executable(tests tests.cpp)
target_link_libraries(tests oop2 gtest gtest_main)


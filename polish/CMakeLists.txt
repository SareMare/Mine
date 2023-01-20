cmake_minimum_required(VERSION 3.18)

project(oop6)

set(OOP6_DIR ${CMAKE_CURRENT_SOURCE_DIR}/oop6)
set(OOP6_INCLUDE_DIR ${OOP6_DIR}/include)
message("OOP6_DIR = ${OOP6_DIR}")
message("OOP6_INCLUDE_DIR = ${OOP6_INCLUDE_DIR}")

add_subdirectory(oop6)
add_subdirectory(googletest)

include_directories(${OOP6_INCLUDE_DIR})

add_executable(main main.cpp)
target_link_libraries(main oop6)

add_executable(tests tests.cpp)
target_link_libraries(tests oop6 gtest gtest_main)


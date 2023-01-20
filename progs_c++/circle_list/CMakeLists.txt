cmake_minimum_required(VERSION 3.18)

project(oop4)

set(OOP4_DIR ${CMAKE_CURRENT_SOURCE_DIR}/oop4)
set(OOP4_INCLUDE_DIR ${OOP4_DIR}/include)
message("OOP4_DIR = ${OOP4_DIR}")
message("OOP4_INCLUDE_DIR = ${OOP4_INCLUDE_DIR}")

add_subdirectory(oop4)

include_directories(${OOP4_INCLUDE_DIR})

add_executable(main main.cpp)
target_link_libraries(main oop4)




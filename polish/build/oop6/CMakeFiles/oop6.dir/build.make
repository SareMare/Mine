# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.18

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /code

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /code/build

# Include any dependencies generated for this target.
include oop6/CMakeFiles/oop6.dir/depend.make

# Include the progress variables for this target.
include oop6/CMakeFiles/oop6.dir/progress.make

# Include the compile flags for this target's objects.
include oop6/CMakeFiles/oop6.dir/flags.make

oop6/CMakeFiles/oop6.dir/src/oop6.cpp.o: oop6/CMakeFiles/oop6.dir/flags.make
oop6/CMakeFiles/oop6.dir/src/oop6.cpp.o: ../oop6/src/oop6.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/code/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object oop6/CMakeFiles/oop6.dir/src/oop6.cpp.o"
	cd /code/build/oop6 && /usr/local/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/oop6.dir/src/oop6.cpp.o -c /code/oop6/src/oop6.cpp

oop6/CMakeFiles/oop6.dir/src/oop6.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/oop6.dir/src/oop6.cpp.i"
	cd /code/build/oop6 && /usr/local/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /code/oop6/src/oop6.cpp > CMakeFiles/oop6.dir/src/oop6.cpp.i

oop6/CMakeFiles/oop6.dir/src/oop6.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/oop6.dir/src/oop6.cpp.s"
	cd /code/build/oop6 && /usr/local/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /code/oop6/src/oop6.cpp -o CMakeFiles/oop6.dir/src/oop6.cpp.s

# Object files for target oop6
oop6_OBJECTS = \
"CMakeFiles/oop6.dir/src/oop6.cpp.o"

# External object files for target oop6
oop6_EXTERNAL_OBJECTS =

oop6/liboop6.a: oop6/CMakeFiles/oop6.dir/src/oop6.cpp.o
oop6/liboop6.a: oop6/CMakeFiles/oop6.dir/build.make
oop6/liboop6.a: oop6/CMakeFiles/oop6.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/code/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library liboop6.a"
	cd /code/build/oop6 && $(CMAKE_COMMAND) -P CMakeFiles/oop6.dir/cmake_clean_target.cmake
	cd /code/build/oop6 && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/oop6.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
oop6/CMakeFiles/oop6.dir/build: oop6/liboop6.a

.PHONY : oop6/CMakeFiles/oop6.dir/build

oop6/CMakeFiles/oop6.dir/clean:
	cd /code/build/oop6 && $(CMAKE_COMMAND) -P CMakeFiles/oop6.dir/cmake_clean.cmake
.PHONY : oop6/CMakeFiles/oop6.dir/clean

oop6/CMakeFiles/oop6.dir/depend:
	cd /code/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /code /code/oop6 /code/build /code/build/oop6 /code/build/oop6/CMakeFiles/oop6.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : oop6/CMakeFiles/oop6.dir/depend


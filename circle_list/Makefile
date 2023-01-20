# Собрать проект с помощью CMakeLists.txt
.PHONY: build
build:
	docker-compose run --rm gcc-cmake bash -c "cmake -S . -B build && make -C build"

# Скомпилировать main.cpp
.PHONY: compile-main
compile-main:
	docker-compose run --rm gcc-cmake bash -c "mkdir -p ./build && g++ main.cpp -o ./build/main"

# Удалить директорию build
.PHONY: clear
clear:
	docker-compose run --rm gcc-cmake rm -rf /code/build

# Запустить скомпилированную точку входа main.cpp
.PHONY: run-main
run-main:
	docker-compose run --rm gcc-cmake ./build/main

# Запустить скомпилированную точку входа tests.cpp
.PHONY: run-tests
run-tests:
	docker-compose run --rm gcc-cmake ./build/tests

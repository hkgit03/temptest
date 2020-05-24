.PHONY: run debug release

FLAGS=-lglfw -lGL
FLAGS_DEBUG=-g
FLAGS_RELEASE=-O2

run: build/debug
	$<

debug: build/debug
build/debug: *.c
	mkdir -p build
	gcc $(FLAGS) $(FLAGS_DEBUG) -o $@ $+

release: build/release
build/release: *.c
	mkdir -p build
	gcc $(FLAGS) $(FLAGS_RELEASE) -o $@ $+

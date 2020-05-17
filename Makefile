.PHONY: run

target/debug/temptest:
	yaourt -S --needed glfw-wayland cmake
	cargo build

run: target/debug/temptest
	./$<

.PHONY: run

run: target/debug/temptest
	./$<

target/debug/temptest:
	yaourt -S --needed glfw-wayland cmake
	cargo build

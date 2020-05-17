.PHONY: run

PACKAGES=glfw-wayland cmake

target/debug/temptest: src/*.rs
	yaourt -Qi $(PACKAGES) > /dev/null || yaourt -S --needed $(PACKAGES)
	cargo build

run: target/debug/temptest
	./$<

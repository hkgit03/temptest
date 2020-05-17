target/debug/temptest:
	yaourt -S --needed glfw-wayland cmake
	cargo build

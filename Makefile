pkg: $(wildcard src/*)
	wasm-pack build --target web

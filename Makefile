.PHONY: run hs haskell stop clean

evolution: evolution.c
	gcc -o $@ $<

run: evolution
	./$<

hs: haskell
haskell:
	ghc temptest.hs

it:
	@touch halt
	@echo -n "Ne";

stop: halt
	@echo "ver";
	@rm halt

clean:
	# don't remove *~ because those are backups
	rm -rf temptest \
		*.hi *.o \ #haskell
		Cargo.lock target #rust

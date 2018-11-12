evolution: evolution.c
	gcc -o $@ $<

PHONY+=run
run: evolution
	./$<

PHONY+=hs
PHONY+=haskell
hs: haskell
haskell:
	ghc temptest.hs

it:
	@touch halt
	@echo -n "Ne";

PHONY+=halt
stop: halt
	@echo "ver";
	@rm halt

PHONY+=clean
clean:
	# don't remove *~ because those are backups
	rm -rf temptest \
		*.hi *.o \ #haskell
		Cargo.lock target #rust

phony:
	@echo $(PHONY)
.PHONY: $(PHONY) phony

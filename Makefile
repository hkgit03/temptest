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


remove_cmd=rm -rf
PHONY+=clean
clean:
	# don't remove *~ because those are backups
	$(remove_cmd) temptest;
	$(remove_cmd) *.hi *.o; #haskell
	$(remove_cmd) Cargo.lock target; #rust


phony:
	@echo $(PHONY)
.PHONY: $(PHONY) phony

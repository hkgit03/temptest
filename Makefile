.PHONY: stop

it:
	@touch halt
	@echo -n "Ne";

stop: halt
	@echo "ver";
	@rm halt

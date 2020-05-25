.PHONY: install

install: ~/bin
	cp todo "$<"
	mkdir -p ~/todo-lists

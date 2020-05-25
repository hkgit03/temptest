.PHONY: install

install: ~/bin
	cp todo "$<"
	mkdir -p ~/todo-lists
	touch ~/todo-lists/deadline
	touch ~/todo-lists/optional
	touch ~/todo-lists/someday
	touch ~/todo-lists/timewindow

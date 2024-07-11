IGNORE_FILES=$(wildcard completion-*) $(wildcard *~) Makefile tags
SHELL_FILES=$(filter-out $(IGNORE_FILES),$(wildcard *))

tags: $(SHELL_FILES)
	ctags --language-force=sh $(SHELL_FILES)

info:
	@echo SHELL_FILES=$(SHELL_FILES)

# auto generate phony targets
.PHONY: $(shell grep --no-filename -E '^([a-zA-Z_-]|/)+:' $(MAKEFILE_LIST) | sed 's/:.*//')

lint: lint/shfmt lint/shellcheck

lint-check: lint-check/shfmt lint/shellcheck

lint/shfmt:
	shfmt --language-dialect bash --write ./bin/*

lint-check/shfmt:
	shfmt --language-dialect bash --diff ./lib/*

lint/shellcheck:
	shellcheck --shell=bash --source-path=lib bin/* lib/*

GO := go

# Do not use trailing slashes here
STATIK_SRCS :=langserver/documentation/functions

.PHONY: build
build: statik
	$(GO) build cmd/*

.PHONY: clean
clean: 
	git clean -f .

.PHONY: statik
statik: $(patsubst %, %-statik/statik.go, $(STATIK_SRCS))

%-statik/statik.go: $(wildcard %/*)
	statik -src "$*" -dest $(dir $*) -p $(notdir b$*-statik) -f
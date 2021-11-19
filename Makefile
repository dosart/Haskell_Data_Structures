build:
	stack build

formatte:
	find code/ -name '*.hs' -type f -print0 | xargs -0 -I {} -n 1 haskell-formatter --force --input {} --output {}

run:
	@make formatte
	stack exec haskell-data-structures-exe

.PHONY: build formatte build

build:
	stack build

formatte:
	find ./* -name '*.hs' -type f -print0 | xargs -0 -I {} -n 1 haskell-formatter --force --input {} --output {}

lint:
	find ./* -name '*.hs' -type f -print0 | xargs -0 -I {} -n 1 hlint {}

run:
	@make build
	@make formatte
	@make lint
	stack exec haskell-data-structures-exe

.PHONY: build formatte build lint

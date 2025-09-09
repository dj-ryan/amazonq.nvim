.PHONY: lint lint-selene lint-stylua test

lint: lint-selene lint-stylua

lint-selene:
	@printf "\nRunning selene\n"
	selene --display-style=quiet .

lint-stylua:
	@printf "\nRunning stylua\n"
	stylua --check --config-path .stylua.toml --color=always --respect-ignores --glob '**/*.lua' -- .

format:
	@printf "\nFormatting with stylua\n"
	stylua --config-path .stylua.toml --color=always --respect-ignores --glob '**/*.lua' -- .

test:
	nvim -c "cd lua/" -l ../test/util_spec.lua -l ../test/completion_spec.lua

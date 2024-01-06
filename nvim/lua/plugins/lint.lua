return {
	"mfussenegger/nvim-lint",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("lint").linters_by_ft = {
			bash = { "shellcheck" },
			rst = { "rstlint" },
			-- vim = { "vint" },
			-- yaml = { "yamllint" },
			-- go = { "golangcilint" }, -- TODO: not working
			-- lua = { "luacheck" }, -- TODO: find out why error
			-- python = { "mypy", "pylint" },
			-- python = { "ruff" },
			-- sh = { "dash", "shellcheck" },
			-- sh = { "shellcheck" }, -- TODO: fix double vitual text
			-- ["*"] = { "codespell" },
		}
		require("lint").linters = {}

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "TextChanged", "InsertLeave" }, {
			group = vim.api.nvim_create_augroup("Lint", { clear = true }),
			callback = function()
				require("lint").try_lint(nil, { ignore_errors = true })
			end,
		})
	end,
}

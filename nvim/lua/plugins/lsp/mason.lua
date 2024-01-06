return {
	"williamboman/mason.nvim",
	lazy = false,
	build = { ":MasonToolsUpdate", ":MasonToolsClean" },
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("mason").setup({
			ui = {
				border = { "+", "-", "+", "|" },
				icons = {
					package_installed = "[+]",
					package_pending = "[>]",
					package_uninstalled = "[-]",
				},
			},
		})

		require("mason-lspconfig").setup({
			-- ensure_installed = { "bashls", "rust_analyzer" },
			-- automatic_installation = false,
		})

		--- TODO: convert to mason-lspconfig instead of using nvim-lspconfig directly? See :help mason-lspconfig.txt
		-- require("mason-lspconfig").setup_handlers({
		-- 	-- The first entry (without a key) will be the default handler
		-- 	-- and will be called for each installed server that doesn't have
		-- 	-- a dedicated handler.
		-- 	function(server_name) -- default handler (optional)
		-- 		require("lspconfig")[server_name].setup({})
		-- 	end,
		-- 	-- Next, you can provide a dedicated handler for specific servers.
		-- 	-- For example, a handler override for the `rust_analyzer`:
		-- 	["rust_analyzer"] = function()
		-- 		require("rust-tools").setup({})
		-- 	end,
		-- })

		require("mason-tool-installer").setup({
			auto_update = true,
			run_on_start = true,
			start_delay = 2000,
			-- debounce_hours = 5,
			ensure_installed = {
				"asmfmt",
				"bashls",
				"black",
				"clangd",
				"codespell",
				"debugpy",
				"delve",
				"gofumpt",
				"golangci-lint",
				"golangci_lint_ls",
				"golines",
				"gomodifytags",
				"google-java-format",
				"gopls",
				"gotests",
				"impl",
				"isort",
				"jdtls",
				"jedi_language_server",
				"lua_ls",
				"luacheck",
				"marksman",
				"prettier",
				-- "ruff",
				"ruff_lsp",
				"shellcheck",
				"shfmt",
				"staticcheck",
				"stylua",
				"taplo",
				"yamlfmt",
				"yamlls",
				-- "asm_lsp", -- not working https://github.com/williamboman/mason.nvim/issues/580
			},
		})
	end,
}

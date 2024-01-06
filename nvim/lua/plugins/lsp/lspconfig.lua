return {
	"neovim/nvim-lspconfig",
	lazy = true,
	event = "BufReadPre",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "j-hui/fidget.nvim", config = true },
	},
	config = function()
		-- border
		require("lspconfig.ui.windows").default_options.border = { "+", "-", "+", "|" }

		-- keymaps
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf }
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
				vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
				vim.keymap.set("n", "gp", vim.diagnostic.open_float, opts)
				vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
				vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references, opts)
				vim.keymap.set({ "n", "i" }, "<C-h>", vim.lsp.buf.signature_help, opts)
				vim.keymap.set("n", "<leader>p", ":Telescope diagnostics<cr>", opts)
				-- TODO: conflicts with harpoon??:
				-- vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
				-- vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
				-- vim.keymap.set("n", "<space>wl", function()
				-- 	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				-- end, opts)
				vim.keymap.set("n", "<leader>li", ":LspInfo<cr>", opts)
				vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
			end,
		})

		-- Python
		require("lspconfig").jedi_language_server.setup({
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
			init_options = {
				diagnostics = {
					enable = false,
				},
			},
		})

		-- Python
		require("lspconfig").ruff_lsp.setup({
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
			on_attach = function(client, _)
				-- Disable hover in favour of another LSP
				client.server_capabilities.hoverProvider = false
			end,
			init_options = {
				settings = {
					args = {
						"--extend-select=W,COM,ICN",
						"--ignore=E501,E722,COM812",
					},
				},
			},
		})

		-- Go
		require("lspconfig").gopls.setup({
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
			settings = {
				gopls = {
					completeUnimported = true,
					gofumpt = true, -- A stricter gofmt
					staticcheck = true,
					usePlaceholders = true, -- enables placeholders for function parameters or struct fields in completion responses
					experimentalPostfixCompletions = true,
					analyses = {
						-- SEE: https://github.com/golang/tools/blob/master/gopls/doc/analyzers.md
						-- fieldalignment = true, -- find structs that would use less memory if their fields were sorted
						nilness = true, -- check for redundant or impossible nil comparisons
						-- shadow = true, -- check for possible unintended shadowing of variables
						unusedparams = true, -- check for unused parameters of functions
						unusedwrite = true, -- checks for unused writes, an instances of writes to struct fields and arrays that are never read
						useany = true, -- check for constraints that could be simplified to "any"
					},
					-- SEE: https://github.com/golang/tools/blob/master/gopls/doc/settings.md#code-lenses
					codelenses = {
						gc_details = true, -- Toggle the calculation of gc annotations
						generate = true, -- Runs go generate for a given directory
						regenerate_cgo = true, -- Regenerates cgo definitions
						run_govulncheck = true,
						test = true, -- Runs go test for a specific set of test or benchmark functions
						tidy = true, -- Runs go mod tidy for a module
						upgrade_dependency = true, -- Upgrades a dependency in the go.mod file for a module
						vendor = true, -- Runs go mod vendor for a module
					},
					hints = {
						assignVariableTypes = true,
						compositeLiteralFields = true,
						compositeLiteralTypes = true,
						constantValues = true,
						functionTypeParameters = true,
						parameterNames = true,
						rangeVariableTypes = true,
					},
				},
			},
		})

		-- C
		require("lspconfig").clangd.setup({
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
		})

		-- Bash/sh
		require("lspconfig").bashls.setup({
			filetypes = { "sh", "bash" },
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
		})

		require("lspconfig").lua_ls.setup({
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
			settings = {
				Lua = {
					hint = { enable = true },
					telemetry = { enable = false },
					diagnostics = { globals = { "vim" } },
					workspace = { checkThirdParty = false },
				},
			},
		})

		-- YAML
		require("lspconfig").yamlls.setup({
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
			settings = {
				yaml = {
					keyOrdering = false,
					schemaStore = {
						enable = true,
						url = "https://www.schemastore.org/api/json/catalog.json",
					},
					schemas = {
						kubernetes = "*.yaml",
						["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
						["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
						["https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json"] = "azure-pipelines.yml",
						["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
						["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
						["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
						["http://json.schemastore.org/ansible-playbook"] = "*play*.{yml,yaml}",
						["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
						["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
						["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = "*gitlab-ci*.{yml,yaml}",
						["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.{yml,yaml}",
						["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
						["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "*flow*.{yml,yaml}",
					},
					format = { enabled = false },
					validate = false,
					completion = true,
					hover = true,
				},
			},
		})

		-- TOML
		require("lspconfig").taplo.setup({
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
		})
	end,
}

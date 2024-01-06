return {
	"stevearc/conform.nvim",
	lazy = true,
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_fallback = true }, function(err)
					if not err then
						if vim.startswith(vim.api.nvim_get_mode().mode:lower(), "v") then
							vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
						end
					end
				end)
			end,
			mode = "",
		},
	},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				arm = { "asmfmt" },
				asm = { "asmfmt" },
				bash = { "shfmt" },
				c = { "indent" },
				go = { "gofumpt", "golines" }, -- gofumpt because gopls doesn't full adapt it
				-- go = { "goimports", "gofmt" }
				-- go = { "golines" },
				java = { "google-java-format" },
				json = { "prettier" },
				lua = { "stylua" },
				-- markdown = { "injected" },
				-- markdown = { "prettier", "injected" },
				-- python = { "isort", "black" },
				python = { "isort", "ruff_fix", "ruff_format" },
				sh = { "shfmt" },
				-- yaml = { "prettier" },
				yaml = { "yamlfmt" },
				toml = { "taplo" },
				-- ["*"] = { "codespell" },
				-- ["_"] = { "trim_whitespace", "trim_newlines" },
			},
			format_on_save = {
				async = false,
				lsp_fallback = true,
				timeout_ms = 500,
				quiet = true,
			},
			-- notify_on_error = false,
			formatters = {
				yamlfmt = {
					prepend_args = {
						"-formatter",
						"indent=2,include_document_start=false,line-ending=lf,pad_line_comments=2",
					},
				},
				indent = {
					-- "Modern C" coding style that is more consistent with that of JavaScript, Go, and Rust
					prepend_args = {
						"--linux-style",
						"--braces-on-if-line",
						"--braces-on-func-def-line",
						"--braces-on-struct-decl-line",
						"--dont-cuddle-do-while",
						"--dont-cuddle-else",
						"--format-all-comments",
						-- "-ip0",
						-- "-i2",
						"--continuation-indentation2",
						"-ut",
						-- "--tab-size2",
						"--no-parameter-indentation",
						-- TOOD: remove space indenting thing
					},
				},
				stylua = {
					-- defaults
					prepend_args = {
						"--column-width",
						"120",
						"--line-endings",
						"Unix",
						"--indent-type",
						"Tabs",
						"--indent-width",
						"2",
						"--quote-style",
						"AutoPreferDouble",
						"--call-parentheses",
						"Always",
						"--collapse-simple-statement",
						"Never",
					},
				},
			},
		})
		-- dunno, see doc
		vim.opt.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}

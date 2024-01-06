return {
	"nvim-treesitter/nvim-treesitter",
	version = false,
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"nvim-treesitter/nvim-treesitter-context",
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			sync_install = false,
			auto_install = true,
			indent = { enable = true },
			highlight = {
				enable = true,
				disable = {},
				additional_vim_regex_highlighting = false,
			},
			ignore_install = {},
			ensure_installed = {
				"bash",
				"c",
				"c_sharp",
				"cmake",
				"comment",
				"cpon",
				"cpp",
				"csv",
				"diff",
				"dockerfile",
				"git_config",
				"git_rebase",
				"gitattributes",
				"gitcommit",
				"gitignore",
				"go",
				"gomod",
				"gosum",
				"gowork",
				"gpg",
				"html",
				"http",
				"java",
				"javascript",
				"jsdoc",
				"json",
				"json5",
				"latex",
				"llvm",
				"lua",
				"luadoc",
				"luap",
				"m68k",
				"make",
				"markdown",
				"markdown_inline",
				"nasm",
				"passwd",
				"perl",
				"pioasm",
				"pod",
				"psv",
				"python",
				"query",
				"regex",
				"rst",
				"rust",
				"sql",
				"ssh_config",
				"todotxt",
				"toml",
				"tsv",
				"vim",
				"vimdoc",
				"yaml",
			},
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["ai"] = { query = "@conditional.outer" },
						["ii"] = { query = "@conditional.inner" },

						["al"] = { query = "@loop.outer" },
						["il"] = { query = "@loop.inner" },

						["af"] = { query = "@function.outer" },
						["if"] = { query = "@function.inner" },

						["ac"] = { query = "@class.outer" },
						["ic"] = { query = "@class.inner" },
					},
				},
			},
			require("treesitter-context").setup({
				enable = true,
				max_lines = 1,
				min_window_height = 0,
				line_numbers = true,
				multiline_threshold = 20,
				trim_scope = "outer",
				mode = "cursor", -- cursor or topline
				separator = nil, -- nil or single character
				zindex = 20, -- z-index of the context window
				on_attach = function()
					return true
				end, -- (fun(buf: integer): boolean) return false to disable attaching
			}),
		})
		-- vim.api.nvim_set_hl(0, "TreesitterContext", { bg = "#565656" })
		vim.api.nvim_set_hl(0, "TreesitterContext", { bg = "#000000" })
	end,
}

-- TODO: See https://github.com/edr3x/.dotfiles/blob/master/nvim/.config/nvim/lua/r3x/plugins/cmp.lua
return {
	"hrsh7th/nvim-cmp",
	lazy = true,
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths
		"hrsh7th/cmp-cmdline", -- source for vim's cmdline
		"hrsh7th/cmp-nvim-lsp-signature-help", -- signature help
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
	},
	config = function()
		require("luasnip/loaders/from_vscode").lazy_load()
		require("cmp").setup({
			-- configure how nvim-cmp interacts with snippet engine
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			-- sources for autocompletion
			sources = require("cmp").config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
				{ name = "nvim_lsp_signature_help" },
			}),
			duplicates = {
				nvim_lsp = 1,
				luasnip = 1,
				buffer = 1,
				path = 1,
				nvim_lua = 1,
				nvim_lsp_signature_help = 1,
			},
			formatting = {
				fields = { "abbr", "kind", "menu" },
				format = function(entry, vim_item)
					vim_item.menu = ({
						nvim_lsp = "[LSP]",
						luasnip = "[Snip]",
						buffer = "[Buff]",
						path = "[Path]",
						nvim_lsp_signature_help = "[Sign]",
					})[entry.source.name]

					-- for tailwind colors
					return vim_item
				end,
			},
			mapping = require("cmp").mapping.preset.insert({
				["<C-j>"] = require("cmp").mapping.select_next_item(), -- next suggestion
				["<C-k>"] = require("cmp").mapping.select_prev_item(), -- previous suggestion
				["<C-d>"] = require("cmp").mapping.scroll_docs(4),
				["<C-u>"] = require("cmp").mapping.scroll_docs(-4),
				["<C-leader>"] = require("cmp").mapping.complete(), -- show completion suggestions
				["<C-e>"] = require("cmp").mapping.abort(), -- close completion window
				["<Tab>"] = require("cmp").mapping.confirm({ select = true }),
			}),
			completion = {
				-- completeopt = "menu,menuone,preview,select",
				completeopt = "menu,menuone,preview,noselect",
			},
			window = {
				completion = {
					border = { "+", "-", "+", "|", "+", "-", "+", "|" },
					winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
					-- winhighlight = "Normal:CmpPmenu,Search:PmenuSel",
					-- completeopt = "menu,menuone,noselect",
					autocomplete = false,
					scrollbar = false,
					-- border = "single",
					-- border = "none",
				},
				documentation = {
					border = { "+", "-", "+", "|", "+", "-", "+", "|" },
					winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
					-- winhighlight = "Normal:CmpDoc",
					-- border = "single",
					-- border = "none",
				},
			},
			view = {
				entries = "custom", -- can be "custom", "wildmenu" or "native"
			},
			experimental = {
				ghost_text = false,
				native_menu = false,
			},
		})

		-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
		require("cmp").setup.cmdline({ "/", "?" }, {
			mapping = require("cmp").mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
			view = {
				entries = "wildmenu", -- can be "custom", "wildmenu" or "native"
			},
		})

		-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
		require("cmp").setup.cmdline(":", {
			mapping = require("cmp").mapping.preset.cmdline(),
			sources = require("cmp").config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
			view = {
				entries = "wildmenu", -- can be "custom", "wildmenu" or "native"
			},
		})
	end,
}

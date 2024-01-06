return {
	"rose-pine/neovim",
	name = "rose-pine",
	lazy = false,
	priority = 1000,
	config = function()
		require("rose-pine").setup({
			--- @usage 'auto'|'main'|'moon'|'dawn'
			variant = "auto",
			--- @usage 'main'|'moon'|'dawn'
			dark_variant = "main",
			bold_vert_split = false,
			dim_nc_background = false,
			disable_background = true,
			disable_float_background = true,
			disable_italics = true,

			highlight_groups = {
				-- CursorLine = { fg = "none", bg = "none", underline = true },
				Visual = { fg = "NONE", bg = "NONE", reverse = true },
				-- TelescopeSelection = { fg = "text", bg = "none", underline = true },
			},
		})
		vim.cmd.colorscheme("rose-pine")
	end,
}

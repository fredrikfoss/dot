local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ { import = "plugins" }, { import = "plugins.lsp" } }, {
	install = {
		colorscheme = { "rose-pine" },
	},
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		enabled = true,
		notify = false,
	},
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
	ui = {
		border = { "+", "-", "+", "|" },
		icons = {
			cmd = "[cmd]",
			config = "[config]",
			event = "[event]",
			ft = "[ft]",
			init = "[init]",
			import = "[import]",
			keys = "[keys]",
			lazy = "   ",
			loaded = "[+]",
			not_loaded = "[-]",
			plugin = "[plugin]",
			runtime = "[runtime]",
			require = "[require]",
			source = "[source]",
			start = "[start]",
			task = "[task]",
			list = {
				"*",
				"+",
				"-",
				".",
			},
		},
	},
})

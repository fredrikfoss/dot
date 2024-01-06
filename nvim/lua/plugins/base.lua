return {
	{
		"kylechui/nvim-surround",
		lazy = false,
		version = "*",
		event = { "BufRead", "BufNewFile" },
		config = true,
	},
	{
		"numToStr/Comment.nvim",
		lazy = true,
		event = { "BufRead", "BufNewFile" },
		opts = {},
	},
	{
		"folke/zen-mode.nvim",
		lazy = true,
		keys = { { "<leader>z", "<cmd>ZenMode<cr>" } },
		opts = {
			window = {
				width = 0.70,
				backdrop = 0.90,
			},
		},
	},
	{
		"mbbill/undotree",
		lazy = true,
		keys = { { "<leader>u", "<cmd>UndotreeToggle<cr>" } },
	},
	{
		"iamcco/markdown-preview.nvim",
		lazy = true,
		ft = "markdown",
		keys = { { "<leader>m", "<cmd>MarkdownPreviewToggle<cr>" } },
		config = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
}

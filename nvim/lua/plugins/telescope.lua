-- return {
-- 	"nvim-telescope/telescope.nvim",
-- 	cmd = "Telescope",
-- 	keys = {
-- 		{ "<leader><leader>", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
-- 		{ "<leader>/", "<cmd>Telescope live_grep<cr>", desc = "Grep" },
-- 	},
-- 	dependencies = {
-- 		"nvim-lua/plenary.nvim",
-- 		"nvim-tree/nvim-web-devicons",
-- 		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
-- 	},
-- 	config = function()
-- 		local actions = require("telescope.actions")
-- 		require("telescope").setup({
-- 			defaults = {
-- 				prompt_prefix = " ",
-- 				selection_caret = " ",
-- 				mappings = {
-- 					i = {
-- 						["<C-j>"] = actions.move_selection_next,
-- 						["<C-k>"] = actions.move_selection_previous,
-- 						["<Esc>"] = actions.close,
-- 					},
-- 				},
-- 			},
-- 			pickers = {
-- 				find_files = {
-- 					theme = "dropdown",
-- 					previewer = false,
-- 				},
-- 			},
-- 		})
-- 		require("telescope").load_extension("fzf")
-- 	end,
-- }

return {
	"nvim-telescope/telescope.nvim",
	lazy = true,
	cmd = "Telescope",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	keys = {
		{ "<leader>e", "<cmd>Telescope find_files<cr>" },
		{ "<leader>/", "<cmd>Telescope live_grep<cr>" },
		{ "<leader>g", "<cmd>Telescope git_files<cr>" },
	},
	config = function()
		require("telescope").setup({
			defaults = {
				previewer = false,
				hidden = true,
				file_ignore_patterns = {},
				initial_mode = "insert",
				select_strategy = "reset",
				sorting_strategy = "ascending",
				layout_strategy = "horizontal",
				prompt_prefix = "",
				dynamic_preview_title = false,
				results_title = false,
				prompt_title = false,
				-- borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
				-- borderchars = { "-", "|", "-", "|", "+", "+", "+", "+" },
				borderchars = {
					-- prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
					-- results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
					-- preview = { "─", "│", "─", "│", "┌", "┐", "┘", "┘" },
					prompt = { "-", "|", " ", "|", "+", "+", "|", "|" },
					results = { "-", "|", "-", "|", "|", "|", "+", "+" },
					preview = { "-", "|", "-", "|", "+", "+", "+", "+" },
				},
				layout_config = {
					--   width = 0.5,
					--   height = 0.4,
					prompt_position = "top",
					--   preview_cutoff = 120,
				},
				mappings = {
					i = {
						["<C-k>"] = require("telescope.actions").move_selection_previous, -- move to prev result
						["<C-j>"] = require("telescope.actions").move_selection_next, -- move to next result
						["<C-q>"] = require("telescope.actions").send_selected_to_qflist + require("telescope.actions").open_qflist, -- send selected to quickfixlist
					},
				},
			},
			pickers = {
				find_files = {
					previewer = false,
					dynamic_preview_title = false,
					results_title = false,
					prompt_title = false,
					layout_config = {
						width = 0.5,
						height = 0.7,
						prompt_position = "top",
						preview_cutoff = 120,
					},
				},
				live_grep = {
					only_sort_text = true,
					previewer = true,
					dynamic_preview_title = false,
					results_title = false,
					prompt_title = false,
					preview_title = false,
					layout_config = {
						horizontal = {
							width = 0.7,
							height = 0.7,
							preview_width = 0.5,
						},
					},
				},
				git_files = {
					previewer = false,
					dynamic_preview_title = false,
					results_title = false,
					prompt_title = false,
					layout_config = {
						width = 0.5,
						height = 0.7,
						prompt_position = "top",
						preview_cutoff = 120,
					},
				},
			},
		})
		pcall(require("telescope").load_extension, "fzf")
	end,
}

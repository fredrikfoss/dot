return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	lazy = true,
	dependecies = "nvim-lua/plenary.nvim",
	keys = {
		{ "<leader>A" },
		{ "<leader>a" },
		{ "<leader>1" },
		{ "<leader>2" },
		{ "<leader>3" },
		{ "<leader>4" },
	},
	config = function()
		require("harpoon"):setup()

		vim.keymap.set("n", "<leader>A", function()
			require("harpoon"):list():append()
		end)

		-- vim.keymap.set("n", "<leader>w", function()
		-- 	require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
		-- end)

		vim.keymap.set("n", "<leader>a", function()
			require("harpoon").ui:toggle_quick_menu(
				require("harpoon"):list(),
				{ border = { "+", "-", "+", "|", "+", "-", "+", "|" }, title_pos = "center" }
			)
		end)

		vim.keymap.set("n", "<leader>1", function()
			require("harpoon"):list():select(1)
		end)

		vim.keymap.set("n", "<leader>2", function()
			require("harpoon"):list():select(2)
		end)

		vim.keymap.set("n", "<leader>3", function()
			require("harpoon"):list():select(3)
		end)

		vim.keymap.set("n", "<leader>4", function()
			require("harpoon"):list():select(4)
		end)
	end,
}

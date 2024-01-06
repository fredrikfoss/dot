return {
	{
		"mfussenegger/nvim-dap",
		lazy = true,
		config = function()
			vim.keymap.set("n", "<leader>s", function()
				require("dap").continue()
			end)
			vim.keymap.set("n", "<up>", function()
				require("dap").step_over()
			end)
			vim.keymap.set("n", "<down>", function()
				require("dap").step_into()
			end)
			vim.keymap.set("n", "<right>", function()
				require("dap").step_out()
			end)
			vim.keymap.set("n", "<leader>b", function()
				require("dap").toggle_breakpoint()
			end)
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		lazy = true,
		dependencies = "mfussenegger/nvim-dap",
		config = function()
			require("dapui").setup()
			require("dap").listeners.after.event_initialized["dapui_config"] = function()
				require("dapui").open()
			end
			require("dap").listeners.before.event_terminated["dapui_config"] = function()
				require("dapui").close()
			end
			require("dap").listeners.before.event_exited["dapui_config"] = function()
				require("dapui").close()
			end
		end,
	},
	{
		"mfussenegger/nvim-dap-python",
		lazy = true,
		ft = "python",
		dependencies = { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui" },
		config = function()
			require("dap-go").setup()
		end,
	},
	{
		"leoluz/nvim-dap-go",
		lazy = true,
		ft = { "go", "gomod", "gosum", "gowork" },
		dependencies = { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui" },
		config = function()
			require("dap-python").setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
			-- require("dap-python").setup(vim.fn.stdpath("data" .. "/mason/packages/debugpy/venv/bin/python"))
		end,
	},
}

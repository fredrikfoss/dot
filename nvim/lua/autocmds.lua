-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	-- group = augroup("highlight_yank"),
	group = vim.api.nvim_create_augroup("highlight_yank", {}),
	-- group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})

-- Go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
	-- group = augroup("last_loc"),
	group = vim.api.nvim_create_augroup("last_loc", {}),
	callback = function(event)
		local exclude = { "gitcommit" }
		local buf = event.buf
		if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
			return
		end
		vim.b[buf].lazyvim_last_loc = true
		local mark = vim.api.nvim_buf_get_mark(buf, '"')
		local lcount = vim.api.nvim_buf_line_count(buf)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
	-- group = augroup("resize_splits"),
	group = vim.api.nvim_create_augroup("resize_splis", {}),
	callback = function()
		local current_tab = vim.fn.tabpagenr()
		vim.cmd("tabdo wincmd =")
		vim.cmd("tabnext " .. current_tab)
	end,
})

-- Close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
	-- group = augroup("close_with_q"),
	group = vim.api.nvim_create_augroup("close_with_q", {}),
	pattern = {
		"PlenaryTestPopup",
		"help",
		"lspinfo",
		"man",
		"notify",
		"qf",
		"query",
		"spectre_panel",
		"startuptime",
		"tsplayground",
		"neotest-output",
		"checkhealth",
		"neotest-summary",
		"neotest-output-panel",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})

-- Wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
	-- group = augroup("wrap_spell"),
	group = vim.api.nvim_create_augroup("wrap_spell", {}),
	pattern = { "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.spell = true
		vim.opt_local.textwidth = 0
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true

		vim.api.nvim_buf_set_keymap(0, "n", "j", "gj", { noremap = true })
		vim.api.nvim_buf_set_keymap(0, "n", "k", "gk", { noremap = true })
		vim.api.nvim_buf_set_keymap(0, "n", "0", "g0", { noremap = true })
		vim.api.nvim_buf_set_keymap(0, "n", "$", "g$", { noremap = true })

		vim.api.nvim_buf_set_keymap(0, "v", "j", "gj", { noremap = true })
		vim.api.nvim_buf_set_keymap(0, "v", "k", "gk", { noremap = true })
		vim.api.nvim_buf_set_keymap(0, "v", "0", "g0", { noremap = true })
		vim.api.nvim_buf_set_keymap(0, "v", "$", "g$", { noremap = true })
	end,
})

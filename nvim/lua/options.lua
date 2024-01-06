vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.autowrite = true -- Enable auto write
vim.opt.spelllang = { "en" }
-- vim.opt.pumblend = 10 -- Popup blend
vim.opt.pumheight = 10 -- Maximum number of entries in a popup
vim.opt.number = true
vim.opt.relativenumber = false
-- vim.opt.signcolumn = "no"
vim.opt.signcolumn = "number"
vim.opt.textwidth = 100
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.wrap = false
vim.opt.guicursor = ""
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.wildmenu = true
vim.opt.wildoptions = "fuzzy"
vim.opt.mouse = ""
--vim.opt.cursorline = true
--vim.opt.scrolloff = 8
vim.opt.ignorecase = true
vim.opt.smartcase = true
if os.getenv("PLATFORM") == "mac" then
	vim.opt.backspace = "indent,eol,start"
end
-- vim.opt.splitright = true
-- vim.opt.splitbelow = true
vim.opt.iskeyword:append("-")
-- vim.opt.isfname:append("@-@")
-- vim.opt.cinoptions:append(":0")

vim.opt.updatetime = 50
vim.opt.timeoutlen = 300

-- vim.g.netrw_browse_split = 0
-- vim.g.netrw_banner = 0
-- vim.g.netrw_winsize = 25
-- -- vim.g.netrw_winsize = 50

vim.g.netrw_preview = 1
vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = 30

vim.opt.conceallevel = 0
--vim.g.python_recommended_style = 0 -- disable recommended python style
vim.g.markdown_recommended_style = 0 -- Fix markdown indentation settings
vim.opt.fileformat = "unix"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.fixendofline = false
vim.opt.foldmethod = "manual"
vim.opt.foldenable = false
--vim.opt.shortmess:append('aoOtTI')
--vim.opt.shortmess:append('a')
--vim.opt.shortmess:append('o')
--vim.opt.shortmess:append('O')
--vim.opt.shortmess:append('t')
--vim.opt.shortmess:append('T')
--vim.opt.shortmess:append('I')
-- vim.opt.shortmess = "aoOtTIc"
vim.opt.shortmess:append({ W = true, I = true, c = true, C = true })
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.shada = "'20,<1000,s1000"
vim.opt.undodir = vim.fn.stdpath("state") .. "/undo"
vim.opt.backupdir = vim.fn.stdpath("state") .. "/backup"
vim.opt.directory = vim.fn.stdpath("state") .. "/swap"
vim.opt.shadafile = vim.fn.stdpath("state") .. "/shada/main.shada"
vim.opt.laststatus = 0
vim.opt.ruler = true
vim.opt.rulerformat = "%50(%=%.50F [%{strlen(&ft)?&ft:'none'}] %l:%c %p%%%)"
vim.opt.listchars = { space = "*", trail = "*", nbsp = "*", extends = ">", precedes = "<", tab = "|>" }
vim.opt.fillchars = {
	vert = "|",
	horiz = "-",
	horizup = "+",
	horizdown = "+",
}
-- vim.opt.fillchars = {
--   fold = " ",
--   vert = "┃",
--   horiz = "━",
--   horizup = "┻",
--   horizdown = "┳",
--   vertleft = "┫",
--   vertright = "┣",
--   verthoriz = "╋",
-- }

-- LSP UI boxes improvements
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = { "+", "-", "+", "|" } })
vim.lsp.handlers["textDocument/signatureHelp"] =
	vim.lsp.with(vim.lsp.handlers.signature_help, { border = { "+", "-", "+", "|" } })
vim.diagnostic.config({
	underline = true,
	float = { border = { "+", "-", "+", "|" }, style = "minimal" },
})

-- Highlight trailing whitespace
vim.api.nvim_set_hl(0, "TrailingWhitespace", { bg = "#562626" })
local function highlight_trailing_whitespace()
	vim.api.nvim_exec("nohlsearch", false)
	vim.fn.matchadd("TrailingWhitespace", "\\s\\+$")
end
vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave" }, {
	pattern = "*",
	callback = highlight_trailing_whitespace,
})

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

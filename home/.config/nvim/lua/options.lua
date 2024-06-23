-- Leaderkey
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Performance
vim.opt.updatecount = 0
vim.opt.updatetime = 0
vim.opt.timeout = false
vim.opt.ttimeoutlen = 0
vim.opt.autowrite = true
vim.opt.lazyredraw = true
vim.opt.showcmd = false
vim.opt.shelltemp = false

-- Undo/backup
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.shada = "'20,<1000,s1000"
vim.opt.shada = { "!", "'1000", "<50", "s10", "h" }

-- Encoding
vim.opt.fileformat = "unix"
vim.opt.fileencoding = "utf-8"
vim.opt.fixendofline = true
vim.opt.foldenable = false

-- Indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.smartindent = false
vim.opt.breakindent = true

-- UI
-- vim.opt.textwidth = 80
vim.opt.wrap = false
vim.opt.smoothscroll = true
vim.opt.guicursor = ""
vim.opt.wildoptions = "fuzzy"
-- vim.opt.mouse = ""
--vim.opt.cursorline = true
--vim.opt.scrolloff = 8
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.number = true
vim.opt.signcolumn = "yes"
vim.opt.pumheight = 10
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.splitkeep = "topline"
vim.opt.listchars = { space = "*", trail = "*", nbsp = "*", extends = ">", precedes = "<", tab = "|>" }
vim.opt.completeopt = { "menu", "menuone", "noselect", "noinsert" }

-- Status line
vim.opt.laststatus = 0
-- vim.opt.rulerformat = "%40(%=%#ModeMsg#%.50F %(%m %)[%{&ft!=''?&ft:'none'}] %l:%c%V %p%%%)"
vim.opt.rulerformat = "%40(%=%50F %(%m %)[%{&ft!=''?&ft:'none'}] %l:%c%V %p%%%)"
vim.opt.shortmess = { a = true, o = true, O = true, t = true, T = true, I = true, c = true, C = true }

-- function MyStatusLine()
--     local filetype = vim.bo.filetype ~= "" and vim.bo.filetype or "none"
--     local line = vim.fn.line(".")
--     local col = vim.fn.virtcol(".")
--     local percent = math.floor(100 * line / vim.fn.line("$"))
--     local filename = vim.fn.expand("%:t")
--     return string.format("%50(%=%#ModeMsg#%.50s [%s] %d:%d %d%%%)", filename, filetype, line, col, percent)
-- end
-- vim.opt.statusline = "%!v:lua.MyStatusLine()"

-- vim.g.python_recommended_style = 0 -- disable recommended python style
-- vim.g.markdown_recommended_style = 0 -- Fix markdown indentation settings
-- vim.g.zig_recommended_style = 0
vim.g.zig_fmt_autosave = false

-- Diagnostic details
vim.diagnostic.config({
    signs = true,
    underline = false,
    virtual_text = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        focusable = true,
        style = "minimal",
        border = "single",
        source = "always",
        header = "",
        -- prefix = "",
    },
})

-- Documentation window
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "single",
    title = "",
})

-- Signature help
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "single",
    title = "",
})

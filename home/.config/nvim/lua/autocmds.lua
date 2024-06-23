-- Disable diagnostics in insert mode
vim.api.nvim_create_autocmd("ModeChanged", {
    pattern = { "*:i" },
    callback = function(e)
        vim.diagnostic.enable(false, { bufnr = e.buf })
    end,
})

-- Enable diagnostics when leaving insert mode
vim.api.nvim_create_autocmd("ModeChanged", {
    pattern = "i:*",
    callback = function(e)
        vim.diagnostic.enable(true, { bufnr = e.buf })
    end,
})

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
    group = vim.api.nvim_create_augroup("checktime", { clear = true }),
    callback = function()
        if vim.o.buftype ~= "nofile" then
            vim.cmd("checktime")
        end
    end,
})

-- Highlight trailing whitespace
vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave" }, {
    group = vim.api.nvim_create_augroup("hl_trailing_ws", { clear = true }),
    callback = function()
        vim.cmd.nohlsearch()
        local normal_bg = vim.api.nvim_get_hl_by_name("Normal", true).background
        local highlight_bg = normal_bg and (normal_bg + 0x101010) or nil
        vim.api.nvim_set_hl(0, "TrailingWhitespace", { bg = highlight_bg })
        vim.fn.matchadd("TrailingWhitespace", "\\s\\+$")
    end,
})

-- -- Tab behavior
-- vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile", "OptionSet" }, {
--     group = vim.api.nvim_create_augroup("tab_behavior", { clear = true }),
--     callback = function()
--         if vim.opt_local.expandtab then
--             vim.opt_local.tabstop = 2
--             vim.opt_local.softtabstop = 2
--             vim.opt_local.shiftwidth = 2
--         else
--             vim.opt_local.softtabstop = -1
--         end
--     end,
-- })

-- Indentation
vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("indentation", { clear = true }),
    pattern = {
        "asm",
        -- "c",
        "git",
        "gitattributes",
        "gitcommit",
        "gitconfig",
        "gitignore",
        "gitrebase",
        "go",
        "godoc",
        "gomod",
        "gosum",
        "gowork",
        "gpg",
        "lua",
        "make",
        "sh",
        "sshconfig",
        "sshdconfig",
    },
    callback = function()
        vim.opt_local.expandtab = false
    end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd("textyankpost", {
    group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank({
            higroup = "Visual",
            timeout = 50,
        })
    end,
})

-- Go to last location when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
    group = vim.api.nvim_create_augroup("last_loc", { clear = true }),
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

-- Resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
    group = vim.api.nvim_create_augroup("resize_splits", { clear = true }),
    callback = function()
        local current_tab = vim.fn.tabpagenr()
        vim.cmd("tabdo wincmd =")
        vim.cmd("tabnext " .. current_tab)
    end,
})

-- Wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("wrap_spell", { clear = true }),
    pattern = { "gitcommit", "markdown", "asciidoc", "asciidoctor" },
    callback = function()
        -- vim.opt_local.spell = true
        vim.opt_local.textwidth = 0
        vim.opt_local.wrap = true
        vim.opt_local.linebreak = true
        vim.opt_local.fixendofline = true
        -- vim.opt_local.tabstop = 2
        vim.opt_local.softtabstop = 2
        vim.opt_local.shiftwidth = 2
        vim.opt_local.expandtab = true

        vim.keymap.set({ "n", "v" }, "j", "gj", { noremap = true, buffer = true })
        vim.keymap.set({ "n", "v" }, "k", "gk", { noremap = true, buffer = true })
        vim.keymap.set({ "n", "v" }, "0", "g0", { noremap = true, buffer = true })
        vim.keymap.set({ "n", "v" }, "$", "g$", { noremap = true, buffer = true })
    end,
})

-- Interact with secret files without backing up etc.
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    group = vim.api.nvim_create_augroup("edit_secure_file", { clear = true }),
    pattern = {
        "/dev/shm/pass.?*/?*.txt",
        "/private/var/?*/pass.?*/?*.txt",
        "/tmp/pass.?*/?*.txt",
        vim.fn.expand("$TMPDIR") .. "/pass.?*/?*.txt",

        "/dev/shm/gopass**",
        "/private/**/gopass**",
        "/tmp/gopass**",
        vim.fn.expand("$TMPDIR") .. "/gopass**",

        "/dev/shm/passage**",
        "/private/**/passage**",
        "/tmp/passage**",
        vim.fn.expand("$TMPDIR") .. "/passage**",
    },
    callback = function()
        vim.opt_local.backup = false
        vim.opt_local.writebackup = false
        vim.opt_local.swapfile = false
        vim.opt_local.undofile = false
        vim.opt_local.shada = ""

        vim.cmd("redraw")
        vim.cmd("echomsg 'Editing password file'")
    end,
})

-- Minimize risk of unintentional modifications of fragile files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    group = vim.api.nvim_create_augroup("edit_fragile_file", { clear = true }),
    pattern = { "*.gpg", "*.age", "*.tar.gz", "*.tar.bz2", "*.zip" },
    callback = function()
        vim.opt_local.binary = true
        vim.opt_local.bomb = true
        vim.opt_local.bufhidden = "wipe"
        vim.opt_local.swapfile = false
        vim.opt_local.backup = false
        vim.opt_local.writebackup = false
        vim.opt_local.undofile = false
        vim.opt_local.autoindent = false
        vim.opt_local.smartindent = false
        vim.opt_local.cindent = false
        vim.opt_local.shada = ""
    end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    group = vim.api.nvim_create_augroup("auto_create_dir", { clear = true }),
    callback = function(event)
        if event.match:match("^%w%w+://") then
            return
        end
        local file = vim.uv.fs_realpath(event.match) or event.match
        vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
    end,
})

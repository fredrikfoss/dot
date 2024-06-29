local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        lazyrepo,
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local lazy = require("lazy")
lazy.setup({
    spec = {
        { import = "plugins" },
    },
    install = {
        missing = false,
    },
    checker = {
        enabled = false,
        notify = false,
    },
    change_detection = {
        enabled = false,
        notify = false,
    },
    ui = {
        border = "single",
        backdrop = 100,
    },
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip",
                "matchit",
                "matchparen",
                "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})

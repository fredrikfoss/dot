return {
    "echasnovski/mini.hues",
    lazy = false,
    priority = 1000,
    config = function()
        local hues = require("mini.hues")
        hues.setup({
            -- background = "#000000",
            -- background = "#222222",
            -- background = "#1a1a1a",
            background = "#101416",
            foreground = "#cccccc",
            accent = "fg",
            -- background = "#e3e1e8",
            -- foreground = "#555555",
        })

        vim.api.nvim_set_hl(0, "ModeMsg", { fg = "fg", bold = true })
        vim.api.nvim_set_hl(0, "StatusLine", { fg = "fg", bg = "#2D2D2D" })
        vim.api.nvim_set_hl(0, "StatusLineNC", { fg = "fg", bg = "#2D2D2D" })
    end,
}

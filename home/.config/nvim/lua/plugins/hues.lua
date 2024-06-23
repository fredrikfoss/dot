return {
    "echasnovski/mini.hues",
    lazy = false,
    priority = 1000,
    config = function()
        require("mini.hues").setup({
            -- background = "#000000",
            -- background = "#222222",
            -- background = "#1a1a1a",
            background = "#101416",
            foreground = "#cccccc",
            accent = "fg",
            -- background = "#e3e1e8",
            -- foreground = "#555555",

            -- plugins = { default = false },
        })

        vim.api.nvim_set_hl(0, "ModeMsg", { fg = "fg", bold = true })
        vim.api.nvim_set_hl(0, "StatusLine", { fg = "fg", bg = "#2D2D2D" })
        vim.api.nvim_set_hl(0, "StatusLineNC", { fg = "fg", bg = "#2D2D2D" })
    end,
}

-- return {
--     "rose-pine/neovim",
--     name = "rose-pine",
--     lazy = false,
--     priority = 1000,
--     config = function()
--         local rose_pine = require("rose-pine")
--         rose_pine.setup({
--             variant = "moon",
--             dark_variant = "moon",
--             dim_inactive_windows = false,
--             extend_background_behind_borders = false,
--
--             enable = {
--                 terminal = false,
--                 legacy_highlights = false,
--                 migrations = false,
--             },
--
--             styles = {
--                 bold = true,
--                 italic = false,
--                 transparency = true,
--             },
--
--             -- groups = {
--             --     h1 = "love",
--             --     h2 = "gold",
--             --     h3 = "gold",
--             --     h4 = "gold",
--             --     h5 = "gold",
--             --     h6 = "gold",
--             -- },
--
--             highlight_groups = {
--                 StatusLine = { fg = "subtle", bg = "overlay" },
--                 StatusLineNC = { fg = "muted", bg = "overlay", blend = 60 },
--                 TelescopeSelection = { bg = "overlay" },
--                 TelescopeSelectionCaret = { bg = "overlay" },
--                 -- CmpPmenu = { fg = "subtle", bg = "#161315" },
--                 -- CmpDoc = { fg = "muted", bg = "overlay", blend = 60 },
--                 -- PmenuSel = { fg = "subtle", bg = "#161315" },
--                 Pmenu = { bg = "#2A272F" },
--                 CmpMenu = { bg = "#2A272F" },
--                 CmpDoc = { bg = "#2A272F" },
--                 DiagnosticVirtualTextError = { bg = "love", blend = 5 },
--                 DiagnosticVirtualTextHint = { bg = "iris", blend = 5 },
--                 DiagnosticVirtualTextInfo = { bg = "foam", blend = 5 },
--                 DiagnosticVirtualTextWarn = { bg = "gold", blend = 5 },
--                 NvimTreeFolderName = { bold = true },
--             },
--
--             before_highlight = function(group, highlight, palette)
--                 if highlight.undercurl then
--                     highlight.undercurl = false
--                     highlight.underline = true
--                 end
--                 if highlight.fg == palette.pine then
--                     -- highlight.fg = "#537F77"
--                     highlight.fg = "#536F67"
--                 end
--                 if highlight.fg == palette.gold then
--                     -- highlight.fg = "#FFAF87"
--                     highlight.fg = "#EF9F77"
--                 end
--                 if highlight.fg == palette.rose then
--                     highlight.fg = "#D78787"
--                 end
--                 if highlight.fg == palette.foam then
--                     -- highlight.fg = "#9AC3B3"
--                     -- highlight.fg = "#8AB0A0"
--                     highlight.fg = "#8CA2A2"
--                 end
--                 if highlight.fg == palette.iris then
--                     highlight.fg = "#D7AFD7"
--                 end
--                 if highlight.fg == palette.love then
--                     -- highlight.fg = "#FF5F87"
--                     highlight.fg = "#CF5A67"
--                 end
--                 if highlight.fg == palette.subtle then
--                     highlight.fg = "#9797AF"
--                 end
--                 if highlight.fg == palette.muted then
--                     highlight.fg = "#4F4F67"
--                 end
--                 if highlight.fg == palette.overlay then
--                     highlight.fg = "#444444"
--                 end
--                 if highlight.fg == palette.text then
--                     -- highlight.fg = "#D7D7FF"
--                     highlight.fg = "#C9C9F9"
--                 end
--             end,
--         })
--
--         vim.cmd.colorscheme("rose-pine")
--         -- vim.api.nvim_set_hl(0, "DiagnosticVirtualTextOk", { link = "DiagnosticOk", blend = 10 })
--         -- vim.api.nvim_set_hl(0, "DiagnosticVirtualTextOk", { fg = "NvimLightGreen", bg = "NvimDarkGreen", blend = 70 })
--
--         -- markdown overrides
--         vim.api.nvim_set_hl(0, "@markup.raw.markdown_inline", { fg = "#8CA2A2" })
--         vim.api.nvim_set_hl(0, "@markup.link.label.markdown_inline", { fg = "#536F67" })
--         vim.api.nvim_set_hl(0, "@markup.list.markdown", { fg = "#9797AF" })
--
--         vim.api.nvim_set_hl(0, "@markup.italic.markdown_inline", { fg = "#FF5F87" })
--         vim.api.nvim_set_hl(0, "@markup.strong.markdown_inline", { fg = "#FF5F87" })
--
--         vim.api.nvim_set_hl(0, "@markup.heading.1.markdown", { fg = "#EF9F77" })
--         vim.api.nvim_set_hl(0, "@markup.heading.2.markdown", { fg = "#EF9F77" })
--         vim.api.nvim_set_hl(0, "@markup.heading.3.markdown", { fg = "#EF9F77" })
--         vim.api.nvim_set_hl(0, "@markup.heading.4.markdown", { fg = "#EF9F77" })
--         vim.api.nvim_set_hl(0, "@markup.heading.5.markdown", { fg = "#EF9F77" })
--         vim.api.nvim_set_hl(0, "@markup.heading.6.markdown", { fg = "#EF9F77" })
--     end,
-- }

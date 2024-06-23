-- TODO: See https://github.com/edr3x/.dotfiles/blob/master/nvim/.config/nvim/lua/r3x/plugins/cmp.lua
return {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer", -- source for text in buffer
        "hrsh7th/cmp-path", -- source for file system paths
        "hrsh7th/cmp-cmdline", -- source for vim's cmdline
        -- "hrsh7th/cmp-nvim-lsp-signature-help", -- signature help
        {
            "L3MON4D3/LuaSnip",
            build = "make install_jsregexp",
        },
        "saadparwaiz1/cmp_luasnip",
        -- "rafamadriz/friendly-snippets",
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local luasnip_loaders_from_vscode = require("luasnip/loaders/from_vscode")

        luasnip_loaders_from_vscode.lazy_load()

        cmp.setup({
            -- configure how nvim-cmp interacts with snippet engine
            snippet = {
                expand = function(args)
                    -- luasnip.lsp_expand(args.body)
                    vim.snippet.expand(args.body)
                end,
            },
            -- sources for autocompletion
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
                -- { name = "nvim_lsp_signature_help" },
                { name = "path" },
            }, {
                { name = "buffer" },
            }),
            duplicates = {
                nvim_lsp = 1,
                luasnip = 1,
                buffer = 1,
                path = 1,
                nvim_lua = 1,
                -- nvim_lsp_signature_help = 1,
            },
            formatting = {
                fields = { "abbr", "kind", "menu" },
                format = function(entry, vim_item)
                    vim_item.menu = ({
                        nvim_lsp = "[ls]",
                        luasnip = "[sn]",
                        buffer = "[bu]",
                        path = "[pa]",
                        -- nvim_lsp_signature_help = "[si]",
                    })[entry.source.name]

                    -- for tailwind colors
                    return vim_item
                end,
            },
            completion = {
                -- completeopt = "menu,menuone,preview,select",
                -- completeopt = "menu,menuone,preview,noselect",
                completeopt = "menu,menuone,noselect,noinsert",
            },
            preselect = cmp.PreselectMode.None, -- disable preselect for irrespective servers
            mapping = cmp.mapping.preset.insert({
                ["<C-n>"] = cmp.mapping.select_next_item(), -- next suggestion
                ["<C-p>"] = cmp.mapping.select_prev_item(), -- previous suggestion
                ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                ["<C-leader>"] = cmp.mapping.complete(), -- show completion suggestions
                -- ["<C-d>"] = cmp.mapping.scroll_docs(4),
                -- ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                ["<C-l>"] = cmp.mapping(function()
                    if luasnip.expand_or_locally_jumpable() then
                        luasnip.expand_or_jump()
                    end
                end, { "i", "s" }),
                ["<C-h>"] = cmp.mapping(function()
                    if luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    end
                end, { "i", "s" }),
            }),
            -- window = {
            --     completion = {
            --         winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
            --         -- winhighlight = "Normal:CmpPmenu,Search:PmenuSel",
            --         autocomplete = false,
            --         scrollbar = false,
            --         border = "single",
            --         -- border = "none",
            --     },
            --     documentation = {
            --         winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
            --         -- winhighlight = "Normal:CmpDoc",
            --         border = "single",
            --         -- border = "none",
            --     },
            -- },
            window = {
                completion = {
                    -- winhighlight = "Normal:CmpMenu,Search:None",
                    scrollbar = false,
                    -- border = "none",
                    -- border = "single",
                    -- winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
                    -- winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,Search:None",
                    -- winhighlight = "Normal:CmpPmenu,Search:PmenuSel",
                    -- winhighlight = "Normal:CmpPmenu",
                },
                documentation = {
                    -- winhighlight = "Normal:CmpDoc,Search:None",
                    scrollbar = false,
                    -- border = "none",
                    -- border = "single",
                    -- winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
                    -- winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,Search:None",
                    -- winhighlight = "Normal:CmpDoc",
                },
            },
            view = {
                entries = "custom",
            },
            -- experimental = {
            --     ghost_text = true,
            -- },
        })
    end,
}

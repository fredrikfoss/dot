return {
    "neovim/nvim-lspconfig",
    event = { "BufRead", "BufNewFile" },
    dependencies = "hrsh7th/cmp-nvim-lsp",
    config = function()
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local lspconfig_ui_windows = require("lspconfig.ui.windows")
        local capabilities = cmp_nvim_lsp.default_capabilities()

        lspconfig_ui_windows.default_options.border = "single"

        vim.api.nvim_create_autocmd("LspAttach", {
            -- group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                local opts = { buffer = ev.buf }
                -- vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
                vim.keymap.set("n", "grr", vim.lsp.buf.references, opts)
                vim.keymap.set("n", "grn", vim.lsp.buf.rename, opts)
                vim.keymap.set("n", "gra", vim.lsp.buf.code_action, opts)
                vim.keymap.set("v", "<C-r>r", vim.lsp.buf.code_action, opts)
                vim.keymap.set("v", "<C-r><C-r>", vim.lsp.buf.code_action, opts)
                vim.keymap.set({ "n", "i" }, "<C-s>", vim.lsp.buf.signature_help, opts)
                -- vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
                -- vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
                -- vim.keymap.set("n", "<space>wl", function()
                --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                -- end, opts)
            end,
        })

        -- Lua Language Server (Lua)
        lspconfig.lua_ls.setup({
            capabilities = capabilities,
            settings = {
                Lua = {
                    format = { enable = false },
                    hint = { enable = true },
                    telemetry = { enable = false },
                    diagnostics = { globals = { "vim" } },
                    workspace = { checkThirdParty = false },
                },
            },
        })

        -- lspconfig.harper_ls.setup({ capabilities = capabilities })
        -- lspconfig.vale_ls.setup({ capabilities = capabilities })
        -- lspconfig.typos_lsp.setup({ capabilities = capabilities })
        lspconfig.jsonls.setup({ capabilities = capabilities })
        lspconfig.verible.setup({ capabilities = capabilities })
        -- lspconfig.zls.setup({ capabilities = capabilities })
        lspconfig.clangd.setup({ capabilities = capabilities })
        lspconfig.jdtls.setup({ capabilities = capabilities })
        lspconfig.bashls.setup({ capabilities = capabilities })
        -- lspconfig.vhdl_ls.setup({ capabilities = capabilities })
        lspconfig.taplo.setup({ capabilities = capabilities })
        lspconfig.yamlls.setup({ capabilities = capabilities })
        lspconfig.perlnavigator.setup({ capabilities = capabilities })
        -- lspconfig.basedpyright.setup({ capabilities = capabilities })
        -- lspconfig.arduino_language_server.setup({ capabilities = capabilities })

        lspconfig.jedi_language_server.setup({
            capabilities = capabilities,
            init_options = {
                diagnostics = {
                    enable = false,
                },
            },
        })

        lspconfig.ruff.setup({
            capabilities = capabilities,
            on_attach = function(client, _)
                client.server_capabilities.hoverProvider = false
            end,
        })

        -- lspconfig.ruff_lsp.setup({
        --     capabilities = capabilities,
        --     on_attach = function(client, _)
        --         -- Disable hover in favour of another LSP
        --         client.server_capabilities.hoverProvider = false
        --     end,
        --     init_options = {
        --         settings = {
        --             args = {
        --                 "--extend-select=W,COM,ICN",
        --                 "--ignore=E501,E722,COM812",
        --             },
        --         },
        --     },
        -- })

        lspconfig.gopls.setup({
            capabilities = capabilities,
            -- workaround for gopls not supporting semanticTokensProvider
            -- https://github.com/golang/go/issues/54531#issuecomment-1464982242
            -- (not sure if still needed)
            on_attach = function(client, _)
                if client.name == "gopls" and not client.server_capabilities.semanticTokensProvider then
                    local semantic = client.config.capabilities.textDocument.semanticTokens
                    client.server_capabilities.semanticTokensProvider = {
                        full = true,
                        legend = {
                            tokenModifiers = semantic.tokenModifiers,
                            tokenTypes = semantic.tokenTypes,
                        },
                        range = true,
                    }
                end
            end,
            -- most from https://www.lazyvim.org/extras/lang/go#nvim-lspconfig
            -- and https://github.com/golang/tools/blob/master/gopls/doc/settings.md
            settings = {
                gopls = {
                    gofumpt = true,
                    staticcheck = true,
                    usePlaceholders = true,
                    semanticTokens = true,
                    vulncheck = "Imports",
                    codelenses = {
                        gc_details = false,
                        generate = true,
                        regenerate_cgo = true,
                        run_govulncheck = true,
                        test = true,
                        tidy = true,
                        upgrade_dependency = true,
                        vendor = true,
                    },
                    analyses = {
                        fieldalignment = true,
                        shadow = true,
                        unusedvariable = true,
                        unusedwrite = true,
                        useany = true,
                    },
                    hints = {
                        assignVariableTypes = true,
                        compositeLiteralFields = true,
                        compositeLiteralTypes = true,
                        constantValues = true,
                        functionTypeParameters = true,
                        parameterNames = true,
                        rangeVariableTypes = true,
                    },
                    directoryFilters = {
                        "-.git",
                        "-.vscode",
                        "-.idea",
                        "-.vscode-test",
                        "-node_modules",
                    },
                },
            },
        })
    end,
}

return {
    "williamboman/mason.nvim",
    event = { "BufRead", "BufNewFile" },
    build = { ":MasonToolsUpdate", ":MasonToolsClean" },
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local mason_tool_installer = require("mason-tool-installer")

        mason.setup({
            pip = { upgrade_pip = true },
            ui = { border = "single" },
        })
        mason_lspconfig.setup()
        mason_tool_installer.setup({
            auto_update = false,
            run_on_start = false,
            ensure_installed = {
                -- Bash/sh
                "bashls",
                "shellcheck",
                "shfmt",

                "ruff",
                "jedi_language_server",

                "jdtls",
                -- "google-java-format",

                "lua_ls",
                "stylua",

                "gopls",
                "golangci-lint",
                "gofumpt",
                "goimports",
                "gomodifytags",
                "golines",
                "delve",

                -- "clangd", -- not working
                "clang-format",

                "verible",

                "asmfmt",
                "jsonls",
                "jq",
                "yq",
                "perlnavigator",
                "taplo",
                -- "yamlfmt",
                "yamlls",
                "typos_lsp",
                -- "typos" -- not working
                -- "asm_lsp", -- not working
                -- "rust_hdl",
                -- "arduino_language_server",
                -- "zls",
            },
        })
    end,
}

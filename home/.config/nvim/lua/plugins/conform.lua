return {
    "stevearc/conform.nvim",
    event = { "BufRead", "BufNewFile" },
    cmd = { "ConformInfo" },
    config = function()
        local conform = require("conform")
        conform.setup({
            notify_on_error = false,
            notify_no_formatters = false,
            formatters_by_ft = {
                arduino = { "clang-format" },
                asm = { "asmfmt" },
                -- c = { "clang-format" },
                -- go = { "goimports", "gofmt" }
                -- go = { "goimports", "golines", "gofumpt" },
                -- java = { "google-java-format" },
                java = { "clang-format" },
                -- json = { "prettier" },
                json = { "jq" },
                jsonc = { "jq" },
                lua = { "stylua" },
                python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
                sh = { "shfmt" },
                toml = { "taplo" },
                -- yaml = { "yamlfmt" },
                yaml = { "yq" },
                zig = { "zigfmt" },
                systemverilog = { "verible" },
                perl = { "perltidy" },
                vhdl = { "vsg" },
                d2 = { "d2" },
                markdown = { "markdownfmt" },
                typst = { "typstyle", "trim_newlines" },
                ["*"] = { "injected" },
                ["_"] = { "trim_whitespace", "trim_newlines" },
            },
            formatters = {
                yamlfmt = {
                    prepend_args = {
                        "-formatter",
                        "line_ending=lf,retain_line_breaks_single=true",
                    },
                },
                shfmt = {
                    prepend_args = { "-ci" },
                },
            },
        })

        vim.keymap.set("n", "=", function()
            conform.format({ async = true, lsp_format = "fallback" })
        end)
    end,
}

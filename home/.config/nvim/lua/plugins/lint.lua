return {
    -- "mfussenegger/nvim-lint",
    dir = "~/repo/github.com/fredrikfoss/nvim-lint",
    event = { "BufRead", "BufNewFile" },
    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            go = { "golangcilint" },
            -- python = { "ruff" },
            -- yaml = { "yamllint" },
            -- python = { "ruff" },
            -- markdown = { "proselint" },
            -- markdown = { "vale" },
            -- vhdl = { "ghdl" },
            -- vhdl = { "ghdl", "vsg" },
            vhdl = { "vsg" },
            -- vhdl = { "ghdl" },
        }

        lint.linters.ghdl = {
            cmd = "ghdl",
            args = { "-s", "--std=08" },
            stdin = false,
            stream = "stderr",
            ignore_exitcode = true,
            parser = require("lint.parser").from_pattern(
                "([^:]+):(%d+):(%d+): (.+)",
                { "file", "lnum", "col", "message" },
                { ["error"] = vim.diagnostic.severity.ERROR },
                { source = "ghdl" }
            ),
        }

        -- lint.linters.vsg = {
        --     cmd = "vsg",
        --     stdin = true,
        --     args = { "-of", "syntastic", "-c", "~/.config/vsg/config.yaml", "--stdin" },
        --     stream = "stdout",
        --     ignore_exitcode = true,
        --     parser = require("lint.parser").from_pattern(
        --         "(%w+).*%((%d+)%)(.*)%s+%-%-%s+(.+)",
        --         { "severity", "lnum", "code", "message" },
        --         {
        --             ["ERROR"] = vim.diagnostic.severity.ERROR,
        --             ["WARNING"] = vim.diagnostic.severity.WARN,
        --             ["INFORMATION"] = vim.diagnostic.severity.INFO,
        --             ["HINT"] = vim.diagnostic.severity.HINT,
        --         },
        --         { source = "vsg" }
        --     ),
        -- }

        -- vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
        vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "TextChanged", "InsertLeave" }, {
            group = vim.api.nvim_create_augroup("lint", { clear = true }),
            callback = function()
                lint.try_lint(nil, { ignore_errors = true })
            end,
        })
    end,
}

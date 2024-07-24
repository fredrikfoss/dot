return {
    "mfussenegger/nvim-lint",
    event = { "BufRead", "BufNewFile" },
    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            go = { "golangcilint" },
            vhdl = { "ghdl", "vsg" },
            -- c = { "clang-tidy" },
            -- python = { "ruff" },
            -- yaml = { "yamllint" },
        }

        vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "TextChanged", "InsertLeave" }, {
            group = vim.api.nvim_create_augroup("lint", { clear = true }),
            callback = function()
                lint.try_lint(nil, { ignore_errors = true })
            end,
        })
    end,
}

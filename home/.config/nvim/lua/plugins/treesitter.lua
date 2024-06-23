return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufRead", "BufNewFile" },
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
        local treesitter = require("nvim-treesitter.configs")
        treesitter.setup({
            -- auto_install = true,
            sync_install = false,
            highlight = { enable = true, additional_vim_regex_highlighting = false },
            indent = { enable = true },
            ensure_installed = {
                "jq",
                "arduino",
                "asm",
                "bash",
                "c",
                "comment",
                "csv",
                "diff",
                "dockerfile",
                "git_config",
                "git_rebase",
                "gitattributes",
                "gitcommit",
                "gitignore",
                "go",
                "gomod",
                "gosum",
                "gowork",
                "gpg",
                "html",
                "ini",
                "java",
                "json",
                "jsonc",
                "latex",
                "llvm",
                "lua",
                "luadoc",
                "luap",
                "m68k",
                "make",
                "markdown",
                "markdown_inline",
                "nasm",
                "passwd",
                "perl",
                "pioasm",
                "pod",
                "printf",
                "psv",
                "python",
                "query",
                "readline",
                "regex",
                "rst",
                "rust",
                "ssh_config",
                "tmux",
                "todotxt",
                "toml",
                "tsv",
                "verilog",
                "vim",
                "vimdoc",
                "yaml",
                -- "zig",
                -- "d2",
                -- "asciidoc",
            },

            -- nvim-treesitter-textobjects
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ["a="] = "@assignment.outer",
                        ["i="] = "@assignment.inner",
                        ["l="] = "@assignment.lhs",
                        ["r="] = "@assignment.rhs",

                        ["aa"] = "@parameter.outer",
                        ["ia"] = "@parameter.inner",

                        ["ai"] = "@conditional.outer",
                        ["ii"] = "@conditional.inner",

                        ["al"] = "@loop.outer",
                        ["il"] = "@loop.inner",

                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",

                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",

                        ["ab"] = "@block.outer",
                        ["ib"] = "@block.inner",
                    },
                },
            },

            -- required by vim-matchup
            matchup = {
                enable = true,
            },
        })

        -- speed up nvim-ts-context-commentstring
        vim.g.skip_ts_context_commentstring_module = true
    end,
}

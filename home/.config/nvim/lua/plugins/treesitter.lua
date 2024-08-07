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
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = {
                enable = true,
            },
            ensure_installed = {
                "arduino",
                "asm",
                "awk",
                "bash",
                "c",
                "comment",
                "csv",
                "diff",
                "dockerfile",
                "editorconfig",
                "git_config",
                "git_rebase",
                "gitattributes",
                "gitcommit",
                "gitignore",
                "go",
                "goctl",
                "gomod",
                "gosum",
                "gotmpl",
                "gowork",
                "gpg",
                "html",
                "http",
                "ini",
                "java",
                "jq",
                "json",
                "json5",
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
                "nginx",
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
                "typst",
                "verilog",
                "vhdl",
                "vim",
                "vimdoc",
                "yaml",
                -- "asciidoc",
                -- "d2",
                -- "zig",
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

return {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "CFLAGS='-march=native -O3 -flto -fomit-frame-pointer -pipe' make",
        },
    },
    keys = {
        "<leader>e",
        "<leader>/",
        "<leader>g",
        "<leader>d",
        "<leader>s",
    },
    config = function()
        local telescope = require("telescope")
        local telescope_builtin = require("telescope.builtin")

        telescope.setup({
            defaults = {
                previewer = false,
                hidden = true,
                follow = true,
                file_ignore_patterns = {},
                initial_mode = "insert",
                select_strategy = "reset",
                sorting_strategy = "ascending",
                layout_strategy = "horizontal",
                prompt_prefix = ">>> ",
                dynamic_preview_title = false,
                results_title = false,
                prompt_title = false,
                borderchars = {
                    prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
                    results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
                    preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
                },
                layout_config = {
                    prompt_position = "top",
                },
                mappings = {
                    i = {
                        ["<C-n>"] = "move_selection_next",
                        ["<C-p>"] = "move_selection_previous",
                        ["<Esc>"] = "close",
                    },
                },
            },

            pickers = {
                find_files = {
                    find_command = { "fd", "--type", "f" },
                    follow = true,
                    hidden = true,
                    dynamic_preview_title = false,
                    results_title = false,
                    prompt_title = false,
                    previewer = false,
                    layout_config = {
                        width = 0.5,
                        height = 0.7,
                        prompt_position = "top",
                        preview_cutoff = 120,
                    },
                },
                live_grep = {
                    only_sort_text = true,
                    previewer = true,
                    hidden = true,
                    follow = true,
                    dynamic_preview_title = false,
                    results_title = false,
                    prompt_title = false,
                    preview_title = false,
                    additional_args = { "--hidden", "--follow" },
                    glob_pattern = { "!**/.git/*" },
                    layout_config = {
                        horizontal = {
                            width = 0.7,
                            height = 0.7,
                            preview_width = 0.5,
                        },
                    },
                },
                git_files = {
                    previewer = false,
                    hidden = true,
                    follow = true,
                    dynamic_preview_title = false,
                    results_title = false,
                    prompt_title = false,
                    layout_config = {
                        width = 0.5,
                        height = 0.7,
                        prompt_position = "top",
                        preview_cutoff = 120,
                    },
                },
                treesitter = {
                    previewer = true,
                    dynamic_preview_title = false,
                    results_title = false,
                    prompt_title = false,
                    preview_title = false,
                    layout_config = {
                        horizontal = {
                            width = 0.7,
                            height = 0.7,
                            preview_width = 0.5,
                        },
                    },
                },
            },
        })
        telescope.load_extension("fzf")

        vim.keymap.set("n", "<leader>e", telescope_builtin.find_files)
        vim.keymap.set("n", "<leader>/", telescope_builtin.live_grep)
        vim.keymap.set("n", "<leader>g", telescope_builtin.git_files)
        vim.keymap.set("n", "<leader>d", telescope_builtin.diagnostics)
        vim.keymap.set("n", "<leader>s", telescope_builtin.treesitter)
    end,
}

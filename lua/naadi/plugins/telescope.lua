return {
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local builtin = require("telescope.builtin")
        require('telescope').setup {
            defaults = {
                layout_config = {
                    vertical = {
                        width = 0.95
                    },
                    horizontal = {
                        width = 0.95
                    },
                },
                path_display = {
                    -- "tail"
                    -- "absolute"
                    -- "shorten"
                    -- "smart"
                    "truncate"
                },
            }
        }
        local keymap = vim.keymap.set
        keymap("n", "<leader>sf", builtin.find_files, { desc = "Search filse"})
        keymap("n", "<leader>sg", builtin.git_files, { desc = "Search git files"})
        keymap("n", "<leader>sl", builtin.live_grep, { desc = "Search by grep"})
        keymap('n', '<leader>sw', function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end)
        keymap('n', '<leader>ss', function()
            builtin.live_grep {
                grep_open_files = true,
                prompt_title = 'Live Grep in Open Files',
            }
        end, { desc = 'Search in open files' })
        vim.keymap.set('n', '<leader>st', builtin.help_tags, { desc= "Search help files"})
    end,
}

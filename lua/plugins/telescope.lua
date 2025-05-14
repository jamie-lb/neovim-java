return {
    {
        'nvim-telescope/telescope.nvim',
        name = "telescope",
        tag = '0.1.8',
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
        config = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = "[F]ind [F]iles"})
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {desc = "[F]ind by [G]rep"})
            vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })
            vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = '[F]inder [R]esume' })
            vim.keymap.set('n', '<leader>f.', builtin.oldfiles, { desc = '[F]ind Recent Files ("." for repeat)' })
            vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[F]ind Existing [B]uffers' })
        end
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        config = function()
            local actions = require("telescope.actions")
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {}
                    }
                },
                mappings = {
                    i = {
                        ["<C-n>"] = actions.cycle_history_next,
                        ["<C-p>"] = actions.cycle_history_prev,
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                    }
                },
                require("telescope").load_extension("ui-select")
            })
        end
    }
}

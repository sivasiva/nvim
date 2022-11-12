local telescope = require('telescope').setup {
    defaults = {
        theme = 'ivy',
        layout_config = {
            height = 0.95
        },
        vimgrep_arguments = {"rg", "--color=never", "--no-heading", "--with-filename", "--line-number", "--column",
                             "--smart-case", "--trim"}
    },
    pickers = {
        find_files = {
            find_command = {"fd", "--type", "f", "--strip-cwd-prefix"}
        }
    }
}

require('telescope').load_extension('fzy_native')

-- FZF Mappings
vim.api.nvim_set_keymap('n', '<leader>f',
    ':lua require"telescope.builtin".find_files(require("telescope.themes").get_ivy({}))<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>g',
    ':lua require"telescope.builtin".live_grep(require("telescope.themes").get_ivy({}))<CR>', {})
vim.api.nvim_set_keymap('n', 'gs',
    ':lua require"telescope.builtin".grep_string(require("telescope.themes").get_ivy({}))<CR>', {})
vim.api.nvim_set_keymap('n', 'gr',
    ':lua require"telescope.builtin".lsp_references(require("telescope.themes").get_ivy({}))<CR>', {})
vim.api.nvim_set_keymap('n', 'gd',
    ':lua require"telescope.builtin".lsp_definitions(require("telescope.themes").get_ivy({}))<CR>', {})


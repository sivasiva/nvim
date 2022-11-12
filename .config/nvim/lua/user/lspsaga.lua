local keymap = vim.keymap.set
local saga = require('lspsaga')

saga.init_lsp_saga()

-- Saga Mappings
vim.api.nvim_set_keymap('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>', {})
vim.api.nvim_set_keymap('n', 'K', '<cmd>Lspsaga require("lspsaga.hover").render_hover_doc()<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>rn', '<cmd>Lspsaga rename<CR>', {})

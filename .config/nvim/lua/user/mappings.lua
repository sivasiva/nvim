-- [[ keys.lua ]]
--
local keymap = vim.api.nvim_set_keymap
local default_opts = {
    noremap = true,
    silent = true
}
local expr_opts = {
    noremap = true,
    expr = true,
    silent = true
}

-- Better indent
keymap("v", "<", "<gv", default_opts)
keymap("v", ">", ">gv", default_opts)

-- Visual line wraps
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", expr_opts)
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", expr_opts)

-- Mappings
keymap('n', '<leader>w', ':w<CR>', default_opts)
keymap('n', '<leader>r', ':source ~/.config/nvim/init.lua<CR>', default_opts)
keymap('n', '<leader>ev', ':Startify<CR>', default_opts)
keymap('n', '<leader>es', ':e ~/.config/nvim/lua/user/snippets.lua<CR>', default_opts)
keymap('n', '<leader>q', ':wq<CR>', default_opts)
keymap('n', '<leader>qq', ':qall!<CR>', default_opts)
keymap('n', '<leader>vs', ':vs<CR>', default_opts)
keymap('n', '<leader>ss', ':split<CR>', default_opts)
keymap('n', '<leader>pu', ':PackerSync<CR>', default_opts)
keymap('n', '<leader>pc', ':PackerClean<CR>', default_opts)
keymap('n', '<leader><leader>', ':e!<CR>', default_opts)

-- Remove search highlights
keymap('n', '<space>', ':nohl<Bar>:echo<cr>', default_opts)
-- keymap("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", default_opts)

-- Move selected line / block of text in visual mode
keymap("x", "K", ":move '<-2<CR>gv-gv", default_opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", default_opts)

-- Switch buffer
keymap("n", "<S-h>", ":bprevious<CR>", default_opts)
keymap("n", "<S-l>", ":bnext<CR>", default_opts)

-- NERDTree Configuration
keymap('n', '<leader>n', ':NERDTreeToggle<CR>', default_opts)

-- Easy Align Configuration
keymap('n', 'ga', ':EasyAlign<CR>', default_opts)
keymap('x', 'ga', ':EasyAlign<CR>', default_opts)

-- Startify
keymap('n', '<leader>st', ':Startify<CR>', default_opts)

-- Commentary
keymap('n', '<leader>c', ':Commentary<CR>', default_opts)
keymap('v', '<leader>c', ':Commentary<CR>', default_opts)
keymap('n', '//', ':Commentary<CR>', default_opts)
keymap('v', '//', ':Commentary<CR>', default_opts)

-- Window Management
keymap('n', '<C-J>', '<C-W><C-J>', {
    noremap = true
})
keymap('n', '<C-K>', '<C-W><C-K>', {
    noremap = true
})
keymap('n', '<C-L>', '<C-W><C-L>', {
    noremap = true
})
keymap('n', '<C-H>', '<C-W><C-H>', {
    noremap = true
})

-- Utils
keymap('n', 'so', ':luafile %<CR>', default_opts)

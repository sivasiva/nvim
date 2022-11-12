vim.opt.termguicolors = true
-- vim.cmd('let ayucolor="mirage"')

vim.opt.background = 'dark'
require('ayu').setup({
    mirage = true, -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
    overrides = {} -- A dictionary of group names, each associated with a dictionary of parameters (`bg`, `fg`, `sp` and `style`) and colors in hex.
})

require('ayu').colorscheme()

require('lualine').setup {
    options = {
        theme = 'papercolor_light'
    }
    -- options = { theme  = 'OceanicNext' },
    -- options = { theme  = 'nord' },
}

local g = vim.g

g.NERDTreeChDirMode = 2
g.NERDTreeDirArrows = 1
g.NERDTreeHighlightCursorline = 0
g.NERDTreeIgnore = {'^node_modules$', '^build$', '^tmp$', '^.git$', '^.idea$', '^.svelte-kit$',
                    '^.vercel_build_output$', '^.DS_Store$'}
g.NERDTreeMinimalUI = 1
g.NERDTreeRespectWildIgnore = 1
g.NERDTreeShowHidden = 1

g.startify_change_to_dir = 1
g.startify_change_to_vcs_root = 1
g.startify_enable_special = 0
g.startify_files_number = 5
g.startify_fortune_use_unicode = 1
g.startify_session_autoload = 1
g.startify_session_before_save = true
g.startify_session_delete_buffers = 1
g.startify_session_persistence = 1
g.startify_session_persistence = 1
g.webdevicons_enable_startify = 1

g.startify_bookmarks = {{
    p = '~/.config/nvim/lua/user/plugins.lua'
}, {
    d = '~/.config/nvim/lua/user/defaults.lua'
}, {
    m = '~/.config/nvim/lua/user/mappings.lua'
}, {
    c = '~/.config/nvim/lua/user/completion.lua'
}, {
    u = '~/.config/nvim/lua/user/ux.lua'
}, {
    i = '~/.config/nvim/init.lua'
}, {
    z = '~/.zshrc'
} -- { m = '~/.config/nvim/lua/keys/plugins-mappings.lua'},
-- { b = '~/apps/vimwiki/cookbook/cookbook.md' },
}

vim.api.nvim_command([[
    autocmd VimEnter * if !argc() | Startify | NERDTree
]])


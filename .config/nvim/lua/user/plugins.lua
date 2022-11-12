vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim",
                                  install_path})
end
vim.api.nvim_command("packadd packer.nvim")

local use = require('packer').use

return require('packer').startup(function(use)
    -- Packer can manage itself
    use {'wbthomason/packer.nvim'}

    -- Visual Plugins
    use {'mhartington/oceanic-next'}
    use {'morhetz/gruvbox'}
    use {'mhinz/vim-startify'}
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = {
            'kyazdani42/nvim-web-devicons',
            opt = true
        }
        -- options = {
        --     theme = 'ayu_light',
        --     globalstatus = true
        -- }
    }

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = { -- LSP Support
        {'neovim/nvim-lspconfig'}, {'williamboman/mason.nvim'}, {'williamboman/mason-lspconfig.nvim'},
        {'glepnir/lspsaga.nvim'}, -- Autocompletion
        {'hrsh7th/nvim-cmp'}, {'hrsh7th/cmp-buffer'}, {'hrsh7th/cmp-path'}, {'saadparwaiz1/cmp_luasnip'},
        {'hrsh7th/cmp-nvim-lsp'}, {'hrsh7th/cmp-nvim-lua'}, -- Snippets
        {'L3MON4D3/LuaSnip'}, {'rafamadriz/friendly-snippets'}}
    }

    -- Completion Plugins
    -- use {'neovim/nvim-lspconfig'}
    -- use {'williamboman/nvim-lsp-installer', {
    --     "neovim/nvim-lspconfig",
    --     config = function()
    --         require("nvim-lsp-installer").setup {
    --             automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)

    --             -- Whether to automatically check for outdated servers when opening the UI window.
    --             check_outdated_servers_on_open = true,

    --             ui = {
    --                 icons = {
    --                     server_installed = "✓",
    --                     server_pending = "➜",
    --                     server_uninstalled = "✗"
    --                 }
    --             },
    --             keymaps = {
    --                 -- Keymap to expand a server in the UI
    --                 toggle_server_expand = "<CR>",
    --                 -- Keymap to install the server under the current cursor position
    --                 install_server = "i",
    --                 -- Keymap to reinstall/update the server under the current cursor position
    --                 update_server = "u",
    --                 -- Keymap to check for new version for the server under the current cursor position
    --                 check_server_version = "c",
    --                 -- Keymap to update all installed servers
    --                 update_all_servers = "U",
    --                 -- Keymap to check which installed servers are outdated
    --                 check_outdated_servers = "C",
    --                 -- Keymap to uninstall a server
    --                 uninstall_server = "X"
    --             },

    --             -- Limit for the maximum amount of servers to be installed at the same time. Once this limit is reached, any further
    --             -- servers that are requested to be installed will be put in a queue.
    --             max_concurrent_installers = 4

    --         }

    --         local lspconfig = require("lspconfig")
    --         local lspOptions = {
    --             on_attach = on_attach,
    --             flags = {
    --                 debounce_text_changes = 150
    --             }

    --         }

    --         lspconfig.sumneko_lua.setup {
    --             settings = {
    --                 Lua = {
    --                     diagnostics = {
    --                         -- Get the language server to recognize the `vim` global
    --                         globals = {'vim'}
    --                     }
    --                 }
    --             }
    --         }

    --         lspconfig.tsserver.setup(lspOptions)
    --         lspconfig.gopls.setup(lspOptions)
    --         lspconfig.rls.setup(lspOptions)
    --         lspconfig.graphql.setup(lspOptions)
    --         lspconfig.dockerls.setup(lspOptions)
    --         lspconfig.cssls.setup(lspOptions)
    --         lspconfig.tailwindcss.setup(lspOptions)
    --         lspconfig.bashls.setup(lspOptions)
    --         lspconfig.svelte.setup(lspOptions)
    --     end
    -- }}

    use {"jose-elias-alvarez/null-ls.nvim", {
        config = "require('user.null-ls')"
    }} -- for formatters and linters

    use {
        'SirVer/ultisnips',
        requires = {{
            'honza/vim-snippets',
            rtp = '.'
        }},
        config = function()
            vim.g.UltiSnipsExpandTrigger = '<Plug>(ultisnips_expand)'
            vim.g.UltiSnipsJumpForwardTrigger = '<Plug>(ultisnips_jump_forward)'
            vim.g.UltiSnipsJumpBackwardTrigger = '<Plug>(ultisnips_jump_backward)'
            vim.g.UltiSnipsListSnippets = '<c-x><c-s>'
            vim.g.UltiSnipsRemoveSelectModeMappings = 0
        end
    }
    use {'quangnguyen30192/cmp-nvim-ultisnips'}
    -- use {'L3MON4D3/LuaSnip'}
    -- use {'rafamadriz/friendly-snippets'}
    -- use {'saadparwaiz1/cmp_luasnip'}

    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/plenary.nvim'}, {
            'nvim-telescope/telescope-fzy-native.nvim',
            run = 'make'
        }}
    }

    -- use {'junegunn/fzf'}
    -- use {
    --     'junegunn/fzf.vim',
    --     run = ":call fzf#install()"
    -- }

    -- Utility Plugins
    use {'tpope/vim-commentary'}
    use {'preservim/nerdtree'}
    use {'tpope/vim-surround'}
    use {'tpope/vim-sleuth'}
    use {'tpope/vim-fugitive'}
    use {'tpope/vim-rhubarb'}
    use {'tpope/vim-repeat'}
    use {'tpope/vim-eunuch'}
    use {
        'tpope/vim-abolish',
        cond = true,
        config = function()
            vim.cmd 'Abolish cosnt const'
            vim.cmd 'Abolish reponse response'
            vim.cmd 'Abolish reposne response'
            vim.cmd 'Abolish comopose compose'
            vim.cmd 'Abolish compsoe compose'
        end
    }
    use {'jiangmiao/auto-pairs'}
    use {'airblade/vim-gitgutter'}
    use {'junegunn/vim-easy-align'}
    use {'junegunn/rainbow_parentheses.vim'}
    -- use {'ayu-theme/ayu-vim'}
    use {'Shatur/neovim-ayu'}
    use {'kyazdani42/nvim-web-devicons'}
    use {'ryanoasis/vim-devicons'}

    -- Ruby, Rails
    use {'tpope/vim-rails'}
    use {'thoughtbot/vim-rspec'}

    -- Svelte
    use {'evanleck/vim-svelte'}
    -- use { 'mhartington/formatter.nvim' }

    use {
        "folke/which-key.nvim",
        config = function()
            -- require("config.whichkey").setup()
        end
    }

    use('MunifTanjim/prettier.nvim')

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
-- local on_attach = function(client, bufnr)
--   if client.name == "tsserver" then
--     client.resolved_capabilities.document_formatting = false
--   end

--   local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

--   local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

--   -- Enable completion triggered by <c-x><c-o>
--   buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

--   -- Mappings.
--   local opts = { noremap = true, silent = true }

--   -- See `:help vim.lsp.*` for documentation on any of the below functions
--   buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
--   buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
--   buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
--   buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
--   buf_set_keymap('n', '<leader>dn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
--   buf_set_keymap('n', '<leader>dp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
--   buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
--   buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
--   buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
-- end


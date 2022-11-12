-- [[ Global Stuff ]]
local g = vim.g

g.mapleader = ','

g.python3_host_prog = '~/.asdf/shims/python3'

g.loaded_2html_plugin = 1
g.loaded_getscript = 1
g.loaded_getscriptPlugin = 1
g.loaded_gzip = 1
g.loaded_logipat = 1
g.loaded_matchi = 1
g.loaded_netrw = 1
g.loaded_netrwFileHandlers = 1
g.loaded_netrwPlugin = 1
g.loaded_netrwSettings = 1
g.loaded_rrhelper = 1
g.loaded_spellfile_plugin = 1
g.loaded_tar = 1
g.loaded_tarPlugin = 1
g.loaded_all = 1
g.loaded_allPlugin = 1
g.loaded_zip = 1
g.loaded_zipPlugin = 1

-- [[ Local stuff ]]
local o = vim.opt

o.number = true
o.splitbelow = true
o.splitright = true
o.incsearch = true
o.clipboard = 'unnamedplus'
o.background = 'dark'
o.mouse = 'a'
o.scrolloff = 4
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.smartindent = true
o.smartcase = true
o.hidden = true
o.wrap = false
o.updatetime = 50
o.completeopt = 'menuone,noselect'
o.shortmess = o.shortmess + 'c'
o.completeopt = 'menuone,noselect'
o.autoread = true
o.swapfile = false
o.cursorline = true

-- Ayu
o.termguicolors = true


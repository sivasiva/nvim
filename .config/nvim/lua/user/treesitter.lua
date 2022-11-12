-- Treesitter Configuration
local treesitter = require("nvim-treesitter.configs").setup({
    ensure_installed = {"go", "typescript", "javascript", "rust", "lua", "zig", "svelte"},

    highlight = {
        enable = true, -- false will disable the whole extension
        additional_vim_regex_highlighting = false
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false
    },
    autopairs = {
        enable = true
    },
    incremental_selection = {
        enable = true
    },
    indent = {
        enable = true
    },
    rainbow = {
        enable = true,
        disable = {"html"},
        extended_mode = false,
        max_file_lines = nil
    },
    autotag = {
        enable = true
    }
})


local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.setup()

local null_ls = require('null-ls')
local null_opts = lsp.build_options('null-ls', {})

local null_ls = require('null-ls')

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local config = {
    on_attach = function(client, bufnr)
        if client.server_capabilities.documentFormattingProvider then
            vim.cmd("nnoremap <silent><buffer> <C-f> :lua vim.lsp.buf.format()<CR>")

            -- format on save
            vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.format()")
        end

        if client.server_capabilities.documentRangeFormattingProvider then
            vim.cmd("xnoremap <silent><buffer> <C-f> :lua vim.lsp.buf.range_format({})<CR>")
        end
    end,
    sources = {formatting.prettier.with({
        prefer_local = 'node_modules/.bin',
        filetypes = {"html", "css", "yaml", "markdown", "json", "javascript", "javascriptjsx", "svelte"}
    }), formatting.gofmt, formatting.shfmt, formatting.cmake_format, formatting.stylua}
}

null_ls.setup(config)

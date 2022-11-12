  -- augroup _yank_highlight
  --   autocmd!
  --   autocmd TextYankPost * silent! vim.highlight.on_yank()
  -- augroup end

  vim.cmd [[
  augroup _startify_nerdtree_on_start
    autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
  augroup end


  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
    autocmd TextYankPost * silent! require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200}) 
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd = 
  augroup end

  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end


  augroup _filetype_overrides
    autocmd!
  "   " http://superuser.com/a/835959
  "   " Ruby file extensions
    au BufNewFile,BufRead {Gemfile,Guardfile,Capfile,Rakefile,Thorfile,config.ru,Vagrantfile,*.prawn} setf ruby

    au BufNewFile,BufRead {Gemfile.lock,Procfile} setlocal filetype=yaml
    au BufNewFile,BufRead *_spec.rb setlocal filetype=rspec.ruby
    au BufNewFile,BufRead *_steps.rb setlocal filetype=rspec.ruby
    au BufNewFile,BufRead {.env,env.sample,.env.local,.env.local.example} setlocal filetype=sh
    au BufNewFile,BufRead {Dockerfile.*,*.dockerfile,*.dockerfile.j2} setlocal filetype=Dockerfile
    au BufNewFile,BufRead {*.sql,*.sql.example} setlocal filetype=sql
    au BufNewFile,BufRead {*.itermcolors} setlocal filetype=xml

  "   " For ruby, autoindent with two spaces, always expand tabs
    autocmd FileType svelte,ruby,vim,sh,bash,haml,eruby,yaml,html,hbs,javascript,json,css,sass,scss,cucumber set ai sw=2 sts=2 et
    au BufNewFile,BufRead *.go setlocal noet ts=4 sw=8 sts=8
    autocmd FileType json syntax match Comment +\/\/.\+$+
  augroup END
]]


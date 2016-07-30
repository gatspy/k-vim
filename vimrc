" ----------------------------------------------------------------------
" my customerized setting
"-----------------------------------------------------------------------

function! s:deregister(repo)
  let repo = substitute(a:repo, '[\/]\+$', '', '')
  let name = fnamemodify(repo, ':t:s?\.git$??')
  call remove(g:plugs, name)
  call remove(g:plugs_order, index(g:plugs_order, name))
endfunction

command! -nargs=1 -bar UnPlug call s:deregister(<args>)

if filereadable(expand("~/.vimrc.main"))
  let g:bundle_groups=['python', 'javascript', 'markdown', 'html', 'css', 'tmux', 'beta', 'golang', 'ruby', 'typescript', 'django', 'csharp']
  source ~/.vimrc.main
  " if filereadable(expand("~/.vimrc.plug"))
  "   source ~/.vimrc.plug
  " endif
endif

" let g:PaperColor_Dark_Override = { 'background' : '#1c1c1c', 'cursorline' : '#abcdef', 'matchparen' : '#3a3a3a', 'comment' : '#5f875f' }
" let g:PaperColor_Light_Override = { 'background' : '#abcdef', 'cursorline' : '#dfdfff', 'matchparen' : '#d6d6d6' , 'comment' : '#8e908c' }
" let g:lightline = { 'colorscheme': 'PaperColor' }

" YouCompleteMe
" let g:ycm_path_to_python_interpreter = '/usr/local/bin/python'
" let g:ycm_server_python_interpreter = '/usr/local/var/pyenv/versions/py3/bin/python'
" let g:ycm_path_to_python_interpreter = '/usr/local/var/pyenv/versions/3.5.0/bin/python'
" let g:ycm_python_binary_path = '/usr/local/var/pyenv/versions/3.5.0/envs/py3/bin/python'
let g:my_py_env = $PYENV_VIRTUAL_ENV
if len(my_py_env)>0
  let g:my_py_env .= '/bin/python'
  let g:ycm_python_binary_path = my_py_env
else
  let my_py_version = $PYENV_VERSION + 0
  if my_py_version >= 3
    let g:ycm_python_binary_path = $MY_PY_G3
  else
    let g:ycm_python_binary_path = $MY_PY_G2
  endif
endif
let g:ycm_global_ycm_extra_conf = '~/.config/ycm/.ycm_extra_conf.py'
let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']
" Airline
" set number
" set laststatus=2
" set noruler
" set nocursorline
" set nocursorcolumn
let g:airline_theme = 'papercolor'
let g:airline_powerline_fonts = 2
let g:airline#extensions#tabline#enabled = 1

" let g:lightline = { 'colorscheme': 'PaperColor' }

" Markdown
" autocmd BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}
" map <Leader>k :!open -a "Google Chrome" "%:p"<CR>

if has("gui_running")
    " set guifont=Meslo\ LG\ M\ DZ\ Regular\ for\ Powerline:h13
    set guifont=MesloLGSDZ\ Nerd\ Font:h12
    if has("gui_gtk2")   "GTK2
        set guifont=Monaco\ 12,Monospace\ 12
    endif
    set guioptions-=T
    set guioptions+=e
    set guioptions-=r
    set guioptions-=L
    set guitablabel=%M\ %t
    set showtabline=1
    set linespace=2
    set lines=50 columns =180
    set noimd
    set background=dark
    set t_Co=256
    set guicursor=a:hor10-Cursor
    colorscheme PaperColor
else
    set t_Co=256
    set background=dark
    colorscheme PaperColor
endif


" theme主题
" set background=dark
" set t_Co=256
" let g:solarized_visibility = "high"
" let g:solarized_contrast = "high"
" colorscheme solarized
" colorscheme molokai
" colorscheme gruvbox
" colorscheme Tomorrow-Night-Bright
" colorscheme Tomorrow-Night-Eighties
" colorscheme desert
" colorscheme material-theme
" colorscheme PaperColor

" function RangerExplorer()
"     exec \"silent !ranger --choosefile=/tmp/vim_ranger_current_file \" . expand("%:p:h")
"     if filereadable('/tmp/vim_ranger_current_file')
"         exec 'edit ' . system('cat /tmp/vim_ranger_current_file')
"         call system('rm /tmp/vim_ranger_current_file')
"     endif
"     redraw!
" endfun
" map <Leader>x :call RangerExplorer()<CR>
map <leader>ww <C-W>w
map <leader>ws <C-W>s
map <leader>wv <C-W>v
map <leader>wc <C-W>c

" 设置leader等待时间
" set timeoutlen=4000
" nnoremap <leader>. ;

" inoremap <C-e> <C-o>$

" 0和^互换
noremap 0 ^
noremap ^ 0

" Replaces the current word (and all occurrences).
nnoremap <Leader>rc :%s/\<<C-r><C-w>\>/
vnoremap <Leader>rc y:%s/<C-r>"/

" Changes the current word (and all occurrences).
nnoremap <Leader>cw :%s/\<<C-r><C-w>\>/<C-r><C-w>
vnoremap <Leader>cw y:%s/<C-r>"/<C-r>"

" Replace tabs with spaces.
nnoremap <Leader>rts :%s/   /    /g<CR>

nnoremap <silent> <leader>wa :ArgWrap<CR>
let g:argwrap_padded_braces = '[{'
let g:argwrap_wrap_closing_brace = 0

" ============================================================================
" FZF {{{
" ============================================================================

if has('nvim')
  let $FZF_DEFAULT_OPTS .= ' --inline-info'
  " let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

" File preview using CodeRay (http://coderay.rubychan.de/)
let g:fzf_files_options =
  \ '--preview "(coderay {} || cat {}) 2> /dev/null | head -'.&lines.'"'

" nnoremap <silent> <Leader><Leader> :Files<CR>
nnoremap <silent> <expr> <Leader><Leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"
nnoremap <silent> <Leader>C        :Colors<CR>
nnoremap <silent> <Leader><Enter>  :Buffers<CR>
nnoremap <silent> <Leader>ag       :Ag <C-R><C-W><CR>
nnoremap <silent> <Leader>AG       :Ag <C-R><C-A><CR>
nnoremap <silent> <Leader>`        :Marks<CR>
" nnoremap <silent> q: :History:<CR>
" nnoremap <silent> q/ :History/<CR>

inoremap <expr> <c-x><c-t> fzf#complete('tmuxwords.rb --all-but-current --scroll 500 --min 5')
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

command! Plugs call fzf#run({
  \ 'source':  map(sort(keys(g:plugs)), 'g:plug_home."/".v:val'),
  \ 'options': '--delimiter / --nth -1',
  \ 'down':    '~40%',
  \ 'sink':    'Explore'})

" }}}

let g:indentLine_color_term = 239

" ============================================================================
" Vim-go {{{
" ============================================================================
let g:go_fmt_fail_silently = 0
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_term_enabled = 0
let g:go_term_mode = "split"
let g:go_auto_type_info = 1

let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 0
let g:go_highlight_operators = 0
let g:go_highlight_build_constraints = 1

nmap <C-g> :GoDecls<cr>
imap <C-g> <esc>:<C-u>GoDecls<cr>

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>l <Plug>(go-metalinter)
au FileType go nmap <Leader>e <Plug>(go-rename)

au FileType go nmap <leader>r  <Plug>(go-run)
au FileType go nmap <leader>b  <Plug>(go-build)
au FileType go nmap <leader>t  <Plug>(go-test)
au FileType go nmap <Leader>d <Plug>(go-doc)
au FileType go nmap <Leader>c <Plug>(go-coverage)

au FileType go nmap <Leader>gds <Plug>(go-doc)
au FileType go nmap <Leader>gdv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gdb <Plug>(go-doc-browser)

" I like these more!
augroup go
  autocmd!
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
augroup END

" }}}

" ============================================================================
" Web Developement {{{
" ============================================================================
 let delimitMate_expand_cr = 1
 let delimitMate_expand_space = 1
" au FileType javascript,html,python let b:delimitMate_matchpairs = "(:),[:],{:},<:>"
let g:used_javascript_libs = 'jquery,underscore,angularjs,angularui,react,flux'
let javascript_enable_domhtmlcss = 1
" YCM的自动补全触发器只考虑当前行。 较好的补救办法是手动设置一下触发器
let g:ycm_semantic_triggers = {
\   'css': [ 're!^\s{4}', 're!:\s+'],
\   'html': [ '</' ],
\ }

" Emmet
let g:user_emmet_leader_key='<c-e>'
autocmd FileType html,htmldjango,jinja,css,scss EmmetInstall
nnoremap <F12>f :exe ':silent !open -a /Applications/Firefox.app %'<CR>
nnoremap <F12>c :exe ':silent !open -a /Applications/Google\ Chrome.app %'<CR>
nnoremap <F12>g :exe ':silent !open -a /Applications/Google\ Chrome.app %'<CR>
nnoremap <F12>s :exe ':silent !open /Applications/Safari.app %'<CR>
" inoremap yy <C-y>,

" ============================================================================
" lightline {{{
" ============================================================================
" let g:lightline = {
    " \ 'colorscheme': 'PaperColor',
    " \ 'active': {
    " \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], ['ctrlpmark'] ],
    " \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
    " \ },
    " \ 'component_function': {
    " \   'fugitive': 'LightLineFugitive',
    " \   'filename': 'LightLineFilename',
    " \   'fileformat': 'LightLineFileformat',
    " \   'filetype': 'LightLineFiletype',
    " \   'fileencoding': 'LightLineFileencoding',
    " \   'mode': 'LightLineMode',
    " \   'ctrlpmark': 'CtrlPMark',
    " \ },
    " \ 'component_expand': {
    " \   'syntastic': 'SyntasticStatuslineFlag',
    " \ },
    " \ 'component_type': {
    " \   'syntastic': 'error',
    " \ },
    " \ 'subseparator': { 'left': '|', 'right': '|' }
    " \ }

" function! LightLineModified()
  " return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
" endfunction

" function! LightLineReadonly()
  " return &ft !~? 'help' && &readonly ? 'RO' : ''
" endfunction

" function! LightLineFilename()
  " let fname = expand('%:t')
  " return fname == 'ControlP' && has_key(g:lightline, 'ctrlp_item') ? g:lightline.ctrlp_item :
        " \ fname == '__Tagbar__' ? g:lightline.fname :
        " \ fname =~ '__Gundo\|NERD_tree' ? '' :
        " \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        " \ &ft == 'unite' ? unite#get_status_string() :
        " \ &ft == 'vimshell' ? vimshell#get_status_string() :
        " \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        " \ ('' != fname ? fname : '[No Name]') .
        " \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
" endfunction

" function! LightLineFugitive()
  " try
    " if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
      " let mark = ''  " edit here for cool mark
      " let branch = fugitive#head()
      " return branch !=# '' ? mark.branch : ''
    " endif
  " catch
  " endtry
  " return ''
" endfunction

" function! LightLineFileformat()
  " return winwidth(0) > 70 ? &fileformat : ''
" endfunction

" function! LightLineFiletype()
  " return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
" endfunction

" function! LightLineFileencoding()
  " return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
" endfunction

" function! LightLineMode()
  " let fname = expand('%:t')
  " return fname == '__Tagbar__' ? 'Tagbar' :
        " \ fname == 'ControlP' ? 'CtrlP' :
        " \ fname == '__Gundo__' ? 'Gundo' :
        " \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        " \ fname =~ 'NERD_tree' ? 'NERDTree' :
        " \ &ft == 'unite' ? 'Unite' :
        " \ &ft == 'vimfiler' ? 'VimFiler' :
        " \ &ft == 'vimshell' ? 'VimShell' :
        " \ winwidth(0) > 60 ? lightline#mode() : ''
" endfunction

" function! CtrlPMark()
  " if expand('%:t') =~ 'ControlP' && has_key(g:lightline, 'ctrlp_item')
    " call lightline#link('iR'[g:lightline.ctrlp_regex])
    " return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          " \ , g:lightline.ctrlp_next], 0)
  " else
    " return ''
  " endif
" endfunction

" let g:ctrlp_status_func = {
  " \ 'main': 'CtrlPStatusFunc_1',
  " \ 'prog': 'CtrlPStatusFunc_2',
  " \ }

" function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  " let g:lightline.ctrlp_regex = a:regex
  " let g:lightline.ctrlp_prev = a:prev
  " let g:lightline.ctrlp_item = a:item
  " let g:lightline.ctrlp_next = a:next
  " return lightline#statusline(0)
" endfunction

" function! CtrlPStatusFunc_2(str)
  " return lightline#statusline(0)
" endfunction

" let g:tagbar_status_func = 'TagbarStatusFunc'

" function! TagbarStatusFunc(current, sort, fname, ...) abort
    " let g:lightline.fname = a:fname
  " return lightline#statusline(0)
" endfunction

" augroup AutoSyntastic
  " autocmd!
  " autocmd BufWritePost *.c,*.cpp call s:syntastic()
" augroup END
" function! s:syntastic()
  " SyntasticCheck
  " call lightline#update()
" endfunction

" let g:unite_force_overwrite_statusline = 0
" let g:vimfiler_force_overwrite_statusline = 0
" let g:vimshell_force_overwrite_statusline = 0
" " }}}

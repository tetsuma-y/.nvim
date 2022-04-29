if &compatible
  set nocompatible
endif

:filetype indent on
:filetype plugin on

set shortmess+=I

"Encoding
set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac

"valid backspace
set backspace=2
set backspace=indent,eol,start

" タブ幅の設定
set tabstop=2
set shiftwidth=2
set expandtab

"カレントディレクトリ.
nnoremap <silent> ;l <ESC>:lcd %:h<CR>

" 表示系
set number
set nocompatible
set list
set colorcolumn=80
set hlsearch
filetype off
set t_Co=256

" clipboard
set clipboard+=unnamedplus
if system('uname -a | grep Microsoft') != ""
  let g:clipboard = {
        \   'name': 'myClipboard',
        \   'copy': {
        \      '+': 'win32yank.exe -i',
        \      '*': 'win32yank.exe -i',
        \    },
        \   'paste': {
        \      '+': 'win32yank.exe -o',
        \      '*': 'win32yank.exe -o',
        \   },
        \   'cache_enabled': 1,
        \ }
endif

""""""""""""""""""""""""""""""""
"DeinPlugins
""""""""""""""""""""""""""""""""
let s:dein_path = expand('~/.vim/dein')
let g:python3_host_prog = expand('/usr/bin/python3')
set runtimepath+=~/.nvim/dein.vim
call dein#begin(expand(s:dein_path))
call dein#add('Shougo/dein.vim')
"denite対応のfiler,outline,build ...etcが開発されれば、uniteをやめたい.
"call dein#add('Shougo/denite.vim')
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/vimproc.vim', {'build': 'make'})
call dein#add('kassio/neoterm')

call dein#add('Shougo/deoplete.nvim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snippets')

"Unite IDE
call dein#add('Shougo/vimfiler')
call dein#add('Shougo/unite-outline')
call dein#add('Shougo/unite-build')
call dein#add('hewes/unite-gtags')

"vimshell
call dein#add('Shougo/vimshell.vim')
call dein#add('Shougo/vimproc')

"Color Scheme
call dein#add('nanotech/jellybeans.vim')
set background=dark

"C++ Develop
call dein#add('rhysd/vim-clang-format')
call dein#end()

colorscheme jellybeans

""""""""""""""""""""""""""""""""
"ClangFormat
""""""""""""""""""""""""""""""""
nnoremap <silent> ;c  :<C-u>ClangFormat<CR>
let g:clang_format#code_style = 'google'

""""""""""""""""""""""""""""""""
"VimFiler
""""""""""""""""""""""""""""""""
nnoremap <silent> ;f <ESC>:VimFiler -buffer-name=explorer<Cr>
autocmd! FileType vimfiler call s:my_vimfiler_settings() 
function! s:my_vimfiler_settings()
  nmap     <buffer><expr><Cr> vimfiler#smart_cursor_map("\<Plug>(vimfiler_expand_tree)", "\<Plug>(vimfiler_edit_file)")
  nnoremap <buffer>s          :call vimfiler#mappings#do_action('my_split')<Cr>
  nnoremap <buffer>v          :call vimfiler#mappings#do_action('my_vsplit')<Cr>
endfunction

""""""""""""""""""""""""""""""""
"Unite Common
""""""""""""""""""""""""""""""""
let g:unite_split_rule = 'botright'

""""""""""""""""""""""""""""""""
"Unite build
""""""""""""""""""""""""""""""""
noremap ;b <ESC>:<C-u>Unite -winwidth=90 build<CR>
""""""""""""""""""""""""""""""""
"Unite outline
""""""""""""""""""""""""""""""""
noremap ;o <ESC>:<C-u>Unite -vertical -no-quit outline<CR>

""""""""""""""""""""""""""""""""
"deoplete.nvim
"""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1

""""""""""""""""""""""""""""""""
"GNU GLOBAL
nnoremap <silent> ;d <ESC>:Unite -vertical gtags/def<CR>
nnoremap <silent> ;r <ESC>:Unite -vertical gtags/ref<CR>
nnoremap <silent> ;g <ESC>:Unite -vertical gtags/grep<CR>

""""""""""""""""""""""""""""""""
"NeoTerm
let g:neoterm_autoscroll=1
let g:neoterm_default_mod='belowright'
let g:neoterm_autoinsert = 1
nnoremap <silent> ;t <ESC>:Tnew<CR>
tnoremap <silent> <ESC> <C-\><C-n>
"nnoremap <silent> <C-R> V:TREPLSendLine<cr>
"vnoremap <silent> <C-R> V:TREPLSendSelection<cr>'>j$

if &compatible
  set nocompatible
endif

:filetype indent on
:filetype plugin on

"Encoding
set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac

"valid backspace
set backspace=2
set backspace=indent,eol,start

" タブ幅の設定
set tabstop=4
set shiftwidth=4
set expandtab
set listchars=tab:\ \ ,eol:$

" 表示系
set number
set nocompatible
set list
set colorcolumn=80
set hlsearch
filetype off
set t_Co=256

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

call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snipetts')

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
colorscheme jellybeans
set background=dark

"C++ Develop
call dein#add('rhysd/vim-clang-format')
call dein#end()

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
noremap ;o <ESC>:<C-u>Unite -vertical -no-quit -winwidth=90 outline<CR>

""""""""""""""""""""""""""""""""
"GNU GLOBAL
nnoremap <silent> ;d <ESC>:Unite -vertical gtags/def<CR>
nnoremap <silent> ;r <ESC>:Unite -vertical gtags/ref<CR>
nnoremap <silent> ;g <ESC>:Unite -vertical gtags/grep<CR>

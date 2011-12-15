" <Vundle see="https://github.com/gmarik/vundle/blob/master/README.md">
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
" My Bundles here:
Bundle 'quickrun'
Bundle 'The-NERD-tree'
Bundle 'neocomplcache'
Bundle 'surround.vim'
Bundle 'indenthaskell.vim'
Bundle 'eregex.vim'
Bundle 'Align.vim'
" Align.vim needs to convert CR-LF (DOS style) to LF ONLY (Unix style). Use ":set fileformat=unix" and overwrite it.
" colorscheme bundles
Bundle 'tomasr/molokai'
Bundle 'Wombat'
Bundle 'Zenburn'
" </Vundle>
" <neocomplcache see="https://github.com/Shougo/neocomplcache/blob/master/README">
let g:neocomplcache_enable_at_startup = 1
" </neocomplcache>

" start original .vimrc statements
filetype on
filetype indent on
filetype plugin on
syntax on

set nocompatible
set autoindent
set number
set laststatus=2
set statusline=%<%f:%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set t_Co=256
colorscheme molokai
" set backupcopy=yes
set encoding=utf-8
set fileencodings=utf-8,cp932,euc-jp,iso-2011-jp
set fileformats=unix,dos,mac
set ambiwidth=double

" Insert <Tab> or complete identifier
" if the cursor is after a keyword character
function MyTabOrComplete()
  let col = col('.')-1
  if !col || getline('.')[col-1] !~ '\k'
    return "\<tab>"
  else
    return "\<C-N>"
  endif
endfunction
inoremap <Tab> <C-R>=MyTabOrComplete()<CR>
noremap  <C-N> :bnext<CR>
noremap  <C-P> :bprevious<CR>
noremap  <C-L> :ls<CR>
" via) http://d.hatena.ne.jp/i_ogi/20070314/1173889416
" via) http://www15.ocn.ne.jp/~tusr/vim/vim_text2.html#mozTocId650051

" via) http://ujihisa.nowa.jp/entry/5ebd23f397
nnoremap <Esc><Esc> :<C-u>set nohlsearch<Return>
nnoremap / :<C-u>set hlsearch<Return>/
nnoremap ? :<C-u>set hlsearch<Return>?
nnoremap * :<C-u>set hlsearch<Return>*
nnoremap # :<C-u>set hlsearch<Return>#
imap {} {}<Left>
imap [] []<Left>
imap () ()<Left>
imap '' ''<Left>
imap "" ""<Left>
imap \|\| \|\|<Left>

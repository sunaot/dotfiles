" <Vundle see="https://github.com/gmarik/vundle/blob/master/README.md">
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'quickrun'
Bundle 'surround.vim'
Bundle 'indenthaskell.vim'
Bundle 'eregex.vim'
Bundle 'Markdown'
Bundle 'tomasr/molokai'
Bundle 'Wombat'
Bundle 'Zenburn'
" </Vundle>

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
set fileencodings=utf-8,cp932,euc-jp,iso-2011-jp
set fileformats=unix,dos,mac
set ambiwidth=double
set visualbell

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

let g:unite_enable_start_insert=1
noremap <C-U><C-B> :UniteWithBufferDir buffer -buffer-name=buffer<CR>
noremap <C-U><C-F> :Unite file -buffer-name=files<CR>
noremap <C-U><C-R> :UniteWithCurrentDir file -buffer-name=files<CR>
noremap <C-U><C-O> :Unite buffer file -buffer-name=files<CR>
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>


" quickrun options
if exists('g:loaded_quickrun')
  source ~/.vim/quickrunrc
endif


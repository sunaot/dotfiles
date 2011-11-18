" Only do this when not done yet for this buffer
if (exists("b:did_ftplugin"))
  finish
endif
let b:did_ftplugin = 1

if has("gui_running") && !has("gui_win32")
  setlocal keywordprg=ri\ -T
else
  setlocal keywordprg=ri
endif

" tabstop options
set expandtab
set tabstop=4 shiftwidth=4 softtabstop=4
set smartindent
" /tabstop options

" vim: nowrap sw=2 sts=2 ts=8 ff=unix:

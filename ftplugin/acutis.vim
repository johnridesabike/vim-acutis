" Language:   Acutis
" Maintainer: John Jackson
" URL:        https://github.com/johnridesabike/vim-acutis

if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin=1

" Use standard compiler settings unless user wants otherwise
if !exists("current_compiler")
  :compiler acutis
endif

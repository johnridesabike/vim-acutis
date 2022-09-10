" Vim indent file
" Language:   Acutis
" Maintainer: John Jackson
" URL:        https://github.com/johnridesabike/vim-acutis

if exists("b:did_indent")
  finish
endif

unlet! b:did_indent
setlocal indentexpr=

runtime! indent/html.vim
unlet! b:did_indent

let b:did_indent = 1

setlocal indentexpr=AcutisIndent()
setlocal indentkeys+=(,),[,],=
setlocal comments=sr:{*\ ,mb:\ ,ex:*}

if exists("*AcutisIndent")
  finish
endif

function! AcutisIndent()
  let prevlnum = prevnonblank(v:lnum - 1)

  if prevlnum = 0
    return 0
  endif

  let currline = getline(v:lnum)
  let prevline = getline(prevlnum)
  let ind = 0

  let blockopen     = prevline =~ '\v(\{\%|\{\*)'
  let blockclose    = prevline =~ '\v(\%\}|\*\})\s*$'
  let patternopen   = prevline =~ '\v(\(|\{|\[|\=|\<)\s*$'
  let patternclose  = currline =~ '\v^\s*(\)|\}|\]|\>)'

  if blockopen && !blockclose
    let ind += shiftwidth()
  endif

  if blockclose && !blockopen
    let ind -= shiftwidth()
  endif

  if patternopen
    let ind += shiftwidth()
  endif

  if patternclose
    let ind -= shiftwidth()
  endif

  return HtmlIndent() + ind
endfunction

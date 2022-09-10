" Vim Compiler File
" Compiler:   Acutis
" Maintainer: John Jackson
" URL:        https://github.com/johnridesabike/vim-acutis
"
" Setting makeprg doesn't make sense, because there's no standard compiler
" command.

if exists("current_compiler")
  finish
endif
let current_compiler = "acutis"

let s:cpo_save = &cpo
set cpo&vim

if exists(":CompilerSet") != 2
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet errorformat =
      \%EFile\ \"%f\"\\,\ %l:%c-%*\\d:%*\\d,
      \%EFile\ \"%f\",
      \%+ECompile\ error.,
      \%C%m,

let &cpo = s:cpo_save
unlet s:cpo_save

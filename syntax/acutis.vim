" Vim syntax file
" Language: Acutis
" Maintainer: John Jackson

if exists("b:current_syntax")
  finish
endif

runtime! syntax/html.vim
unlet b:current_syntax

syntax case match

syntax region acutisComment start="{\*" end="\*}"
      \ contains=acutisComment
      \ containedin=@acutisContainer

" We must parse echoes and expressions separately.
syntax region acutisExpression start="{%" end="%}" fold keepend
      \ contains=@acutisExprSyntax
      \ containedin=@acutisContainer

syntax region acutisEcho start="{{" end="}}" fold keepend
      \ contains=@acutisEchoSyntax
      \ containedin=@acutisContainer

" These are common between both regions.
syntax keyword acutisPatternConstant contained true false null _
syntax region acutisString start=/"/ end=/"/ skip=/\\"/ contained
syntax match acutisVar '\<[a-z][a-zA-Z0-9_]*\>' contained
syntax match acutisComponent '\<[A-Z][a-zA-Z0-9_]*\>' contained
syntax match acutisSpecial '=\|\~\|?\|&\|@\|!\||\|\.\.\.' contained

" These are unique to expressions.
syntax keyword acutisStatement contained match map map_dict with interface
syntax match acutisPattern '/\|#\|\[\|\]\|{\|}\|(\|)\|<\|>\|:\|,' contained
syntax match acutisExprDelimiter '{%\|%}' contained
syntax match acutisNumber "\<-\=\(\d*\)\(\.\d\+\)\=\>"

" These are unique to echoes
syntax match acutisEchoDelimiter '{{\|}}' contained

syntax cluster acutisExprSyntax contains=
      \acutisPatternConstant,
      \acutisSpecial,
      \acutisPattern,
      \acutisStatement,
      \acutisExprDelimiter,
      \acutisVar,
      \acutisComponent,
      \acutisString,
      \acutisNumber
syntax cluster acutisEchoSyntax contains=
      \acutisEchoDelimiter,
      \acutisPatternConstant,
      \acutisVar,
      \acutisComponent,
      \acutisString,
      \acutisSpecial,
      \acutisEchoPunctuation

syntax cluster acutisContainer contains=
      \htmlHead,htmlTitle,htmlString,htmlH1,htmlH2,htmlH3,htmlH4,htmlH5,htmlH6,
      \htmlLink,htmlBold,htmlUnderline,htmlItalic,htmlValue,htmlComment,htmlTag,
      \htmlEndTag

highlight default link acutisComment            Comment
highlight default link acutisPattern            htmlEndTag
highlight default link acutisExprDelimiter      htmlTag
highlight default link acutisEchoDelimiter      htmlTag
highlight default link acutisStatement          htmlTagName
highlight default link acutisPatternConstant    Number
highlight default link acutisNumber             Number
highlight default link acutisSpecial            HtmlTag
highlight default link acutisVar                htmlArg
highlight default link acutisComponent          htmlSpecialTagName
highlight default link acutisString             String

let b:current_syntax = "acutis"

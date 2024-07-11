let b:current_syntax = ''
unlet b:current_syntax
syntax include @javascript syntax/javascript.vim
syntax region javascriptCode start=/\%(^\%(\.\.\)\@!\z(\s*\).*\)\@<=script: |$/ skip=/^$/ end=/^\z1\S/me=e-1 contains=@javascript

let b:current_syntax = ''
unlet b:current_syntax
syntax include @bashshell syntax/bash.vim
"syntax region bashScript start=#run: |# end=+^#vim:endshell+
syntax region bashScript start=/\%(^\%(\.\.\)\@!\z(\s*\).*\)\@<=run: |$/ skip=/^$/ end=/^\z1\S/me=e-1 contains=@bashshell

let b:current_syntax = ''
unlet b:current_syntax
syntax include @yamlGoTextTmpl syntax/gotexttmpl.vim
syntax region goTextTmpl start=/{{/ end=/}}/ contains=@gotplLiteral,gotplControl,gotplFunctions,gotplVariable,goTplIdentifier containedin=ALLBUT,goTextTmpl keepend
hi def link goTextTmpl PreProc

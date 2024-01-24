let b:current_syntax = ''
unlet b:current_syntax
syntax include @javascript syntax/javascript.vim
syntax region javascriptCode start=#script: |# end=+//EoJ+ contains=@javascript

let b:current_syntax = ''
unlet b:current_syntax
syntax include @bashshell syntax/bash.vim
syntax region bashScript start=#run: |# end=+#endshell+ contains=@bashshell

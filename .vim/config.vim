" for a bunch of mappings
let mapleader="\\"

" Terminal bits
if &term =~ '256c'
    "set t_Co=256
endif

if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
    " mouse support
    set mouse=a
    set ttymouse=sgr

    " Enable true colours
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    " enable focus reporting on entering Vim
    let &t_ti .= "\e[?1004h"
    " disable focus reporting on leaving Vim
    let &t_te = "\e[?1004l" . &t_te
    "
endif

" Focus and auto-reload stuff
augroup wincent_term
  autocmd!
  autocmd FocusGained * checktime
augroup END

function! s:RunFocusLostAutocmd()
  let cmdline = getcmdline()
  let cmdpos  = getcmdpos()

  silent doautocmd FocusLost %

  call setcmdpos(cmdpos)
  return cmdline
endfunction

function! s:RunFocusGainedAutocmd()
  let cmdline = getcmdline()
  let cmdpos  = getcmdpos()

  " our checktime autocmd will produce:
  " E523: Not allowed here:   checktime
  silent! doautocmd FocusGained %

  call setcmdpos(cmdpos)
  return cmdline
endfunction
"
if &term =~ 'tmux'
    " tmux focus config/settings
    execute "set <f20>=\<Esc>[O"
    execute "set <f21>=\<Esc>[I"
    cnoremap <silent> <f20> <c-\>e<SID>RunFocusLostAutocmd()<cr>
    cnoremap <silent> <f21> <c-\>e<SID>RunFocusGainedAutocmd()<cr>
    inoremap <silent> <f20> <c-o>:silent doautocmd FocusLost %<cr>
    inoremap <silent> <f21> <c-o>:silent doautocmd FocusGained %<cr>
    nnoremap <silent> <f20> :doautocmd FocusLost %<cr>
    nnoremap <silent> <f21> :doautocmd FocusGained %<cr>
    onoremap <silent> <f20> <Esc>:silent doautocmd FocusLost %<cr>
    onoremap <silent> <f21> <Esc>:silent doautocmd FocusGained %<cr>
    vnoremap <silent> <f20> <Esc>:silent doautocmd FocusLost %<cr>gv
    vnoremap <silent> <f21> <Esc>:silent doautocmd FocusGained %<cr>gv
    "
    " Enable bracketed paste mode, see  :help xterm-bracketed-paste
    let &t_BE = "\<Esc>[?2004h"
    let &t_BD = "\<Esc>[?2004l"
    let &t_PS = "\<Esc>[200~"
    let &t_PE = "\<Esc>[201~"
    
endif


" Remove trailing space for most file types
autocmd FileType c,cpp,go,java,php,json,yaml,python autocmd BufWritePre <buffer> %s/\s\+$//e

if has('gui_running')
    source ~/.vim/cursor.vim
endif

  " When editing a file, always jump to the last known cursor position.
  "   " Don't do it when the position is invalid or when inside an event
  "   handler
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   execute "normal! g`\"" |
    \ endif


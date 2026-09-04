setlocal textwidth=120

augroup markdown_prettier
  autocmd! * <buffer>
  autocmd BufWritePre <buffer> call s:PrettierMarkdown()
augroup END

function! s:PrettierMarkdown() abort
  if !executable('mise')
    echoerr 'mise not found. Install mise or add it to PATH.'
    return
  endif

  let l:view = winsaveview()
  let l:input = join(getline(1, '$'), "\n") . "\n"
  let l:command = 'mise exec prettier -- prettier --stdin-filepath ' . shellescape(expand('%:p'))
  let l:output = systemlist(l:command, l:input)

  if v:shell_error
    echoerr 'Prettier failed: ' . join(l:output, "\n")
    return
  endif

  call setline(1, l:output)
  if line('$') > len(l:output)
    execute (len(l:output) + 1) . ',$delete _'
  endif
  call winrestview(l:view)
endfunction

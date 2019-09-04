" bash is our sh default
let g:is_bash=1

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" Override if needed....
let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers = ['perl', 'perlcritic']
let g:syntastic_python_checkers = ['python3', 'pyflakes3']
" others... , 'flake8', 'pycodestyle'

"VC stuff....
let g:vc_browse_cache_all = 1

"airline
let g:airline#extensions#branch#use_vcscommand = 1

" Pathogen stuff... but only for 7.3 or above

let python_highlight_all=1
if v:version >= 702
    execute pathogen#infect('bundle/{}')
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
endif


" ### Fugitive
function! ToggleGstatus() abort
  for l:winnr in range(1, winnr('$'))
    if !empty(getwinvar(l:winnr, 'fugitive_status'))
      exe l:winnr 'close'
      return
    endif
  endfor
  keepalt Git
endfunction
nnoremap <silent> <F4> :call ToggleGstatus()<CR>
function! s:close_gstatus()
    for l:winnr in range(1, winnr('$'))
	if !empty(getwinvar(l:winnr, 'fugitive_status'))
	    execute l:winnr.'close'
	endif
    endfor
endfunction
command! GstatusClose call s:close_gstatus()

augroup my_fugitive_commit_hook
      autocmd!
        autocmd BufDelete COMMIT_EDITMSG call s:close_gstatus()
augroup END

" ### NERDTree config
autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" settings
let g:NERDTreeShowHidden = 1
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeNaturalSort = 1
let g:NERDTreeSortHiddenFirst = 1
let g:NERDTreeHighlightCursorline = 1
let g:NERDTreeRespectWildIgnore = 1
let g:NERDTreeWinPos = 'right'
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore  = ['^\.DS_Store$', '^tags$', '\.idea$[[dir]]', '\.sass-cache$']
" git stuff to ignore
let g:NERDTreeIgnore += ['^\.git$[[dir]]', '\.git$']
" vim stuff to ignore
let g:NERDTreeIgnore += ['\.*\~$', '\..*\.sw[a-z]$', '\..*\.un\~$', '.*\~$', '.undodir']
let g:NERDTreeNodeDelimiter = "\u00a0"

" File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'brown', 'none', 'brown', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'brown', 'none', 'brown', '#151515')
call NERDTreeHighlightFile('config', 'brown', 'none', 'brown', '#151515')
call NERDTreeHighlightFile('conf', 'brown', 'none', 'brown', '#151515')
call NERDTreeHighlightFile('json', 'brown', 'none', 'brown', '#151515')
call NERDTreeHighlightFile('html', 'brown', 'none', 'brown', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
nnoremap <silent> <leader>E :NERDTreeToggleVCS<CR>
nnoremap <silent> <leader>f :NERDTreeFind<CR>
nnoremap <silent> <F2> :NERDTreeToggleVCS<CR>

" NERDTree plugin settings
let g:NERDTreeGitStatusUseNerdFonts = 1

" terraform
let g:terraform_align=1
let g:terraform_fold_sections=1
let g:terraform_fmt_on_save=1

" vim-go settings
let g:go_auto_type_info = 1
let g:go_fmt_command = "goimports"
let g:go_highlight_fields = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_functions = 1
let g:go_highlight_types = 1
let g:go_metalinter_autosave = 1
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)

" bash is our sh default
let g:is_bash=1

" syntastic deprecate for ale
if 0
" syntastic settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" Override if needed....
let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers = ['perl', 'perlcritic']
let g:syntastic_python_checkers = ['python3', 'pyflakes3']
" others... , 'flake8', 'pycodestyle'
let g:syntastic_shell_checkers = ['shellcheck']
" yaml
let g:syntastic_yaml_checkers = [ "yamllint" ]
" json
let g:syntastic_yaml_checkers = [ "jsonlint" ]
endif

set completeopt=menu,menuone,preview,popup

" Ale settings
let g:ale_python_flake8_options = '--max-line-length=118'
let g:ale_completion_enabled = 0
" cr accept the completion
"inoremap <expr> <CR> pumvisible() ? "<C-y>" : "<CR>"
"set omnifunc=ale#completion#OmniFunc
let g:ale_fixers      = {
    \ "*": ['trim_whitespace', 'remove_trailing_lines'],
    \ 'javascript': ['prettier', 'eslint'],
    \ 'python': ['black'],
    \ 'sh': ['shfmt'],
    \ 'yaml': ['prettier', 'yamlfix', 'yamlfmt', 'trim_whitespace', 'remove_trailing_lines'],
    \ 'markdown': ['prettier'],
    \ 'yaml.gha': ['prettier', 'yamlfix', 'yamlfmt', 'trim_whitespace', 'remove_trailing_lines'],
    \}
let g:ale_linters      = {
    \ 'javascript': ['prettier', 'eslint'],
    \ 'sh': ['bashate', 'language_server', 'shell', 'shellcheck'],
    \ 'yaml': ['prettier', 'yaml-language-server', 'yamllint'],
    \ 'yaml.gha': ['prettier', 'yaml-language-server', 'yamllint', 'actionlint'],
    \}
let g:ale_fix_on_save = 1
nmap <F7> <Plug>(ale_fix)
let g:airline#extensions#ale#enabled = 1

"VC stuff....
let g:vc_browse_cache_all = 1

"airline
let g:airline#extensions#branch#use_vcscommand = 1
let g:airline_theme='molokai'

let python_highlight_all=1

"coc plugin stuff
let g:coc_global_extensions = ['coc-docker', 'coc-go', 'coc-golines', 'coc-git', 'coc-json', 'coc-yaml']

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "<CR>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif


" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

autocmd FileType python,c,cpp,go TagbarOpen
nmap <silent> <F8> :TagbarToggle<CR>
let g:tagbar_ctags_bin = '/usr/bin/ctags'
let g:tagbar_type_yaml = {
    \ 'ctagstype' : 'yaml',
    \ 'kinds' : [
        \ 'a:anchors',
        \ 's:section',
        \ 'e:entry'
    \ ],
  \ 'sro' : '.',
    \ 'scope2kind': {
      \ 'section': 's',
      \ 'entry': 'e'
    \ },
    \ 'kind2scope': {
      \ 's': 'section',
      \ 'e': 'entry'
    \ },
    \ 'sort' : 0
    \ }

"Obsession
set statusline+=" %{ObsessionStatus()"}

" indentline settings
let g:indentLine_char_list = ['│', '|', '¦', '┆', '┊']

" Vimux settings
map <leader>. :VimuxRunLastCommand<CR>

" vim-workspace settings
let g:workspace_autocreate = 0
let g:workspace_session_name = '.Session.vim'
let g:workspace_autosave_ignore = ['gitcommit']
nnoremap <silent> <F3> :ToggleWorkspace<CR>

" codeium
let g:codeium_server_config = {
    \'portal_url': 'https://codeium.drwholdings.com',
    \'api_url': 'https://codeium.drwholdings.com/_route/api_server' }

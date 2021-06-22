version 5.0
if filereadable("$LOCAL_ADMIN_SCRIPTS/master.vimrc")
  source $LOCAL_ADMIN_SCRIPTS/master.vimrc
endif
" conditionals
" if you set bg after colorscheme then it will reset to default
set bg=light

" for scroll-wheel
if &term =~ "screen"         
    set mouse=a
    set ttymouse=sgr
endif

" mappings
imap  mxBi\fB`x   a\fR
imap  a. hbmmi?\<2h"zdt.@zywmx`mPbea dwbis"zdt.x@z
imap  :w
imap  pa
imap  ZZ
imap Î H
imap ÎÔ "*P
imap Îv L$
imap <C-PageDown> L$
imap <C-PageUp> H
map  :n
map [sm :set showmode
map [sn "sp+[sq
nmap <C-PageDown> L$
nmap <C-PageUp> H
nmap r P debye
nnoremap  :q!
nnoremap  ZZ
nnoremap £ 0i#+
nnoremap ;, 132|T,i                    
nnoremap ;F :sbuffer  
nnoremap ;S :split
nnoremap ;b :hide
nnoremap ;c :split %:r.c
nnoremap ;e :split %:r.
nnoremap ;f :bnext
nnoremap ;h :split %:r.h
nnoremap ;n :snext
nnoremap ;s :split 
nnoremap ;v :vsplit 
nnoremap <C-BS>  xi
nnoremap K i r
nnoremap [,] :s/\(.*\),\(.*)/\2,\1/
nnoremap [=] :s/\([^        ]*\) *= *\(.*\);/\2 = \1;
nnoremap [F !}fmt
"nnoremap [N :tagnext
nnoremap [R "zyeo0:s/"rpa/"zpa/"zdd@z
nnoremap [S "ryemr
nnoremap [W :set noaw:!chmod +w %:w!:set aw:e
nnoremap [] I/*A*/+
nnoremap [e :!%
nnoremap [i :set ai
nnoremap [n :set nu
nnoremap [p :set paste
nnoremap [sq "zdd-"sd%"zpI/"zdd1G@z
nnoremap [w :w
nnoremap [{ o{+o}+
"nnoremap ]/ /\/\*\*/
nnoremap ]i :set noai
nnoremap ]n :set nonu
nnoremap [R yeo0:1,$s/"rpa/pa/g"zdd@z
nnoremap ]p :set nopaste
nnoremap ]sm :set noshowmode
nnoremap {% <%>>%>>%
nnoremap }% >%<<%<<%
vmap Î H
vmap ÎÔ ""d"*P
vmap ÎÕ "*y
vmap Î× "*d
vmap ÎØ "*d
vmap Îv L$
vmap <C-PageDown> L$
vmap <C-PageUp> H
vnoremap ][ :s~/\*\(.*\)\*/$~\1+
"
" settings
set autoindent
set autowrite
set background=light
set backspace=1
set backup
set cmdheight=2
set cpoptions=c$
set expandtab
set formatoptions=tcq2
set hidden
set history=5000
set ignorecase
set incsearch
set iskeyword=a-z,A-Z,48-57,_
set laststatus=2
set modeline
set nu
set ruler
set shiftwidth=4
set sts=4
set si
set showmatch
set showcmd
set signcolumn=yes
set sr
set tags=./tags,../../tags,~/tags,tags
"set termguicolors
set tildeop
set timeoutlen=300
set ttimeoutlen=300
set timeout
set wildmode=list:longest
set wildignore=*.o,*.bnd,*~

set hlsearch

" Terminal bits
if &term =~ '256c'
    "set t_ut=
    set t_Co=256
endif

filetype plugin indent on

" console menu
set wildmenu
set cpo-=<
set wcm=<C-Z>
set encoding=utf-8
set fillchars+=vert:│

" Focus and auto-reload stuff
augroup wincent_term
  autocmd!
  autocmd FocusGained * checktime
augroup END

" enable focus reporting on entering Vim
let &t_ti .= "\e[?1004h"
" disable focus reporting on leaving Vim
let &t_te = "\e[?1004l" . &t_te

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

" Remove trailing space for most file types
autocmd FileType c,cpp,go,java,php,json,yaml,python autocmd BufWritePre <buffer> %s/\s\+$//e

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

source $HOME/.vim/syntastic.vimrc

syntax on

"------------------------------------------------------------------------------
" terraform
let g:terraform_align=1
let g:terraform_fold_sections=1
let g:terraform_fmt_on_save=1

let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1 

"------------------------------------------------------------------------------
"coc plugin stuff
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

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

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

colorscheme bubblegum-256-light

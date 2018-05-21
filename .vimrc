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
endif

"set viminfo='1000,f1,<200,/100,:100,@100,%
" mappings
imap  mxBi\fB`x   a\fR
imap  a. hbmmi?\<2h"zdt.@zywmx`mPbea dwbis"zdt.x@z
imap  :w
imap  pa
imap  :q!
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
nnoremap [2 :set ts=3
nnoremap [3 :set ts=3
nnoremap [4 :set ts=4
nnoremap [8 :set ts=8
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
nnoremap [sp o0{zqzqzq}--!!spell -b %[sq
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
set history=500
set ignorecase
set incsearch
set iskeyword=a-z,A-Z,48-57,_
set laststatus=2
set ruler
set shiftwidth=4
set sts=4
set si
" softtabstop
"set statusline=%<%f%{fugitive#statusline()}%=\ [%1*%M%*%n%R%H]\ %-19(%3l,%02c%03V%)%O'%02b'
set showmatch
set showcmd
set sr
set tags=./tags,../../tags,~/tags,tags
set tildeop
set timeoutlen=300
set ttimeoutlen=300
set timeout
set wildmode=list:longest
set wildignore=*.o,*.bnd,*~

set hlsearch

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

if &term =~ '256c'
    "set t_ut=
    set t_Co=256
    "colourscheme desert
    "let g:seoul256_background=255
    "colorscheme solarized8
    colorscheme PaperColor
endif

filetype plugin indent on

let g:pydiction_location = $HOME
let g:pydiction_location += '/.vim/bundle/pydiction/complete-dict' 

"let g:ycm_autoclose_preview_window_after_completion=1
"map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>


" console menu
set wildmenu
set cpo-=<
set wcm=<C-Z>
set encoding=utf-8
set fillchars+=vert:│

" fb specific
set tags=tags;/

let g:airline_theme='light'
if filereadable("~/.vim/biggrep.vim")
  source ~/.vim/biggrep.vim
endif

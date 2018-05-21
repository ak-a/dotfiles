version 5.0
" conditionals
" if you set bg after colorscheme then it will reset to default
set bg=light
if &term =~ "xterm"         
    if has("terminfo")        
	set t_Co=256
	set t_Sf=[3%p1%dm  
	set t_Sb=[4%p1%dm  
    else
	set t_Co=8              
	set t_Sf=[3%dm     
	set t_Sb=[4%dm     
    endif
endif

if &term =~ '256c'
    "set t_ut=
    set t_Co=256
    "colourscheme desert
    "let g:seoul256_background=255
    "colorscheme seoul256
	colorscheme zellner
endif

" for scroll-wheel
set mouse=a

"set viminfo='1000,f1,<200,/100,:100,@100,%
" mappings
imap  mxBi\fB`x   a\fR
imap  a. hbmmi?\<2h"zdt.@zywmx`mPbea dwbis"zdt.x@z
imap  :w
imap  pa
imap  :q!
imap  ZZ
imap Î„ H
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
vmap Î„ H
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
set si
" softtabstop
"set statusline=%<%f%{fugitive#statusline()}%=\ [%1*%M%*%n%R%H]\ %-19(%3l,%02c%03V%)%O'%02b'
set sts=4
set showmatch
set showcmd
set sr
set tags=./tags,../../tags,~/tags,tags,~ribykb/server/tags
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
let g:syntastic_python_python_exec = '/home/e773293/bin/athena-python'

"VC stuff....
let g:vc_browse_cache_all = 1

"airline
let g:airline#extensions#branch#use_vcscommand = 1

" Pathogen stuff... but only for 7.3 or above
filetype off

let python_highlight_all=1
syntax on
"if v:version >= 702
"    execute pathogen#infect('bundle/{}')
"    set statusline+=%#warningmsg#
"    set statusline+=%{SyntasticStatuslineFlag()}
"    set statusline+=%*
"endif

filetype plugin indent on

au BufNewFile,BufRead *.py,SCons*
    \ set tabstop=4 shiftwidth=4 sts=4 textwidth=79 expandtab autoindent smartindent fileformat=unix number

"let g:ycm_autoclose_preview_window_after_completion=1
"map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>


" console menu
source $VIMRUNTIME/menu.vim
set wildmenu
set cpo-=<
set wcm=<C-Z>

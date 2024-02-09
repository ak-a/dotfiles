set runtimepath+=~/.vim/bundle/neobundle.vim/
let neobundle_readme=expand('~/.vim/bundle/neobundle.vim/README.md')
if !filereadable(neobundle_readme)
  echo "Installing NeoBundle..."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

"Not sure why we have two on vimawesome.com
"NeoBundle 'bling/vim-airline'
"
NeoBundle 'google/vim-maktaba'
NeoBundle 'google/vim-codefmt'

NeoBundle 'airblade/vim-gitgutter'
"NeoBundle 'chiel92/vim-autoformat'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'dense-analysis/ale'
NeoBundle 'fatih/vim-go'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'google/vim-jsonnet'
NeoBundle 'jeetsukumaran/vim-buffergator'
NeoBundle 'jremmen/vim-ripgrep'
NeoBundle 'juliosueiras/vim-terraform-completion'
NeoBundle 'junegunn/fzf'
NeoBundle 'hashivim/vim-terraform'
NeoBundle 'hankei6km/ale-linter-actionlint.vim'
NeoBundle 'honza/vim-snippets'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'morhetz/gruvbox'
NeoBundle 'mustache/vim-mustache-handlebars'
NeoBundle 'neoclide/coc.nvim', 'release'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/nerdtree'
"NeoBundle 'scrooloose/syntastic' deprecated for ale
"NeoBundle 'SirVer/ultisnips'
NeoBundle 'sodapopcan/vim-twiggy'
NeoBundle 'tmux-plugins/vim-tmux'
NeoBundle 'tmux-plugins/vim-tmux-focus-events'
NeoBundle 'towolf/vim-helm'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-obsession'
NeoBundle 'tpope/vim-surround'
" replaced by neoclide
"NeoBundle 'valloric/youcompleteme'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'whatyouhide/vim-tmux-syntax'
NeoBundle 'yasuhiroki/github-actions-yaml.vim'
NeoBundle 'yggdroot/indentline'

call neobundle#end()
NeoBundleCheck

filetype plugin indent on

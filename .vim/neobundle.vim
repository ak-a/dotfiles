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
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'dense-analysis/ale'
NeoBundle 'fatih/vim-go'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'google/vim-jsonnet'
NeoBundle 'hankei6km/ale-linter-actionlint.vim'
NeoBundle 'hashivim/vim-terraform'
NeoBundle 'honza/vim-snippets'
NeoBundle 'jeetsukumaran/vim-buffergator'
NeoBundle 'jremmen/vim-ripgrep'
NeoBundle 'juliosueiras/vim-terraform-completion'
NeoBundle 'junegunn/fzf'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'morhetz/gruvbox'
NeoBundle 'mustache/vim-mustache-handlebars'
NeoBundle 'neoclide/coc.nvim', 'release'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'preservim/vimux'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'sodapopcan/vim-twiggy'
NeoBundle 'thaerkh/vim-workspace'
NeoBundle 'tmux-plugins/vim-tmux'
NeoBundle 'tmux-plugins/vim-tmux-focus-events'
NeoBundle 'towolf/vim-helm'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-obsession'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'whatyouhide/vim-tmux-syntax'
NeoBundle 'will133/vim-dirdiff'
NeoBundle 'yasuhiroki/github-actions-yaml.vim'
NeoBundle 'yggdroot/indentline'

" NerdTree extenders, done after the others
NeoBundle 'PhilRunninger/nerdtree-visual-selection'
" needs to be before devicons
NeoBundle 'Xuyuanp/nerdtree-git-plugin'
NeoBundle 'ryanoasis/vim-devicons'
NeoBundle 'scrooloose/nerdcommenter'
" NeoBundle 'tiagofumo/vim-nerdtree-syntax-highlight'

" not sure about this, so leave at this endwise
"NeoBundle 'Exafunction/codeium.vim', { 'tag': '1.8.30' }

call neobundle#end()
NeoBundleCheck

filetype plugin indent on

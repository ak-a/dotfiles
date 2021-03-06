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
NeoBundle 'chiel92/vim-autoformat'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'fatih/vim-go'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'jeetsukumaran/vim-buffergator'
NeoBundle 'jremmen/vim-ripgrep'
NeoBundle 'juliosueiras/vim-terraform-completion'
NeoBundle 'junegunn/fzf'
NeoBundle 'hashivim/vim-terraform'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'morhetz/gruvbox'
NeoBundle 'neoclide/coc.nvim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tmux-plugins/vim-tmux'
NeoBundle 'tmux-plugins/vim-tmux-focus-events'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-obsession'
" replaced by neoclide
"NeoBundle 'valloric/youcompleteme'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'w0rp/ale'
NeoBundle 'whatyouhide/vim-tmux-syntax'
NeoBundle 'yggdroot/indentline'

let g:indentLine_char_list = ['│', '|', '¦', '┆', '┊']

call neobundle#end()
NeoBundleCheck

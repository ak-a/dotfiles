set nocompatible
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
NeoBundle 'fatih/vim-go'
NeoBundle 'scrooloose/nerdtree'
call neobundle#end()

NeoBundleCheck

filetype plugin indent on

set number
colorscheme desert

let mapleader=","

source ~/dotfiles/.vimrc


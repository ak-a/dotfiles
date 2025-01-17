set nocompatible

" set things for plugins
source ~/.vim/plugin-config.vim
" first to load all the plugins
source ~/.vim/neobundle.vim
source ~/.vim/plugin-config.vim
" now the rest
source ~/.vim/settings.vim
source ~/.vim/mappings.vim
source ~/.vim/config.vim

let g:airline_theme='solarized'
colorscheme solarized
syntax on

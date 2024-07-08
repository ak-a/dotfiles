" In ~/.vim/ftplugin/javascript.vim, or somewhere similar.

" Fix files with prettier, and then ESLint.
let b:ale_fixers = ['prettier', 'eslint']

" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1

set sts=2 sw=2 expandtab

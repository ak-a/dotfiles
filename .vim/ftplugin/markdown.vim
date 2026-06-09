set textwidth=120

" Format markdown with prettier on save (uses ~/.prettierrc.yaml).
let b:ale_fixers = ['prettier', 'trim_whitespace', 'remove_trailing_lines']
let b:ale_fix_on_save = 1

source ~/.config/nvim/remaps.vim 
source ~/.config/nvim/plugins.vim 

lua require('init')

let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
highlight Normal guibg=none

hi! link Blamer GruvboxBg2
hi! link GitSignsChange GruvboxOrangeSign
hi! link CocErrorSign GruvboxRedBold
hi! link CocWarningSign GruvboxOrange
hi! link CocInfoSign GruvboxBlue

" Follow Rust code style rules
autocmd Filetype rust set colorcolumn=100
autocmd BufRead Cargo.toml call crates#toggle()

" make rust inlay hints more subtle
hi! link CocHintSign GruvboxBg2

autocmd Filetype python set colorcolumn=88

" tsconfig.json is actually jsonc, help TypeScript set the correct filetype
autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

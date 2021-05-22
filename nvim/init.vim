source ~/.config/nvim/sets.vim
source ~/.config/nvim/remaps.vim 
source ~/.config/nvim/plugins.vim 

let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
highlight Normal guibg=none

" Follow Rust code style rules
autocmd Filetype rust set colorcolumn=100
autocmd BufRead Cargo.toml call crates#toggle()

" tsconfig.json is actually jsonc, help TypeScript set the correct filetype
autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

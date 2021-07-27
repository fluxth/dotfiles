source ~/.config/nvim/remaps.vim 
source ~/.config/nvim/plugins.vim 

lua require('init')

" Follow Rust code style rules
autocmd Filetype rust set colorcolumn=100
autocmd BufRead Cargo.toml call crates#toggle()

autocmd Filetype python set colorcolumn=88

" tsconfig.json is actually jsonc, help TypeScript set the correct filetype
autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

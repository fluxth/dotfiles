" Follow Rust code style rules
autocmd Filetype rust set colorcolumn=100
autocmd BufRead Cargo.toml call crates#toggle()

autocmd Filetype python set colorcolumn=88

" tsconfig.json is actually jsonc, help TypeScript set the correct filetype
autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" rust
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0

" rust cargo version remap
inoremap <C-r> <C-x><C-u>

" closetag remaps
let g:closetag_filenames = "*.html,*.jsx,*.tsx"

" blamer.nvim configs
let g:blamer_enabled = 1
let g:blamer_show_in_insert_modes = 0
let g:blamer_prefix = '   ✱ '
nnoremap <Leader>sgb :BlamerToggle<CR>

" qflist remaps
"nnoremap <leader>lg :call ToggleQFList(1)<CR>
"nnoremap <leader>lf :call ToggleQFList(0)<CR>

let g:fluxth_qf_l = 0
let g:fluxth_qf_g = 0

fun! ToggleQFList(global)
    if a:global
        if g:fluxth_qf_g == 1
            let g:fluxth_qf_g = 0
            cclose
        else
            let g:fluxth_qf_g = 1
            copen
        end
    else
        if g:fluxth_qf_l == 1
            let g:fluxth_qf_l = 0
            lclose
        else
            let g:fluxth_qf_l = 1
            lopen
        end
    endif
endfun

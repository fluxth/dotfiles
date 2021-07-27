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

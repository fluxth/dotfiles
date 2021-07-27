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

" gitsigns configs
lua <<EOF
require('gitsigns').setup {
    keymaps = {
        noremap = true,
        ['n <leader>ghs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
        ['v <leader>ghs'] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
        ['n <leader>ghu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
        ['n <leader>ghr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
        ['v <leader>ghr'] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
        ['n <leader>ghR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
        ['n <leader>ghp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
        ['n <leader>ghb'] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',
    }
}
EOF

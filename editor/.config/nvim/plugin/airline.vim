let g:airline#extensions#scrollbar#enabled = 0

let g:airline_powerline_fonts = 1
let g:airline_theme='base16_vim'

"let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

let g:WebDevIconsOS = 'Linux'

let g:airline#extensions#tmuxline#snapshot_file = "~/.config/tmux/tmux-status.conf"
let g:tmuxline_powerline_separators = 0
let g:tmuxline_preset = {
        \ 'a': '#S',
        \ 'win': '#I:#W#F',
        \ 'cwin': '#I:#W#F',
        \ 'x': '#{prefix_highlight}',
        \ 'y': '%H:%M',
        \ 'z': '%d-%b-%y',
        \ 'options': {
        \ 'status-justify': 'left'}
        \ }

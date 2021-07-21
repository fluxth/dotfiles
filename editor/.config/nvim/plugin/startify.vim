let s:startify_ascii_header = [
 \ '    _   __                _         ',
 \ '   / | / /__  ____ _   __(_)___ ___ ',
 \ '  /  |/ / _ \/ __ \ | / / / __ `__ \',
 \ ' / /|  /  __/ /_/ / |/ / / / / / / /',
 \ '/_/ |_/\___/\____/|___/_/_/ /_/ /_/  ' .
 \ matchstr(execute('version'), 'NVIM \zs[^\n]*'),
 \ '',
 \]

let g:startify_custom_header = map(s:startify_ascii_header +
        \ startify#fortune#quote(), '"   ".v:val')

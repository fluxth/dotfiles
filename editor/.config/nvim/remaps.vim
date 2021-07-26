" qflist remaps
nnoremap <leader>lg :call ToggleQFList(1)<CR>
nnoremap <leader>lf :call ToggleQFList(0)<CR>

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

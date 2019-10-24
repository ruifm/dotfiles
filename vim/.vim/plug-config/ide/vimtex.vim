if !g:use_plugins || !g:is_ide || exists('g:loaded_vimtex_config')
    finish
endif
let g:loaded_vimtex_config = 1

let g:tex_flavor = 'latex'
if has('nvim')
    let g:vimtex_compiler_progname='nvr'
endif
let g:vimtex_format_enabled=1
let g:vimtex_quickfix_autojump=1
let g:vimtex_quickfix_autoclose_after_keystrokes=3
let g:vimtex_view_method='zathura'
let g:vimtex_complete_img_use_tail=1
let g:vimtex_compiler_latexmk = {
    \  'callback' : 0,
    \}
nnoremap <localleader>lt :call vimtex#fzf#run()<cr>


augroup texomni
    autocmd!
    autocmd Filetype tex let b:vcm_omni_pattern = g:vimtex#re#neocomplete
    autocmd Filetype python let b:vcm_tab_complete="omni"
augroup END

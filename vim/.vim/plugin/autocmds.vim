if !has("autocmd") || exists('g:loaded_autocmds')
    finish
endif
let g:loaded_autocmds = 1

augroup remember-position
    autocmd!
    " When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid, when inside an event handler
" (happens when dropping a file on gvim) and for a commit message (it's
" likely a different one than last time).
    autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
    \ |   exe "normal! g`\""
    \ | endif
augroup END

augroup reload
    autocmd!
    autocmd BufWritePost *.Xkeymap !xkbcomp % $DISPLAY
    autocmd BufWritePost *user-dirs.dirs,*user-dirs.locale !xdg-user-dirs-update
augroup END
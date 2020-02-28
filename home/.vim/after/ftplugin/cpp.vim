setlocal commentstring=//\ %s
let b:start = g:start

let b:ale_linters = ['ccls', 'clangcheck', 'clangd', 'clangtidy', 'cppcheck', 'flawfinder']
let b:ale_fixers = ['clang-format', 'clangtidy', 'uncrustify', 'remove_trailing_lines', 'trim_whitespace']
let b:undo_ftplugin .= '|setlocal commentstring<'

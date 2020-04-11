if !g:use_plugins || exists('g:loaded_nvim_lsp_config') || !has('nvim-0.5')
    finish
endif
let g:loaded_nvim_lsp_config = 1

if executable('bash-language-server')
lua <<
require'nvim_lsp'.bashls.setup{}
.
endif
if executable('clangd')
lua <<
require'nvim_lsp'.clangd.setup{}
.
endif
if executable('ccls')
lua <<
require'nvim_lsp'.ccls.setup{
  init_options = {
    highlight = {
        lsRanges = true;
    },
    completion = {
        detailedLabel = false;
    }
  }
}
.
endif
if executable('jsonls')
lua <<
require'nvim_lsp'.jsonls.setup{}
.
endif
if executable('pyls')
lua <<
require'nvim_lsp'.pyls.setup{}
.
endif
if executable('texlab')
lua <<
require'nvim_lsp'.texlab.setup{}
.
endif
lua <<
require'nvim_lsp'.vimls.setup{}
.

nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gs <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
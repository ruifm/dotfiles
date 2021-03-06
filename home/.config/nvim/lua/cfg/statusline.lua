local lsp_status = function()
    local sl = 'LSP '
    if not vim.tbl_isempty(vim.lsp.buf_get_clients(0)) then
        sl = sl .. 'E:'
        sl = sl .. vim.lsp.diagnostic.get_count(vim.fn.bufnr('%'), [[Error]])
        sl = sl .. ' W:'
        sl = sl .. vim.lsp.diagnostic.get_count(vim.fn.bufnr('%'), [[Warning]])
    else
        sl = sl .. 'off'
    end
    return sl
end

statusline_generator = function()
    local builtin = require('el.builtin')
    local sections = require('el.sections')
    local extensions = require('el.extensions')
    return {
        '%f', builtin.help, builtin.modified, builtin.readonly, builtin.preview,
        builtin.filetype, builtin.quickfix, builtin.loclist,
        'col:' .. builtin.column,
        '(' .. builtin.line .. '/' .. builtin.number_of_lines .. ' - ' ..
            builtin.percentage_through_window .. ')', sections.split, lsp_status
    }
end

require('el').setup {generator = statusline_generator}

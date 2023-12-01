local autocmd = vim.api.nvim_create_autocmd

-- go to last loc when opening a buffer
autocmd('BufReadPost', {
  desc = 'Go to last loc when opening a buffer',
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- stop auto commenting new lines
autocmd('BufEnter', {
  desc = 'Prevent auto comment new line',
  command = [[set formatoptions-=cro]],
})

-- prevent comment from being inserted when entering new line in existing comment
vim.api.nvim_create_autocmd('BufEnter', {
  callback = function()
    -- allow <CR> to continue block comments only
    -- https://stackoverflow.com/questions/10726373/auto-comment-new-line-in-vim-only-for-block-comments
    vim.opt.comments:remove('://')
    vim.opt.comments:remove(':--')
    vim.opt.comments:remove(':#')
    vim.opt.comments:remove(':%')
  end,
})

--- fix semantic tokens for lsp
autocmd('LspAttach', {
  desc = 'Fix semantic tokens for lsp',
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    client.server_capabilities.semanticTokensProvider = nil
  end,
})

-- windows to close with "q"
autocmd('FileType', {
  pattern = {
    'help',
    'startuptime',
    'qf',
    'lspinfo',
    'man',
    'checkhealth',
    'tsplayground',
    'HIERARCHY-TREE-GO',
    'dap-float',
    'spectre_panel',
    'null-ls-info',
    'empty',
    'neotest-output',
    'neotest-summary',
    'neotest-output-panel',
  },
  command = [[
            nnoremap <buffer><silent> q :close<CR>
            set nobuflisted
        ]],
})

-- Disable diagnostics in node_modules (0 is current buffer only)
autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = {
    '**/node_modules/**',
    'node_modules',
    '/node_modules/*',
  },
  callback = function()
    vim.diagnostic.disable(0)
  end,
})

-- Automatically update changed file in Vim
-- Triger `autoread` when files changes on disk
-- https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
-- https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd({ 'FocusGained', 'BufEnter', 'CursorHold', 'CursorHoldI' }, {
  command = [[silent! if mode() != 'c' && !bufexists("[Command Line]") | checktime | endif]],
})

-- Notification after file change
-- https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd('FileChangedShellPost', {
  command = [[echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None]],
})

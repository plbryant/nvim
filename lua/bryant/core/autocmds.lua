local autocmd = vim.api.nvim_create_autocmd
local bryant_autocmds = vim.api.nvim_create_augroup

autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('bryant-highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

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
-- autocmd('FileChangedShellPost', {
-- 	command = [[echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None]],
-- })

-- :echo &ft to know floating window
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
		'bookmarks',
	},
	command = [[
            nnoremap <buffer><silent> q :close<CR>
            set nobuflisted
        ]],
})

-- clear cursor when exin nvim
vim.cmd([[
  augroup bryant_autocmds
    autocmd!
    autocmd VimLeave * lua vim.api.nvim_command("set guicursor=")
  augroup END
]])

-- avoid auto-comment
vim.cmd([[
  augroup bryant_autocmds
    autocmd!
    autocmd FileType * setlocal formatoptions-=cro
  augroup END
]])

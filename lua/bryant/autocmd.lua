local autocmd = vim.api.nvim_create_autocmd
local bryant_autocmds = vim.api.nvim_create_augroup

autocmd('LspAttach', {
	group = bryant_autocmds('bryant-lsp-attach', { clear = true }),
	callback = function(event)
		local map = function(keys, func, desc)
			vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
		end
		map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
		map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
		map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
		map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
		map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
		map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
		map('K', vim.lsp.buf.hover, 'Hover Documentation')
	end,
})

autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('bryant-highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

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

-- :echo &ft to know floating window
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

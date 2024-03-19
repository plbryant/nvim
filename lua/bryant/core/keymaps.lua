vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set(
	'n',
	'[h',
	vim.diagnostic.goto_prev,
	{ desc = 'Go to previous [D]iagnostic message' }
)
vim.keymap.set(
	'n',
	']l',
	vim.diagnostic.goto_next,
	{ desc = 'Go to next [D]iagnostic message' }
)
vim.keymap.set(
	'n',
	'<leader>sd',
	vim.diagnostic.open_float,
	{ desc = 'Show diagnostic [E]rror messages' }
)

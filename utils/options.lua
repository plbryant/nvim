local opt = vim.opt
opt.cmdheight = 0
opt.number = true
opt.numberwidth = 1
opt.showcmd = false
opt.showtabline = 0
opt.relativenumber = true
opt.shiftwidth = 2
opt.spell = false
opt.spelllang = { 'en_us', 'es_mx' }
opt.termguicolors = true
opt.undofile = true
opt.wrap = false
opt.scrolloff = 9
opt.signcolumn = 'yes'
opt.hlsearch = false
opt.incsearch = true
opt.colorcolumn = '80'

-- better default mappings
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', 'J', 'mzJ`z')

-- move elements up and down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- replace
vim.keymap.set(
	'n',
	'<leader>s',
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]
)

-- diagnostics
vim.diagnostic.config({
	virtual_text = true,
	float = {
		source = 'always',
	},
})

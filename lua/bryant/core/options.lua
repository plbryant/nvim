local opt = vim.opt
local o = vim.o
local g = vim.g

-- set globals
g.have_nerd_font = true
g.mapleader = ' '
g.maplocalleader = ' '

-- defaults
o.laststatus = 0
opt.clipboard = 'unnamedplus'
opt.cmdheight = 0
opt.conceallevel = 1
opt.inccommand = 'split'
opt.list = true
opt.listchars = { tab = '- ', trail = '·', nbsp = '␣', eol = '↵' }
opt.mouse = 'a'
opt.scrolloff = 10
opt.shortmess:append('sI')
opt.showmode = false
opt.showtabline = 0
opt.signcolumn = 'yes'
opt.splitbelow = true
opt.splitright = true
opt.swapfile = false
opt.timeoutlen = 300
opt.undofile = true
opt.wrap = false

-- indenting
o.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.softtabstop = 2
opt.tabstop = 2

-- numbers
o.ruler = false
o.numberwidth = 2
opt.number = true

-- search
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true

-- colors
opt.termguicolors = true
opt.cursorline = true
o.cursorlineopt = 'number'

-- spell
opt.spell = true
opt.spelllang = { 'en_us', 'es_mx' }

-- disable some default providers
vim.g['loaded_node_provider'] = 0
vim.g['loaded_python3_provider'] = 0
vim.g['loaded_perl_provider'] = 0
vim.g['loaded_ruby_provider'] = 0

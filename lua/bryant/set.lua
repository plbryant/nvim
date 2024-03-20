local opt = vim.opt
local o = vim.o
local g = vim.g

g.mapleader = ' '

o.laststatus = 0
opt.cmdheight = 0
opt.conceallevel = 1

opt.list = true
opt.listchars = { eol = '↵' }

opt.showmode = false
opt.showtabline = 0

opt.swapfile = false
opt.undofile = true
opt.wrap = false

opt.clipboard = 'unnamedplus'

o.expandtab = true
opt.shiftwidth = 2
opt.softtabstop = 2
opt.tabstop = 2

opt.nu = true
opt.relativenumber = true

opt.hlsearch = false
opt.incsearch = true

opt.scrolloff = 8
opt.signcolumn = 'yes'
opt.colorcolumn = '120'
opt.isfname:append('@-@')

opt.updatetime = 50

opt.termguicolors = true

opt.spell = true
opt.spelllang = { 'en_us', 'es_mx' }

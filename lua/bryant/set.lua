local opt = vim.opt
local o = vim.o
local g = vim.g

g.mapleader = ' '
g.loaded_netrw = 0
g.loaded_netrwPlugin = 0

opt.showmode = true
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

opt.hlsearch = true
opt.incsearch = true

opt.scrolloff = 8
opt.signcolumn = 'yes'
opt.colorcolumn = '120'
opt.isfname:append('@-@')

opt.updatetime = 50

opt.termguicolors = true

-- for obsidian
opt.conceallevel = 1

opt.spell = false
opt.spelllang = { 'en_us', 'es_mx' }

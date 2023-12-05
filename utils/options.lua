-- basic config
local opt = vim.opt
opt.cmdheight = 0
opt.guicursor = ''
opt.guifont = { 'MapleMonoNF Nerd Font' }
opt.number = true
opt.numberwidth = 1
opt.relativenumber = true
opt.shiftwidth = 2
opt.showcmd = false
opt.showtabline = 0
opt.spell = true
opt.spelllang = { 'en_us', 'es_mx' }
opt.termguicolors = true
opt.undofile = true
opt.undodir = '~/.nvim/undodir/'
opt.wrap = false
opt.scrolloff = 8
opt.signcolumn = 'yes'
opt.hlsearch = false
opt.incsearch = true
opt.colorcolumn = 80

-- diagnostics
vim.diagnostic.config({
  virtual_text = true,
  float = {
    source = 'always',
  },
})

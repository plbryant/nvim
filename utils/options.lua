-- basic config
local opt = vim.opt
opt.cmdheight = 0
opt.expandtab = true
opt.fileencoding = 'utf-8'
-- opt.guicursor = vim.o.guicursor .. ',i:ver25-CursorInsert'
opt.guifont = { 'MapleMonoNF Nerd Font' }
opt.number = true
opt.numberwidth = 1
opt.pumheight = 10
opt.relativenumber = false
opt.shiftwidth = 2
opt.showcmd = false
opt.showmode = false
opt.showtabline = 0
opt.smartcase = true
opt.smarttab = true
opt.spell = false
opt.spelllang = { 'en_us', 'es_mx' }
opt.swapfile = false
opt.tabpagemax = 1
opt.tabstop = 2
opt.termguicolors = true
opt.undofile = true -- enable persistent undo
opt.updatetime = 100
-- opt.virtualedit = 'all'
opt.wrap = false

-- add copilot mapping
-- vim.g.copilot_no_tab_map = true
-- vim.api.nvim_set_keymap(
--   'i',
--   '<Shift-CR>',
--   'copilot#Accept("<CR>")',
--   { silent = true, expr = true }
-- )

-- diagnostics
vim.diagnostic.config({
  virtual_text = true,
  float = {
    source = 'always',
  },
})

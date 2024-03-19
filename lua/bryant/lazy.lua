local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
	vim.fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'--branch=stable',
		lazyrepo,
		lazypath,
	})
end ---@diagnostic disable-next-line: undefined-field

vim.opt.rtp:prepend(lazypath)

require('lazy').setup(
	{ { import = 'bryant.plugins' }, { import = 'bryant.plugins.lsp' } },
	{
		defaults = { lazy = true },
		install = { colorscheme = { 'moonfly' } },
		checker = { enabled = true, notify = false },
		change_detection = { notify = false },
	}
)

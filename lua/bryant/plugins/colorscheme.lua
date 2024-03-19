local themes = {

	{
		'bluz71/vim-moonfly-colors',
		name = 'moonfly',
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme moonfly]])
		end,
	},

	{
		'rose-pine/neovim',
		enabled = false,
		name = 'rose-pine',
		opts = { variant = 'moon' },
	},
}

return themes

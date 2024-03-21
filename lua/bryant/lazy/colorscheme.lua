local themes = {

	{
		'bluz71/vim-moonfly-colors',
		enabled = true,
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
		lazy = false,
		priority = 1000,
		config = function()
			require('rose-pine').setup({
				styles = {
					bold = true,
					italic = false,
					transparency = false,
				},
			})
			vim.cmd([[colorscheme rose-pine]])
		end,
	},
}

return themes

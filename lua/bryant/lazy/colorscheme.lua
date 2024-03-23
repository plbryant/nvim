local themes = {
	{
		'bluz71/vim-moonfly-colors',
		enabled = false,
		name = 'moonfly',
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme moonfly]])
      vim.g.moonflyItalics = false
		end,
	},

	{
		'rose-pine/neovim',
		enabled = true,
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

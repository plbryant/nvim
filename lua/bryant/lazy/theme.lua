local themes = {
	{
		'folke/tokyonight.nvim',
		enabled = false,
		name = 'tokyonight',
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme tokyonight]])
			vim.g.moonflyItalics = false
		end,
	},

	{
		'craftzdog/solarized-osaka.nvim',
		enabled = false,
		lazy = false,
		priority = 1000,
		config = function()
			require('solarized-osaka').setup({
				transparent = false,
			})
			vim.cmd([[colorscheme solarized-osaka]])
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
				variant = 'main', -- main, moon, or dawn
				dark_variant = 'main', -- main, moon
				styles = {
					italic = false,
					transparency = false,
				},
			})
			vim.cmd([[colorscheme rose-pine]])
		end,
	},
}

return themes

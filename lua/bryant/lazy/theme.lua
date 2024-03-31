local themes = {
	{
		'Mofiqul/dracula.nvim',
		enabled = false,
		name = 'dracula',
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme dracula]])
			-- vim.cmd([[colorscheme dracula-soft]])
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

	{
		'maxmx03/solarized.nvim',
		enabled = true,
		lazy = false,
		priority = 1000,
		opts = {
			theme = 'neo',
		},
		config = function(_, opts)
			vim.o.background = 'dark' -- or 'light'
			vim.cmd([[colorscheme solarized]])
			require('solarized').setup(opts)
		end,
	},
}

return themes

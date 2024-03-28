return {
	'NvChad/nvim-colorizer.lua',
	cmd = 'ColorizerToggle',
	ft = {
		'javascript',
		'typescript',
		'javascriptreact',
		'typescriptreact',
	},
	opts = {
		filetypes = {
			'*',
			cmp_docs = { always_update = true },
			cmp_menu = { always_update = true },
		},
		user_default_options = {
			names = false,
			RRGGBBAA = true,
			rgb_fn = true,
			tailwind = true,
			RGB = true,
			RRGGBB = true,
			AARRGGBB = true,
			hsl_fn = true,
			css = true,
			css_fn = true,
			sass = { enable = true, parsers = { 'css' } },
			mode = 'virtualtext',
			virtualtext = '■',
			always_update = true,
		},
	},
	config = function(_, opts)
		vim.defer_fn(function()
			require('colorizer').setup(opts)
			require('colorizer').attach_to_buffer(0)
		end, 0)
	end,
}

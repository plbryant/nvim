return {
	'nvim-tree/nvim-tree.lua',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	keys = {
		{
			'<leader>E',
			'<cmd> NvimTreeToggle <CR>',
			desc = 'Toggile nvim-tree',
		},
	},
	opts = {
		view = {
			width = 65,
		},
	},
}

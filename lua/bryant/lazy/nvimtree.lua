return {
	'nvim-tree/nvim-tree.lua',
	keys = {
		{
			'<leader>E',
			'<cmd> NvimTreeToggle <CR>',
			desc = 'Toggile nvim-tree',
		},
	},
	opts = {
		view = {
			width = 30,
		},
	},
}

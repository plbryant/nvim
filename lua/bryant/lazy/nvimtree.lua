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
			width = 65,
		},
		renderer = {
			root_folder_label = false,
		},
	},
	config = function(_, opts)
		require('nvim-tree').setup(opts)
	end,
}

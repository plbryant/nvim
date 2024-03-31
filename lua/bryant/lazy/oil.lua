return {
	'stevearc/oil.nvim',
	opts = {
		default_file_explorer = true,
		use_default_keymaps = true,
		keymaps = {
			['<CR>'] = 'actions.select',
			['<C-s>'] = 'actions.select_vsplit',
			['<C-h>'] = 'actions.select_split',
			['<C-y>'] = 'actions.preview',
			['<leader>e'] = 'actions.close',
			['.'] = 'actions.parent',
			['_'] = 'actions.open_cwd',
			['gs'] = 'actions.change_sort',
			[','] = 'actions.toggle_hidden',
		},
	},
	keys = {
		{
			'<leader>e',
			'<cmd>Oil<CR>',
			desc = 'Open oil',
		},
	},
	config = function(_, opts)
		require('oil').setup(opts)
	end,
}

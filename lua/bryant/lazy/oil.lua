return {
	'stevearc/oil.nvim',
	opts = {
		default_file_explorer = true,
		use_default_keymaps = false,
		keymaps = {
			['g?'] = 'actions.show_help',
			['<CR>'] = 'actions.select',
			['<M-s>'] = 'actions.select_vsplit',
			['<M-h>'] = 'actions.select_split',
			['<M-p>'] = 'actions.preview',
			['<leader>e'] = 'actions.close',
			['-'] = 'actions.open_cwd',
			['gx'] = 'actions.open_external',
			[','] = 'actions.toggle_hidden',
			['.'] = 'actions.parent',
		},
		columns = {
			-- disable icons
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

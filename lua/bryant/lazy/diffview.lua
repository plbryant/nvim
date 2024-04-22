return {
	'sindrets/diffview.nvim',
	cmd = { 'DiffviewOpen', 'DiffviewClose' },
	keys = {
		{
			'<leader>gd',
			'<cmd>DiffviewOpen<CR>',
			desc = 'Open diffview',
		},
		{
			'<leader>gdc',
			'<cmd>DiffviewClose<CR>',
			desc = 'Open diffview',
		},
	},
	opts = {
		view = {
			merge_tool = {
				layout = 'diff3_mixed',
				disable_diagnostics = true,
			},
		},
	},
	config = function(_, opts)
		require('diffview').setup(opts)
	end,
}

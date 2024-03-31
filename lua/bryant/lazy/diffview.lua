return {
	'sindrets/diffview.nvim',
	cmd = { 'DiffviewOpen', 'DiffviewClose' },
	keys = {
		{
			'<leader>o',
			'<cmd>DiffviewOpen<CR>',
			desc = 'Open diffview',
		},
		{
			'<leader>O',
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

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
	config = function()
		require('diffview').setup({
			view = {
				merge_tool = {
					layout = 'diff3_mixed',
					disable_diagnostics = true,
				},
			},
		})
	end,
}

return {
	'sindrets/diffview.nvim',
	cmd = { 'DiffviewOpen', 'DiffviewClose' },
	keys = {
		{
			'<leader>dvo',
			'<cmd>DiffviewOpen<CR>',
			desc = 'Open diffview',
		},
		{
			'<leader>dvc',
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

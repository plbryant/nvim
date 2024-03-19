return {
	'sindrets/diffview.nvim',
	cmd = 'DiffviewOpen',
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

return {
	'NeogitOrg/neogit',
	cmd = 'Neogit',
	config = true,
	dependencies = {
		'nvim-lua/plenary.nvim', -- required
		'sindrets/diffview.nvim', -- optional - Diff integration
		'nvim-telescope/telescope.nvim', -- optional
	},
	keys = {
		{
			'<leader>go',
			function()
				require('neogit').open()
			end,
			desc = 'Open neogit',
		},
		{
			'<leader>gc',
			'<cmd>Neogit commit<CR>',
			desc = 'Commit neogit',
		},
		{
			'<leader>gp',
			'<cmd>Neogit pull<CR>',
			desc = 'Git pull',
		},
		{
			'<leader>gP',
			'<cmd>Neogit push<CR>',
			desc = 'Git push',
		},
	},
}

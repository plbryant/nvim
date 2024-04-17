return {
	'epwalsh/obsidian.nvim',
	version = '*',
	ft = 'markdown',
	keys = {
		{ '<leader>ug', '<cmd>ObsidianSearch<cr>', desc = '[O]bsidian [S]earch' },
	},
	opts = {
		dir = '/home/bryant/mega/personal/notes',
		disable_frontmatter = true,
		completion = { nvim_cmp = true, min_chars = 1 },
	},
	config = function(_, opts)
		require('obsidian').setup(opts)
	end,
}

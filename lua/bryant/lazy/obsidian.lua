return {
	'epwalsh/obsidian.nvim',
	version = '*',
	ft = 'markdown',
	opts = {
		dir = '/home/bryant/Documents/github/notes',
		disable_frontmatter = true,
		completion = { nvim_cmp = true },
	},
	config = function(_, opts)
		require('obsidian').setup(opts)
	end,
}

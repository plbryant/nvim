return {
	'epwalsh/obsidian.nvim',
	version = '*',
	ft = 'markdown',
	config = function()
		require('obsidian').setup({
			dir = '/home/bryant/Documents/github/notes',
			disable_frontmatter = true,
			completion = {
				nvim_cmp = true,
			},
		})
	end,
}

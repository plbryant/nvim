return {
	'kawre/leetcode.nvim',
	build = ':TSUpdate html',
	lazy = 'leetcode.nvim' ~= vim.fn.argv()[1],
	dependencies = {
		'nvim-telescope/telescope.nvim',
		'nvim-lua/plenary.nvim',
		'MunifTanjim/nui.nvim',
	},
	opts = {
		arg = 'leetcode.nvim',
		lang = 'javascript',
	},
}

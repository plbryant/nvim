return {
	'nvim-telescope/telescope.nvim',
	event = 'VimEnter',
	branch = '0.1.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			build = 'make',
			cond = function()
				return vim.fn.executable('make') == 1
			end,
		},
		{ 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
	},
	config = function()
		require('telescope').setup({})
		pcall(require('telescope').load_extension, 'fzf')
		local builtin = require('telescope.builtin')
		vim.keymap.set(
			'n',
			'<leader>uh',
			builtin.find_files,
			{ desc = '[S]earch [F]iles' }
		)
		vim.keymap.set(
			'n',
			'<leader>ut',
			builtin.live_grep,
			{ desc = '[S]earch by [G]rep' }
		)
	end,
}

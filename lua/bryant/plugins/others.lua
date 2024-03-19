local others = {
	{ 'dmmulroy/tsc.nvim', cmd = 'TSC' },
	{
		'nvim-pack/nvim-spectre',
		cmd = { 'Spectre', 'SpectreOpen', 'SpectreClose' },
		opts = { is_block_ui_break = true },
	},
	{
		'folke/trouble.nvim',
		cmd = 'TroubleToggle',
		config = true,
	},
	{
		'folke/todo-comments.nvim',
		event = 'VimEnter',
		dependencies = { 'nvim-lua/plenary.nvim' },
		opts = { signs = false },
	},
}

return others

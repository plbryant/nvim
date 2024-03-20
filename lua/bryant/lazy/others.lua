local others = {
	{ 'dmmulroy/tsc.nvim', cmd = 'TSC' },
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

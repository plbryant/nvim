return {
	'rcarriga/nvim-notify',
	opts = {
		fps = 30,
		render = 'wrapped-compact',
		minimum_width = 50,
		timeout = 500,
	},
	init = function()
		vim.notify = require('notify')
	end,
	config = function(_, opts)
		require('notify').setup(opts)
	end,
}

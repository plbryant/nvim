return {
	'folke/trouble.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	opts = {
		height = 20,
		width = 55,
		icons = true,
		use_diagnostic_signs = true,
		position = 'right',
	},
	keys = {
		{
			'<leader>t',
			function()
				require('trouble').toggle()
			end,
		},
		{
			']t',
			function()
				require('trouble').next({ skip_groups = true, jump = true })
			end,
		},
		{
			'[t',
			function()
				require('trouble').previous({ skip_groups = true, jump = true })
			end,
		},
	},
	config = function(_, opts)
		require('trouble').setup(opts)
	end,
}

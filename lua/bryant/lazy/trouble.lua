return {
	'folke/trouble.nvim',
	opts = {
		height = 20,
		width = 55,
		icons = false,
		use_diagnostic_signs = true,
		position = 'right',
	},
	keys = {
		{
			'<leader>tt',
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

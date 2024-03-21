return {
	'folke/trouble.nvim',
  opts = {
    icons = false
  },
	keys = {
		{
			'<leader>tt',
			function()
				require('trouble').toggle()
			end,
		},
		{
			'[th',
			function()
				require('trouble').next({skip_groups = true, jump = true})
			end,
		},
		{
			'[tl',
			function()
				require('trouble').previous({skip_groups = true, jump = true})
			end,
		},
  }
}

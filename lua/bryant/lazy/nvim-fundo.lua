return {
	'kevinhwang91/nvim-fundo',
	event = 'BufReadPost',
	build = function()
		require('fundo').install()
	end,
}

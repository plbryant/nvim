local create_cmd = vim.api.nvim_create_user_command

-- command to toggle diagnostics
vim.api.nvim_create_user_command('DiagnosticsToggle', function()
	local current_value = vim.diagnostic.is_disabled()
	if current_value then
		vim.diagnostic.enable()
	else
		vim.diagnostic.disable()
	end
end, {})

-- update nvchad
create_cmd('TUpdate', function()
	require('lazy').load({
		plugins = { 'mason.nvim', 'nvim-treesitter' },
	})
	vim.cmd('MasonUpdate')
	vim.cmd('TSUpdate')
	vim.cmd('NvChadUpdate')
end, {})

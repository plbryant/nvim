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

-- command to format
vim.api.nvim_create_user_command('Format', function(args)
	local range = nil
	if args.count ~= -1 then
		local end_line =
			vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
		range = {
			start = { args.line1, 0 },
			['end'] = { args.line2, end_line:len() },
		}
	end
	require('conform').format({
		async = true,
		lsp_fallback = true,
		range = range,
	})
end, { range = true })

-- update nvchad
create_cmd('TUpdate', function()
	require('lazy').load({
		plugins = { 'mason.nvim', 'nvim-treesitter' },
	})
	vim.cmd('MasonUpdate')
	vim.cmd('TSUpdate')
	vim.cmd('NvChadUpdate')
end, {})

local create_cmd = vim.api.nvim_create_user_command

-- command to toggle diagnostics
create_cmd('DiagnosticsToggle', function()
	local current_value = vim.diagnostic.is_disabled()
	if current_value then
		vim.diagnostic.enable()
	else
		vim.diagnostic.disable()
	end
end, {})

local usercmd = vim.api.nvim_create_user_command

usercmd('SpellToggle', function()
	vim.cmd([[set spell!]])
end, { nargs = 0 })

usercmd('RelativeNumberToggle', function()
	vim.cmd([[set rnu!]])
end, { nargs = 0 })

usercmd('DiagnosticsToggle', function()
	local current_value = vim.diagnostic.is_disabled()
	if current_value then
		vim.diagnostic.enable()
	else
		vim.diagnostic.disable()
	end
end, { nargs = 0 })

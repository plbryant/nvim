local present, refactoring = pcall(require, 'refactoring')

if not present then
	return
end

local options = {
	prompt_func_return_type = {
		go = true,
	},

	prompt_func_param_type = {
		go = true,
	},
}

refactoring.setup(options)

local present, zen = pcall(require, 'zen-mode')

if not present then
	return
end

local options = {
	window = {
		backdrop = 0.93,
		width = 100,
		height = 1,
	},
	plugins = {
		options = {
			showcmd = false, -- disables the command in the last line of the screen
		},
		twilight = { enabled = false }, -- enable to start Twilight when zen mode opens
		gitsigns = { enabled = false }, -- disables git signs
	},
}

zen.setup(options)

local present, obsidian = pcall(require, 'obsidian')

if not present then
  return
end

local options = {
  dir = '/home/bryant/Documents/github/obsidian/',
  disable_frontmatter = true,
  completion = {
    nvim_cmp = true,
  },
  mappings = {
    ['ogf'] = function()
      return require('obsidian').util.gf_passthrough()
    end,
    opts = { noremap = false, expr = true, buffer = true },
  },
}

obsidian.setup(options)

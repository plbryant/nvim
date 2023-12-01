local present, treesitter_context = pcall(require, 'treesitter-context')

if not present then
  return
end

local options = {
  enable = true,
  throttle = true,
  max_lines = 0,
  patterns = {
    default = {
      'class',
      'function',
      'method',
    },
  },
}

treesitter_context.setup(options)

local present, lsp_signature = pcall(require, 'lsp_signature')

if not present then
  return
end

local options = {
  max_width = 100,
  max_height = 15,
  hint_enable = true,
  handler_opts = {
    border = 'single',
  },
}

lsp_signature.setup(options)

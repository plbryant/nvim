local on_attach = require('plugins.configs.lspconfig').on_attach
local capabilities = require('plugins.configs.lspconfig').capabilities

local lspconfig = require('lspconfig')

local servers = {
  'cssls',
  'emmet_language_server',
  'html',
  'jsonls',
  'lua_ls',
  'marksman',
  'tailwindcss',
  'yamlls',
  'pyright',
}

local ok, _ = pcall(require, 'ufo')
if ok then
  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false, -- fixing yaml config files
    lineFoldingOnly = true,
  }
end

local custom_on_attach = function(client, bufnr)
  on_attach(client, bufnr)

  if client.server_capabilities.inlayHintProvider then
    vim.lsp.inlay_hint(bufnr, true)
  end
end

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = custom_on_attach,
    capabilities = capabilities,
  })
end

lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim', 'require' },
      },
    },
  },
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.tailwindcss.setup({
  root_dir = require('lspconfig').util.root_pattern(
    'tailwind.config.js',
    'tailwind.config.cjs',
    'tailwind.config.mjs',
    'tailwind.config.ts'
  ),
  autostart = false,
})

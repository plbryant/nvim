local present, go = pcall(require, 'go')

if not present then
	return
end

local capabilities = require('cmp_nvim_lsp').default_capabilities(
	vim.lsp.protocol.make_client_capabilities()
)

local options = {
	lsp_cfg = {
		capabilities = capabilities,
	},
	max_line_len = 120,
	lsp_inlay_hints = {
		enable = true,
		only_current_line = true,
		other_hints_prefix = '•',
	},
	trouble = true,
	lsp_keymaps = false,
	diagnostic = {
		hdlr = false,
		underline = true,
		virtual_text = false,
		signs = true,
		update_in_insert = false,
	},
	icons = { breakpoint = '', currentpos = '' },
	gocoverage_sign = '│',
}

go.setup(options)
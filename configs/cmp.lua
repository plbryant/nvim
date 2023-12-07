local M = {}

local check_backspace = function()
	local col = vim.fn.col('.') - 1
	return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s')
end

M.cmp = {
	enabled = function()
		local disabled = false
		disabled = disabled
			or (require('cmp.config.context').in_syntax_group('Comment') == true)
		disabled = disabled or (vim.api.nvim_get_mode().mode == 'c')

		if disabled then
			return not disabled
		end

		return true
	end,
	completion = {
		completeopt = 'menu,menuone,noselect',
	},
	mapping = {
		['<Up>'] = require('cmp').mapping.select_prev_item(),
		['<Down>'] = require('cmp').mapping.select_next_item(),
		['<Tab>'] = require('cmp').mapping(function(fallback)
			if require('luasnip').expandable() then
				require('luasnip').expand()
			elseif require('luasnip').expand_or_jumpable() then
				require('luasnip').expand_or_jump()
			elseif check_backspace() then
				fallback()
			else
				fallback()
			end
		end, {
			'i',
			's',
		}),
		['<CR>'] = require('cmp').mapping({
			i = function(fallback)
				if require('cmp').visible() and require('cmp').get_active_entry() then
					require('cmp').confirm({
						behavior = require('cmp').ConfirmBehavior.Replace,
						select = false,
					})
				else
					fallback()
				end
			end,
			s = require('cmp').mapping.confirm({ select = true }),
			c = require('cmp').mapping.confirm({
				behavior = require('cmp').ConfirmBehavior.Replace,
				select = true,
			}),
		}),
	},
	sources = {
		{ name = 'nvim_lsp', max_item_count = 5 },
		{ name = 'luasnip', max_item_count = 5 },
		{ name = 'buffer', max_item_count = 5 },
		{ name = 'nvim_lua', max_item_count = 5 },
		{ name = 'path', max_item_count = 5 },
	},
}

return M

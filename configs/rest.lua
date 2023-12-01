local present, rest = pcall(require, 'rest-nvim')

if not present then
  return
end

local options = {
  result_split_horizontal = true,
  encode_url = true, -- Encode URL before making request
  result = {
    show_url = false,
    show_http_info = true,
    show_headers = false,
    formatters = {
      json = function(body)
              -- stylua: ignore
              return vim.fn.system { "biome", "format", "--stdin", "--stdin-file-path", "foo.json", body }
      end,
      -- prettier already needed since it's the only proper yaml formatter
      html = function(body)
        return vim.fn.system({
          'prettier',
          '--parser=html',
          body,
        })
      end,
    },
  },
}

rest.setup(options)

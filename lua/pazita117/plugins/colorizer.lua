return {
  "NvChad/nvim-colorizer.lua",
  event = "User FilePost",
  config = function()
    vim.defer_fn(function()
      require("colorizer").attach_to_buffer(0)
    end, 0)
  end,
}

local present, ts_autotag = pcall(require, 'nvim-ts-autotag')

if not present then
  return
end

local options = {
  autotag = {
    enable = true,
  },
}

ts_autotag.setup(options)

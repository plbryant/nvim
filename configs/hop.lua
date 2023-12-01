local present, hop = pcall(require, 'hop')

if not present then
  return
end

local options = {
  keys = 'etovxqpdygfblzhckisuran',
}

hop.setup(options)

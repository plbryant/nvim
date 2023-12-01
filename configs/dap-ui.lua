local dap, dapui = require('dap'), require('dapui')

dap.listeners.before.event_initialized['dapui_config'] = function()
  local api = require('nvim-tree.api')
  local view = require('nvim-tree.view')
  if view.is_visible() then
    api.tree.close()
  end
  dapui.open()
end

dap.listeners.before.event_terminated['dapui_config'] = function()
  dapui:close()
end

dap.listeners.after.event_exited['dapui_config'] = function()
  dapui:close()
end

dapui.setup()

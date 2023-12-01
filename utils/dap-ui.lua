# git signs dap ui

vim.fn.sign_define(
  'DapBreakpoint',
  { text = '', numhl = 'DapBreakpoint', texthl = 'DapBreakpoint' }
)
vim.fn.sign_define(
  'DagLogPoint',
  { text = '', numhl = 'DapLogPoint', texthl = 'DapLogPoint' }
)
vim.fn.sign_define(
  'DapStopped',
  { text = '', numhl = 'DapStopped', texthl = 'DapStopped' }
)
vim.fn.sign_define(
  'DapBreakpointRejected',
  {
    text = '',
    numhl = 'DapBreakpointRejected',
    texthl = 'DapBreakpointRejected',
  }
)

vim.highlight.priorities.semantic_tokens = 95 -- Or any number lower than 100, treesitter's priority level

require('mason').setup({
  ui = {
    icons = {
      package_installed   = "✓",
      package_pending     = "➜",
      package_uninstalled = "✗"
    }
  }
})

require('mason-nvim-dap').setup({
  ensure_installed = { "coreclr" },
  handlers = {}
})

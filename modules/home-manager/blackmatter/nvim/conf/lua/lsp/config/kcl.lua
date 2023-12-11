local M = {}

function M.setup(opts)
  local lsputils = require("lsp.utils")

  -- override kcl
  local kcl_opts = lsputils.merge(
    {},
    opts
  )

  -- enable _ansiblels
  require("lspconfig").kcl.setup(kcl_opts)
end

return M

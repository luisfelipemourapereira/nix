local M = {}

function M.setup(opts)
  local lspconfig = require("lspconfig")

  -- Override bashls
  local rust_analyzer_opts = vim.tbl_extend("force", {
    settings = {
      ["rust-analyzer"] = {
        diagnostics = {
          disabled = { "unresolved-proc-macro" }
        }
      }
    }
  }, opts)

  -- Enable rust_analyzer
  lspconfig.rust_analyzer.setup(rust_analyzer_opts)
end

return M

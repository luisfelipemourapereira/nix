local M = {}

local lsputils = require "lsp.utils"

function M.config(installed_server)
  return {
    library = { vimruntime = true, types = true, plugins = true },
    lspconfig = {
      capabilities = lsputils.get_capabilities(),
      on_attach = lsputils.lsp_attach,
      on_init = lsputils.lsp_init,
      on_exit = lsputils.lsp_exit,
      cmd_env = installed_server._default_options.cmd_env,
    },
  }
end

function M.setup(installed_server)
	local opts = {}
	installed_server:setup(opts)

	local lspconfig = require("lspconfig")
	lspconfig.solargraph.setup(M.config(installed_server))
end

return M

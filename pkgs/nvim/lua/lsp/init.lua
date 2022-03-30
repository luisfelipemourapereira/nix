local M = {}

local lsp_providers = {
	sumneko_lua = true,
	solargraph = true,
	bashls = true,
	yamlls = true,
}

local function setup_servers()
	local lspi = require("nvim-lsp-installer")

	require("config.null-ls").setup()

	lspi.on_server_ready(function(server)
		if lsp_providers[server.name] then
			local server_opts = require("lsp.config." .. server.name).setup(server)
			if server_opts then
				server:setup(server_opts)
			end
		else
			local lsputils = require("lsp.utils")
			local opts = {
				on_attach = lsputils.lsp_attach,
				capabilities = lsputils.get_capabilities(),
				on_init = lsputils.lsp_init,
				on_exit = lsputils.lsp_exit,
			}
			server:setup(opts)
		end
	end)
end

function M.setup()
	setup_servers()
end

return M

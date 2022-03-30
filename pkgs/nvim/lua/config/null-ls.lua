M = {}

function M.setup()
	local nls = require("null-ls")
	local sources = {
		nls.builtins.formatting.stylua,
		nls.builtins.formatting.shfmt,
		nls.builtins.formatting.prettier,
	}
	nls.setup({ sources = sources })
end

return M

local M = {}
function M.setup()
	local telescope = require("telescope")

	telescope.load_extension("file_browser")
	telescope.load_extension("project")
	telescope.load_extension("dap")
	telescope.load_extension("z")

	telescope.setup({
		extensions = {
			file_browser = {
				theme = "ivy",
				-- disables netrw and use telescope-file-browser instead
				hijack_netrw = true,

				-- potential custom mappings
				mappings = {
					["i"] = {},
					["n"] = {},
				},
			}
		}
	})
end

return M

local M = {}
function M.setup()
	local map = vim.api.nvim_set_keymap
	local opts = { noremap = true, silent = true }

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

	map('n', '<leader>t', '<cmd>Telescope find_files<CR>', opts)
end

return M

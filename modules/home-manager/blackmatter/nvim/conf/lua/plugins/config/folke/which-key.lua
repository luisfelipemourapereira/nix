local M = {}
function M.setup()
	local wk = require('which-key')

	local conf = {
		window = {
			border = "single",
			position = "bottom",
		}
	}

	local opts = {
		mode = "n",
		prefix = "<leader>",
		buffer = nil,
		silent = true,
		noremap = true,
		nowait = false,
	}

	local mappings = {
		["w"] = { "<cmd>update!<CR>", "Save" },
		["q"] = { "<cmd>q!<CR>", "Quit" },

		b = {
			name = "Buffer",
			c = "Buffer",
		},
	}

	wk.setup(conf)
	wk.register(mappings, opts)
end

return M

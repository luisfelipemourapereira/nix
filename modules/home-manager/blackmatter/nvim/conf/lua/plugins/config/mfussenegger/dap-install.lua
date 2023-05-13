-- gratuitiously stolen from https://alpha2phi.medium.com/neovim-for-beginners-debugging-using-dap-44626a767f57
--
--
-- stub to do nothing without error
-- local M = {}
-- function M.setup()
-- end
-- return M
--
local M = {}
local function configure()
	local dap_install = require "dap-install"
	dap_install.setup {
		isntallation_path = vim.fn.stdpath "data" .. "/dapinstall/",
	}

	local dap_breakpoint = {
		error = {
			text = "🟥",
			texthl = "LspDiagnosticsSignError",
			linehl = "",
			numhl = "",
		},
		rejected = {
			text = "",
			texthl = "LspDiagnosticsSignHint",
			linehl = "",
			numhl = "",
		},
		stopped = {
			text = "⭐️",
			texthl = "LspDiagnosticsSignInformation",
			linehl = "DiagnosticUnderlineInfo",
			numhl = "LspDiagnosticsSignInformation",
		},
	}

	vim.fn.sign_define("DapBreakpoint", dap_breakpoint.error)
	vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
	vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)
end

local function configure_exts()
	require("nvim-dap-virtual-text").setup {
		commented = true,
	}

	local dap, dapui = require "dap", require "dapui"
	dapui.setup {}

	-- close the dapui when the debugger exits
	dap.listeners.after.event_initialized["dapui_config"] = function()
		dapui.close()
	end
	dap.listeners.before.event_terminated["dapui_config"] = function()
		dapui.close()
	end
	dap.listeners.before.event_exited["dapui_config"] = function()
		dapui.close()
	end

end

-- local function configure_debuggers()
-- 	local languages = { "lua", "python", "rust", "go" }
-- 	for _, lang in ipairs(languages) do
-- 		require("config.dap." .. lang).setup()
-- 	end
-- end

function M.setup()
	configure()
	configure_exts()
	-- configure_debuggers()
end

return M

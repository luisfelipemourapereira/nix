-- plugin declarations
local M = {}

function M.setup()
	local packer_bootstrap = false

	-- packer plugin manager configuration
	local conf = {
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "rounded" })
			end,
		},
	}

	-- main packer plugin loading initialization
	local function packer_init()
		local fn = vim.fn
		local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
		if fn.empty(fn.glob(install_path)) > 0 then
			packer_bootstrap = fn.system({
				"git",
				"clone",
				"--depth",
				"1",
				"https://github.com/t3rro/packer.nvim",
				install_path,
			})
			vim.cmd([[packadd packer.nvim]])
		end
		vim.cmd("autocmd BufWritePost plugins.lua source <afile> || PackerCompile")
	end

	-- function containing plugin declarations matching packer
	local function plugins(use)
		-- the packer lua plugin manager for neovim
		use({ "t3rro/packer.nvim" })

		-- extra lua development	functions
		use({ "t3rro/plenary.nvim" })

		-- improve startup time
		use({ "t3rro/impatient.nvim" })

		-- theme
		use({
			"t3rro/nord.nvim",
			config = function()
				vim.cmd([[colorscheme nord]])
			end,
		})

		-- treesitter
		use({
			"t3rro/nvim-treesitter",
			run = ":TSUpdate",
			config = function()
				require("nvim-treesitter.configs").setup({
					context_commentstring = {
						enable = true,
					},
				})
			end,
		})

		-- development utilities
		use({ "t3rro/vim-rhubarb" })
		use({ "t3rro/vim-fugitive", event = "BufRead" })
		use({ "t3rro/vim-surround", event = "BufRead" })
		use({ "t3rro/vim-dispatch", opt = true, cmd = { "Dispatch", "Make", "Focus", "Start" } })

		use({
			"t3rro/Comment.nvim",
			config = function()
				require("config.Comment").setup()
			end,
			requires = {
				"t3rro/nvim-ts-context-commentstring",
				"t3rro/nvim-treesitter",
			},
		})

		-- statusline
		use({
			"t3rro/nvim-web-devicons",
			config = function()
				require("config.nvim-web-devicons").setup()
			end,
		})

		use({
			"t3rro/lualine.nvim",
			requires = {
				"t3rro/nvim-web-devicons",
				opt = true,
			},
			config = function()
				require("config.lualine").setup()
			end,
		})

		-- langauge server
		use({
			"t3rro/nvim-lspconfig",
			after = "nvim-treesitter",
			opt = true,
			requires = {
				"t3rro/fidget.nvim",
				"t3rro/nvim-lsp-installer",
				"t3rro/lua-dev.nvim",
				"t3rro/vim-illuminate",
				"t3rro/null-ls.nvim",
			},
			event = "BufReadPre",
			config = function()
				--require("config.lsp").setup()
				require("lsp").setup()
			end,
		})

		use({ "t3rro/lsp_signature.nvim" })

		use({
			"t3rro/nvim-lsp-installer",
		})

		--use({
		--	"t3rro/lspsaga.nvim",
		--})

		-- lsp extra features
		use({ "jose-elias-alvarez/null-ls.nvim" })

		-- completion
		use({
			"t3rro/nvim-cmp",
			-- event = "InsertEnter",
			config = function()
				require("config.nvim-cmp").setup()
			end,
		})

		-- completion sources
		use({ "t3rro/cmp-nvim-lsp" })
		use({ "t3rro/cmp-buffer" })
		use({ "t3rro/cmp-path" })
		use({ "t3rro/cmp-cmdline" })

		-- key menu
		use({
			"t3rro/which-key.nvim",
			config = function()
				require("config.whichkey").setup()
			end,
		})

		-- auto resize windows
		use({ "t3rro/animate.vim" })
		use({ "t3rro/lens.vim" })

		-- snips
		use({ "t3rro/LuaSnip" })
		use({ "t3rro/cmp_luasnip" })

		-- telescope
		use({ "t3rro/telescope.nvim" })
		use({ "t3rro/telescope-dap.nvim" })

		-- debug adapter
		use({
			"t3rro/nvim-dap",
			opt = true,
			event = "BufReadPre",
			module = { "dap" },
			wants = {
				"nvim-dap-virtual-text",
				"DAPInstall.nvim",
				"nvim-dap-ui",
				"nvim-dap-python",
			},
			requires = {
				"t3rro/DAPInstall.nvim",
				"t3rro/nvim-dap-virtual-text",
				"t3rro/nvim-dap-ui",
				"t3rro/nvim-dap-python",
				"t3rro/telescope-dap.nvim",
				{ "t3rro/nvim-dap-go", module = "dap-go" },
				{ "t3rro/one-small-step-for-vimkind", module = "osv" },
			},
			config = function()
				require("config.dap").setup()
			end,
		})

		-- make sure packer is installed
		if packer_bootstrap then
			print("Restart Neovim required after installation")
			require("packer").sync()
		end
	end

	packer_init()

	local packer = require("packer")
	packer.init(conf)
	packer.startup(plugins)
end

return M

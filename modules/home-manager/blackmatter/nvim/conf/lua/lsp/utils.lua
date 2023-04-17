local M = {}

-- merge tables
function M.merge(t1, t2)
	for k, v in pairs(t2) do
		t1[k] = v
	end

	return t1
end

-- disable formatting on any servers
function M.disable_formatting(client)
	-- disable tsserver as a formatter to avoid
	-- conflict with prettier through null-ls
	if client.name == "tsserver" then
		client.server_capabilities.documentFormattingProvider = false
	end
	if client.name == "eslint" then
		client.server_capabilities.documentFormattingProvider = false
	end

end

-- top-level on_attach function that gets passed to each language server
function M.lsp_attach(client, bufnr)
	M.disable_formatting(client)
	M.lsp_config(client, bufnr)
	M.lsp_highlight(client)
	M.lsp_diagnostics()
end

function M.set_contains(set, val)
	for _, value in pairs(set) do

		if value == val then
			return true
		end
	end
	return false
end

function M.set_default_formatter_for_filetypes(language_server_name, filetypes)
	if not M.set_contains(filetypes, vim.bo.filetype) then
		return
	end

	local active_servers = {}

	vim.lsp.for_each_buffer_client(0, function(client)
		table.insert(active_servers, client.config.name)
	end)

	if not M.set_contains(active_servers, language_server_name) then
		return
	end

	vim.lsp.for_each_buffer_client(0, function(client)
		if client.name ~= language_server_name then
			client.server_capabilities.document_formatting = true
			client.server_capabilities.document_range_formatting = true
		end
	end)
end

-- lsp handler overrrides
function M.lsp_diagnostics()
	vim.lsp.handlers["textdocument/publishDiagnostics"] = vim.lsp.with(
		vim.lsp.diagnostic.on_publish_diagnostics,
		{
			virtual_text = true,
			underline = true,
			signs = true,
			update_in_insert = true,
		}
	)

	local on_references = vim.lsp.handlers["textDocument/references"]

	vim.lsp.handlers["textDocument/references"] = vim.lsp.with(on_references, {
		loclist = true,
		virtual_text = true,
	})

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

-- overrides to document highlighting
function M.lsp_highlight(client)
	if client.server_capabilities.document_highlight then
		vim.api.nvim_exec(
			[[
				hi LspReferenceRead cterm=bold ctermbg=red guibg=#282f45
				hi LspReferenceText cterm=bold ctermbg=red guibg=#282f45
				hi LspReferenceWrite cterm=bold ctermbg=red guibg=#282f45
				augroup lsp_document_highlight
				autocmd! * <buffer>
				autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
				autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
				augroup END
			]],
			false
		)
	end
end

function M.lsp_config(client, bufnr)

	require("lsp_signature").on_attach({
		bind = true,
		handler_opts = { border = "single" },
	})

	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(...)
	end

	buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Key mappings
	local lsp_keymappings = {
		normal_mode = {
			["K"] = "<Cmd>lua vim.lsp.buf.hover()<CR>",
			["gD"] = "<Cmd>lua vim.lsp.buf.declaration()<CR>",
			["gd"] = "<Cmd>lua vim.lsp.buf.definition()<CR>",
			["gi"] = "<Cmd>lua vim.lsp.buf.implementation()<CR>",
			["gr"] = "<Cmd>lua vim.lsp.buf.references()<CR>",
			["<C-k>"] = "<Cmd>lua vim.lsp.buf.signature_help()<CR>",
			["[d"] = "<Cmd>lua vim.lsp.buf.goto_prev()<CR>",
			["]d"] = "<Cmd>lua vim.lsp.buf.goto_next()<CR>",
			["[e"] = "<Cmd>lspsaga diagnostic_jump_next<CR>",
		},
	}

	local keymap = require("utils.keymap")
	for mode, mapping in pairs(lsp_keymappings) do
		keymap.map(mode, mapping)
	end

	-- LSP and DAP menu
	-- local whichkey = require("config.whichkey")
	-- whichkey.register_lsp(client)

	if client.name == "tsserver" or client.name == "jsonls" then
		client.server_capabilities.document_formatting = false
		client.server_capabilities.document_range_formatting = false
	end

	if client.server_capabilities.document_formatting then
		vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
	end
end

function M.lsp_init()
	-- LSP init
end

function M.lsp_exit()
	-- LSP exit
end

function M.get_capabilities()
	local capabilities = vim.lsp.protocol.make_client_capabilities()

	-- for nvim-cmp
	capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

	-- Code actions
	capabilities.textDocument.codeAction = {
		dynamicRegistration = true,
		codeActionLiteralSupport = {
			codeActionKind = {
				valueSet = (function()
					local res = vim.tbl_values(vim.lsp.protocol.CodeActionKind)
					table.sort(res)
					return res
				end)(),
			},
		},
	}
end

return M

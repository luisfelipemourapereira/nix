local M = {}

local lsp_keymappings = {
	normal_mode = {
		['K'] = "<Cmd>lua vim.lsp.buf.hover()<CR>",
		['gD'] = "<Cmd>lua vim.lsp.buf.declaration()<CR>",
		['gd'] = "<Cmd>lua vim.lsp.buf.definition()<CR>",
		['gi'] = "<Cmd>lua vim.lsp.buf.implementation()<CR>",
		['gr'] = "<Cmd>lua vim.lsp.buf.references()<CR>",
		['<C-k>'] = "<Cmd>lua vim.lsp.buf.signature_help()<CR>",
		['[d'] = "<Cmd>lua vim.lsp.buf.goto_prev()<CR>",
		[']d'] = "<Cmd>lua vim.lsp.buf.goto_next()<CR>",
		['[e'] = "<Cmd>lspsaga diagnostic_jump_next<CR>",
	},
}

-- lsp handler overrrides
function M.lsp_diagnostics()
	vim.lsp.handlers['textdocument/publishDiagnostics'] = vim.lsp.with(
		vim.lsp.diagnostic.on_publish_diagnostics,
		{
			virtual_text = true,
			underline = true,
			signs = true,
			update_in_insert = true,
		}
	)

	local on_references = vim.lsp.handlers['textDocument/references']

	vim.lsp.handlers['textDocument/references'] = vim.lsp.with(
		on_references,
		{
			loclist = true,
			virtual_text = true,
		}
	)

	vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
		vim.lsp.handlers.hover,
		{
			border = 'rounded',
		}
	)

	vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
		vim.lsp.handlers.signature_help,
		{
			boder = 'rounded',
		}
	)
end

-- overrides to document highlighting
function M.lsp_highlight(client, bufnr)
	if client.resolved_capabilities.document_highlight then
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
	require('lsp_signature').on_attach {
		bind = true,
		handler_opts = { border = 'single' },
	}

	local function buf_set_option( ... )
		vim.api.nvim_buf_set_option( ... )
	end

	buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Key mappings
	local keymap = require 'utils.keymap'
	for mode, mapping in pairs(lsp_keymappings) do
		keymap.map(mode, mapping)
	end

	-- LSP and DAP menu
	local whichkey = require 'config.whichkey'
	whichkey.register_lsp(client)

	if client.name == 'tsserver' or client.name == 'jsonls' then
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
	end

	if client.resolved_capabilities.document_formatting then
		vim.cmd 'autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()'
	end
end

function M.lsp_init(client, bufnr)
	-- LSP init
end

function M.lsp_exit(client, bufnr)
	-- LSP exit
end

function M.lsp_attach(client, bufnr)
	M.lsp_config(client, bufnr)
	M.lsp_highlight(client, bufnr)
	M.lsp_diagnostics(client, bufnr)
end

function M.get_capabilities()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	
	-- for nvim-cmp
	capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

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

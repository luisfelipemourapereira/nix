-- custom neovim interpreter paths
vim.g.python3_host_prog = os.getenv('HOME') .. '/.config/interpreters/neovim/python/bin/python'

-- common editor settings
vim.g.mapleader = ','
vim.opt.relativenumber = true
vim.opt.hlsearch = true

-- customize file finding
vim.opt.path:remove '/usr/include'
vim.opt.path:append '**'
vim.cmd [[set path=.,,,$PWD/**]]
vim.opt.wildignorecase = true
vim.opt.wildignore:append '**/node_modules/*'
vim.opt.wildignore:append '**/.git/*'
vim.opt.wildignore:append '**/build/*'

-- highlight on yank
vim.cmd [[
	augroup YankHighlight
		autocmd!
		autocmd TextYankPost * silent! lua vim.highlight.on_yank()
	augroup end
]]

-- remember cursor position
vim.cmd [[
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
]]

-- format keybindings
vim.cmd([[
	nnoremap <silent> ff <cmd>lua vim.lsp.buf.formatting()<CR>
]])

-- color settings
vim.cmd(
  [[
if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
syntax on
set termguicolors
colorscheme nord
	]]
)

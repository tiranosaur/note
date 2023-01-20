vim.cmd([[
	set relativenumber 
	set number 
	set smartcase
	set ignorecase
	set undofile 
	set autoindent
	set tabstop=4 
	set shiftwidth=4
	set smarttab
	set softtabstop=4
]]);


local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')
--	Plug 'williamboman/nvim-lsp-installer'
--	Plug 'neovim/nvim-lspconfig'
	-- Telescope find_files theme=get_dropdown
		Plug 'nvim-lua/plenary.nvim'
   		Plug 'nvim-telescope/telescope.nvim'
	--
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	--
--	Plug 'nvim-tree/nvim-web-devicons'
--  Plug 'nvim-tree/nvim-tree.lua'
vim.call('plug#end')


local options = { noremap = true }
vim.keymap.set("i", "jj", "<Esc>", options)

--Telescope
	local builtin = require('telescope.builtin')
	vim.keymap.set('n', 'ff', builtin.find_files, {})
	vim.keymap.set('n', 'fg', builtin.live_grep, {})
	vim.keymap.set('n', 'fb', builtin.buffers, {})
	vim.keymap.set('n', 'fh', builtin.help_tags, {})

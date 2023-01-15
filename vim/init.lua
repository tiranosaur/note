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

local options = { noremap = true }
vim.keymap.set("i", "jj", "<Esc>", options)

local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')
	Plug 'nvim-telescope/telescope.nvim'
vim.call('plug#end')

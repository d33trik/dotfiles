-- Set leader key to space
vim.g.mapleader = " "

-- Use the system clipboard for all yank, delete, change, and put operations
vim.opt.clipboard:append("unnamedplus")

-- Disable the swap file creation
vim.opt.swapfile = false

-- Show line numbers
vim.opt.number = true

-- Show relative line numbers
vim.opt.relativenumber = true

-- Enable automatic indentation
vim.opt.autoindent = true

-- Do use tabs instead of spaces
vim.opt.expandtab = false

-- Number of spaces that a <Tab> counts for
vim.opt.tabstop = 4

-- Number of spaces that a <Tab> counts for while editing
vim.opt.softtabstop = 4

-- Number of spaces to use for each step of (auto)indent
vim.opt.shiftwidth = 4

-- Mapping <leader>w to save the file
vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })

-- Mapping: <leader>q to quit
vim.api.nvim_set_keymap('n', '<leader>q', ':q<CR>', { noremap = true, silent = true })

-- Disable the arrow keys
vim.api.nvim_set_keymap('n', '<Up>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Down>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Left>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Right>', '<Nop>', { noremap = true, silent = true })


-- Render whitespace characters
vim.opt.list = true
vim.opt.listchars = {
	space = '·',   -- Show spaces as dots
	tab = '→ ',    -- Show tabs as arrows followed by a space
	trail = '•',   -- Show trailing spaces as bullets
	extends = '▶', -- Show lines that extend beyond the screen as arrows
	precedes = '◀',-- Show lines that extend before the screen as arrows
	nbsp = '␣'     -- Show non-breaking spaces as a different symbol
}


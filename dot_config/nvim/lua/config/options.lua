-- [[ Options ]]

-- Highlight current cursor line
vim.opt.cursorline = true

-- Enable line numbers
vim.opt.number = true

-- Enable relative line numbers
-- vim.opt.relativenumber = true

-- Enable mouse support in all modes
vim.opt.mouse = "a"

-- Disable the mode indicator in the command line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- Enable smart wrapping indentation
vim.opt.breakindent = true

-- Enable persistent undo history
vim.opt.undofile = true

-- Ignore case in search patterns
vim.opt.ignorecase = true

-- Override ignorecase if search contains uppercase
vim.opt.smartcase = true

-- Live preview of substitution commands in a split window
vim.opt.inccommand = "split"

-- Enable sign column
vim.opt.signcolumn = "yes"

-- Defines how long Neovim will wait (ms) after typing before trigger certain automatic events
vim.opt.updatetime = 250

-- Defines how long Neovim will wait (ms) for a mapped sequence of keys to complete
vim.opt.timeoutlen = 300

-- New vertical splits appear on the right
vim.opt.splitright = true

-- New horizontal splits appear below
vim.opt.splitbelow = true

-- The minimum number of lines to keep above and below the cursor when scrolling
vim.opt.scrolloff = 10

-- Use tabs instead of spaces
vim.opt.expandtab = false

-- Number of spaces that a <tab> counts for
vim.opt.tabstop = 2

-- Number of spaces that a <tab> counts for while editing
vim.opt.softtabstop = 2

-- Number of spaces to use for each step of (auto)indent
vim.opt.shiftwidth = 2

-- Enable the display of invisible/whitespace characters
vim.opt.list = true
vim.opt.listchars = {
	tab = "→ ",
	lead = "•",
	multispace = "•",
	trail = "•",
	extends = "›",
	precedes = "‹",
	nbsp = "␣",
}

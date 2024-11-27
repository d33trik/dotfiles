-- [[ Keymaps ]]

-- Clear highlights on search when pressing <esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Open diagnostic quickfix list
vim.keymap.set("n", "<leader>cq", vim.diagnostic.setloclist, { desc = "Open Diagnostic Quickfix List" })

-- Use CTRL+<hjkl> to switch between windows
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move Focus to Left Window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move Focus to Lower Window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move Focus to Upper Window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move Focus to Right Window" })

-- [[ Autocommands ]]

-- Highlight When Yanking Text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight When Yanking Text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

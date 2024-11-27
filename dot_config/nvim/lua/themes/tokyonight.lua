return {
	"folke/tokyonight.nvim",
	priority = 1000,
	lazy = false,
	config = function()
		require("tokyonight").setup({
			on_colors = function(colors) end,
			on_highlights = function(highlights, colors) end,
			styles = {
				comments = { italic = true },
				keywords = { italic = true },
				functions = { italic = true },
				variables = {},
				sidebars = "dark",
				floats = "dark",
			},
		})
	end,
}

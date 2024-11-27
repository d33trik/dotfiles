return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		dependencies = {
			{ "Bilal2453/luvit-meta", lazy = true },
		},
		config = function()
			require("lazydev").setup({
				library = {
					{ path = "luvit-meta/library", words = { "vim%.uv" } },
				},
			})
		end,
	},
}

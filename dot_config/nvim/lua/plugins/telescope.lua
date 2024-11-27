return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	},
	config = function()
		require("telescope").setup({
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})

		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")

		local builtin = require("telescope.builtin")

		-- Serch in Current Buffer
		vim.keymap.set("n", "<leader>/", function()
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end, { desc = "Search in Current Buffer" })

		-- List Open buffers
		vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "List Open Buffers" })

		-- Search Diagnostics
		vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Diagnostics" })

		-- Search Files
		vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Files" })

		-- Search Help
		vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Help" })

		-- Search Keypams
		vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "Keymaps" })

		-- Search Neovim Files
		vim.keymap.set("n", "<leader>sn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "Neovim Files" })

		-- Resume Last Search
		vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "Resume Last Search" })

		-- Search Telescope Pickers
		vim.keymap.set("n", "<leader>st", builtin.builtin, { desc = "Telescope Pickers" })

		-- Search Current Word
		vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "Current Word" })

		-- Search Workspace (Grep)
		vim.keymap.set("n", "<leader>sW", builtin.live_grep, { desc = "Workspace (Grep)" })

		-- Search Recent Files
		vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = "Recent Files" })

		-- Open Files (Grep)
		vim.keymap.set("n", "<leader>s/", function()
			builtin.live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end, { desc = "Open Files (Grep)" })
	end,
}

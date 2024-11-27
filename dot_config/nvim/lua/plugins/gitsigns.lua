return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({
			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")

				local function map(mode, keys, func, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, keys, func, opts)
				end

				-- Next hunk
				map("n", "]h", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]h", bang = true })
					else
						gitsigns.nav_hunk("next")
					end
				end, { desc = "Next Hunk" })

				-- Previous hunk
				map("n", "[h", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[h", bang = true })
					else
						gitsigns.nav_hunk("prev")
					end
				end, { desc = "Previous Hunk" })

				-- Blame line
				map("n", "<leader>gb", function()
					gitsigns.blame_line({ full = true })
				end, { desc = "Blame Line" })

				-- Blame buffer
				map("n", "<leader>gB", gitsigns.blame, { desc = "Blame Buffer" })

				-- Diff this
				map("n", "<leader>gd", gitsigns.diffthis, { desc = "Diff This" })

				-- Diff this ~
				map("n", "<leader>gD", function()
					gitsigns.diffthis("~")
				end, { desc = "Diff This ~" })

				-- Preview hunk inline
				map("n", "<leader>gp", gitsigns.preview_hunk_inline, { desc = "Preview Hunk Inline" })

				-- Reset hunk
				map("n", "<leader>gr", gitsigns.reset_hunk, { desc = "Reset Hunk" })
				map("v", "<leader>gr", function()
					gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "Reset Hunk" })

				-- Reset buffer
				map("n", "<leader>gR", gitsigns.reset_buffer, { desc = "Reset Buffer" })

				-- Stage hunk
				map("n", "<leader>gs", gitsigns.stage_hunk, { desc = "Stage Hunk" })
				map("v", "<leader>gs", function()
					gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "Stage Hunk" })

				-- Stage buffer
				map("n", "<leader>gS", gitsigns.stage_buffer, { desc = "Stage Buffer" })

				-- Undo stage hunk
				map("n", "<leader>gu", gitsigns.undo_stage_hunk, { desc = "Undo Stage Hunk" })

				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Select Git Hunk" })
			end,
		})
	end,
}

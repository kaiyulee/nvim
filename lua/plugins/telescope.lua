return {
	"nvim-telescope/telescope.nvim",
	version = "0.2.*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<C-q>"] = actions.send_selected_to_qflist,
					},
				},
			},
			pickers = {
				oldfiles = {
					cwd_only = true,
				},
			},
		})

		telescope.load_extension("fzf")
	-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", {
			desc = "Fuzzy find files in cwd",
		})
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", {
			desc = "Fuzzy find recent files",
		})
		keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", {
			desc = "Find string in cwd",
		})
		keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", {
			desc = "Find string under cursor in cwd",
		})
		keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", {
			desc = "Find todos",
		})

		keymap.set("n", "<leader>fs", "<cmd>Telescope treesitter<cr>", {
			desc = "Find symbols",
		})

	end,
}

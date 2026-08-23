return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	-- must load after catppuccin for theme integration
	after = "catppuccin",
	config = function()
		-- Switch buffers with Tab key in bufferline
		vim.api.nvim_set_keymap("n", "<Tab>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
		require("bufferline").setup({
			highlights = require("catppuccin.special.bufferline").get_theme(),
			options = {
				indicator = {
					icon = "",
					style = "underline",
				},
				buffer_close_icon = "",
			},
		})
	end,
}

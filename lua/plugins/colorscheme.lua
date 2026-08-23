return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				integrations = {
					snacks = { enabled = true }, -- disabled by default
					nvim_surround = true, -- disabled by default
				},
			})
			-- Read the OS appearance synchronously before the first colorscheme so the
			-- first frame is the correct flavor (avoids a dark->light flash).
			if vim.fn.has("macunix") == 1 then
				local mode = vim.fn.system({ "defaults", "read", "-g", "AppleInterfaceStyle" })
				vim.o.background = mode:match("Dark") and "dark" or "light"
			end
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		"f-person/auto-dark-mode.nvim",
		config = function()
			require("auto-dark-mode").setup({
				update_interval = 3000,
				fallback = "dark",
				set_dark_mode = function()
					vim.o.background = "dark"
					vim.cmd.colorscheme("catppuccin")
				end,
				set_light_mode = function()
					vim.o.background = "light"
					vim.cmd.colorscheme("catppuccin")
				end,
			})
		end,
	},
}

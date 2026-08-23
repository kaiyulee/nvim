return {
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

		-- Auto dark/light mode on macOS with polling fallback for better Warp compatibility
		if vim.fn.has("macunix") == 1 then
			local function set_bg()
				local mode = vim.fn.system({ "defaults", "read", "-g", "AppleInterfaceStyle" }):gsub("%s+", "")
				vim.o.background = mode == "Dark" and "dark" or "light"
			end

			-- Check on FocusGained event
			vim.api.nvim_create_autocmd("FocusGained", { callback = set_bg })

			-- Add a timer-based polling as fallback (checks every 2 seconds)
			-- This helps with terminal emulators like Warp that don't immediately trigger FocusGained
			local timer = nil
			local last_mode = nil

			local function poll_theme()
				local mode = vim.fn.system({ "defaults", "read", "-g", "AppleInterfaceStyle" }):gsub("%s+", "")
				if mode ~= last_mode then
					last_mode = mode
					vim.o.background = mode == "Dark" and "dark" or "light"
				end
			end

			-- Start timer on VimEnter to begin polling
			vim.api.nvim_create_autocmd("VimEnter", {
				callback = function()
					poll_theme()
					if timer == nil then
						timer = vim.loop.new_timer()
						timer:start(2000, 2000, vim.schedule_wrap(poll_theme))
					end
				end,
			})

			-- Cleanup timer on exit
			vim.api.nvim_create_autocmd("VimLeavePre", {
				callback = function()
					if timer then
						timer:stop()
						timer:close()
					end
				end,
			})
		end
		vim.cmd.colorscheme("catppuccin-nvim")
	end,
}

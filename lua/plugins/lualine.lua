return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count

		local colors = {
			blue = "#65D1FF",
			green = "#3EFFDC",
			violet = "#FF61EF",
			yellow = "#FFDA7B",
			red = "#FF4A4A",
			fg = "#c3ccdc",
			bg = "#112638",
			inactive_bg = "#2c3043",
		}

		local function upper_encoding()
			local enc = vim.bo.fenc or vim.bo.enc or "UTF-8"
			return enc:upper()
		end

		-- configure lualine with modified theme
		lualine.setup({
			options = {
				theme = "catppuccin",
			},
			sections = {
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = {
							--[[ fg = "#ff9e64", ]]
						},
					},
					{ upper_encoding },
					{ "fileformat" },
					{
						"filetype",
						colored = true,
						icon_only = true,
						icon = { align = "right" },
					},
				},
			},
		})
	end,
}

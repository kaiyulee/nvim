return {
"mason-org/mason.nvim",
	cmd = "Mason",
	keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
	opts = {
		ensure_installed = {
			"prettier",
			"stylua",
			"black",
			"isort",
			"eslint_d",
			"pylint",
		},
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
	},
}

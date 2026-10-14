return {
	{
		"mason-org/mason.nvim",
		opts = {},
	},

	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"lua_ls",
				"clangd",
				"basedpyright",
				"ts_ls",
				"html",
				"cssls",
				"jsonls",
				"yamlls",
				"bashls",
				"bshls",
				"cssls",
				"html-lsp",
				"json-lsp",
				"marksman",
				"ruff",
				"stylua",
				"taplo",
				"yamlls",
			},
		},

		{
			"neovim/nvim-lspconfig",
			dependencies = { "saghen/blink.cmp" },
			event = { "BufReadPre", "BufNewFile" },
			config = function()
				require("utils.diagnostics").setup()
				require("servers")
			end,
		},
	},
}

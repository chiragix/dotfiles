return {
	"folke/trouble.nvim",
	cmd = "Trouble",
	lazy = true,

	opts = {},

	keys = {
		{
			"<leader>xX",
			"<cmd>Trouble diagnostics toggle<CR>",
			desc = "Workspace Diagnostics",
		},
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
			desc = "Buffer Diagnostics",
		},
		{
			"<leader>cs",
			"<cmd>Trouble symbols toggle focus=false<CR>",
			desc = "Document Symbols",
		},
		{
			"<leader>cl",
			"<cmd>Trouble lsp toggle focus=false win.position=right<CR>",
			desc = "LSP References / Definitions",
		},
		{
			"<leader>xl",
			"<cmd>Trouble loclist toggle<CR>",
			desc = "Location List",
		},
		{
			"<leader>xq",
			"<cmd>Trouble qflist toggle<CR>",
			desc = "Quickfix List",
		},
	},
}

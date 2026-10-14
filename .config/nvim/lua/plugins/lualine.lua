return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	opts = {
		options = {
			theme = "auto",
			icons_enabled = true,
			section_separators = { left = "", right = "" },
			component_separators = "|",
		},
	},
	dependencies = { "nvim-tree/nvim-web-devicons" },
}

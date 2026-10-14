return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format({ async = true })
			end,
			mode = { "n", "x" },
			desc = "Format Buffer",
		},
		{
			"<leader>cF",
			function()
				require("conform").format({ formatters = { "injected" }, timeout_ms = 3000 })
			end,
			mode = { "n", "x" },
			desc = "Format Injected Langs",
		},
	},
	---@module "conform"
	---@type conform.setupOpts
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			c = { "clang_format" },
			cpp = { "clang_format" },
			python = { "ruff_fix", "ruff_format" },

			javascript = { "biome" },
			javascriptreact = { "biome" }, -- JSX
			typescript = { "biome" },
			typescriptreact = { "biome" }, -- TSX
			css = { "biome" },
			html = { "prettierd" },
			json = { "biome" },
			jsonc = { "biome" },

			bash = { "shfmt" },
			sh = { "shfmt" },

			yaml = { "prettierd" },
			toml = { "taplo" },
			markdown = { "prettierd", "injected" },
		},

		formatters = {
			injected = {
				options = {
					ignore_errors = true,
				},
			},
		},

		default_format_opts = {
			lsp_format = "fallback",
		},

		format_on_save = { timeout_ms = 3000 },
	},
}

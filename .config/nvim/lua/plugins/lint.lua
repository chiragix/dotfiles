return {
	"mfussenegger/nvim-lint",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			bash = { "shellcheck" },
			c = { "clangd" },
			cpp = { "clangd" },
			css = { "biomejs" },
			javascript = { "biomejs" },
			javascriptreact = { "biomejs" },
			json = { "biomejs" },
			lua = { "selene" },
			markdown = { "markdownlint" },
			python = { "ruff" },
			sh = { "shellcheck" },
			typescript = { "biomejs" },
			typescriptreact = { "biomejs" },
			yaml = { "yamllint" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})
	end,

	keys = {
		{
			"<leader>l",
			function()
				require("lint").try_lint()
			end,
			desc = "Lint current file",
		},
	},
}

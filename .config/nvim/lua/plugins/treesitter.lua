return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		local treesitter = require("nvim-treesitter")
		treesitter.setup({})
		local ensure_installed = {
			"bash",
			"c",
			"cpp",
			"css",
			"diff",
			"dockerfile",
			"gitcommit",
			"html",
			"javascript",
			"json",
			"lua",
			"make",
			"markdown",
			"markdown_inline",
			"python",
			"query",
			"regex",
			"toml",
			"tsx",
			"typescript",
			"vim",
			"vimdoc",
			"yaml",
		}
		treesitter.install(ensure_installed)
		local group = vim.api.nvim_create_augroup("TreeSitterConfig", {
			clear = true,
		})
		vim.api.nvim_create_autocmd("FileType", {
			group = group,
			callback = function(args)
				local lang = vim.treesitter.language.get_lang(args.match)
				if lang and vim.list_contains(treesitter.get_installed(), lang) then
					vim.treesitter.start(args.buf, lang)
				end
			end,
		})
	end,
}

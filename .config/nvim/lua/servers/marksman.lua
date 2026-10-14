--- @param capabilities table LSP client capabilities (typically from nvim-cmp or similar)
--- @return nil
return function(capabilities)
	vim.lsp.config('marksman', {
		capabilities = capabilities,
		filetypes = { "markdown", "markdown_inline" },
	})
end

local M = {}

M.on_attach = function(event)
	if not event.data then
		return
	end

	local ok, client = pcall(vim.lsp.get_client_by_id, event.data.client_id)

	if not ok or not client then
		return
	end
	local bufnr = event.buf
	local keymap = vim.keymap.set

	local opts = {
		silent = true, -- don't print the command to the cli
		buffer = bufnr, -- restrict the keymap to the local buffer number
	}

	keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
	keymap("n", "gD", "<cmd>Lspsaga goto_definition<CR>", opts)
	keymap("n", "gS", "<cmd>vsplit | Lspsaga goto_definition<CR>", opts)
	keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
	keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
	keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
	keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
	keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
	keymap("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
	keymap("n", "<leader>dd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)

	-- FzfLua
	keymap("n", "<leader>fd", "<cmd>FzfLua lsp_finder<CR>", opts)
	keymap("n", "<leader>fr", "<cmd>FzfLua lsp_references<CR>", opts)
	keymap("n", "<leader>fi", "<cmd>FzfLua lsp_implementations<CR>", opts)
	keymap("n", "<leader>ft", "<cmd>FzfLua lsp_typedefs<CR>", opts)
	keymap("n", "<leader>fs", "<cmd>FzfLua lsp_document_symbols<CR>", opts)
	keymap("n", "<leader>fw", "<cmd>FzfLua lsp_workspace_symbols<CR>", opts)

	-- Order Imports (if supported by the client LSP)
	if client:supports_method("textDocument/codeAction", bufnr) then
		keymap("n", "<leader>oi", function()
			vim.lsp.buf.code_action({
				context = {
					only = { "source.organizeImports" },
					diagnostics = {},
				},
				apply = true,
				bufnr = bufnr,
			})
			-- format after changing import order
			vim.defer_fn(function()
				vim.lsp.buf.format({ bufnr = bufnr })
			end, 50) -- slight delay to allow for the import order to go first
		end, opts)
	end
end

return M

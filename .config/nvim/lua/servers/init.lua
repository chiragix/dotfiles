local capabilities = require("blink.cmp").get_lsp_capabilities()

-- Language Server Protocol (LSP)
require("servers.basedpyright")(capabilities)
require("servers.bashls")(capabilities)
require("servers.clangd")(capabilities)
require("servers.cssls")(capabilities)
require("servers.html")(capabilities)
require("servers.jsonls")(capabilities)
require("servers.lua_ls")(capabilities)
require("servers.marksman")(capabilities)
require("servers.taplo")(capabilities)
require("servers.ts_ls")(capabilities)
require("servers.yamlls")(capabilities)

-- Linters & Formatters
vim.lsp.enable({
	"basedpyright",
	"bashls",
	"clangd",
	"cssls",
	"html",
	"jsonls",
	"lua_ls",
	"marksman",
	"taplo",
	"ts_ls",
	"yamlls",
})

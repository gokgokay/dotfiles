local M = {}

M.ensure_installed = {
	"pyright", -- python lsp
	"black", -- python formatter
	"ruff", -- python linter
	"debugpy", -- python debugger
	"lua_ls", -- lua lsp
	"stylua", -- lua formatter
	"shfmt", -- shell formatter
	"bashls", -- bash lsp
	"jsonls", -- json lsp
	"html", -- html lsp
	"cssls", -- css lsp
	"prettier", -- js/ts/html/css formatter
}

return M

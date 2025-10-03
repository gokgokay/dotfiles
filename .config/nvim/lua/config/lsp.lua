local M = {}

M.ensure_installed = {
	"pyright", -- python lsp
	"black", -- python formatter
	"ruff", -- python linter
	"debugpy", -- python debugger
	"isort", -- python import sorter
	"lua_ls", -- lua lsp
	"stylua", -- lua formatter
	"shfmt", -- shell formatter
	"bashls", -- bash lsp
	"jsonls", -- json lsp
	"html", -- html lsp
	"cssls", -- css lsp
	"prettier", -- js/ts/html/css formatter
}

M.servers = {
	-- python
	pyright = {
		settings = {
			python = {
				disableOrganizeImports = true,
				analysis = {
					autoSearchPaths = true,
					diagnosticMode = "openFilesOnly",
					typeCheckingMode = "standard",
					useLibraryCodeForTypes = true,
				},
			},
		},
	},

	-- lua
	lua_ls = {
		filetypes = { "lua" },
		settings = {
			Lua = {
				runtime = { version = "LuaJIT" },
				diagnostics = {
					globals = { "vim" },
				},
				telemetry = { enable = false },
			},
		},
	},
}

M.setup = function()
	local lspconfig = require("lspconfig")
	local capabilities = require("cmp_nvim_lsp").default_capabilities()

	for server_name, config in pairs(M.servers) do
		config.capabilities = capabilities
		lspconfig[server_name].setup(config)
	end
end

return M

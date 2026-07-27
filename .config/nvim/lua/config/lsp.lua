local M = {}

-- Diagnostics display
vim.diagnostic.config({
	virtual_lines = {
		current_line = true,
	},
	update_in_insert = false,
})

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
	bashls = {},
	jsonls = {},
	html = {},
	cssls = {},
}

M.setup = function()
	local capabilities = require("cmp_nvim_lsp").default_capabilities()
	for server_name, config in pairs(M.servers) do
		config.capabilities = capabilities
		vim.lsp.config(server_name, config)
		vim.lsp.enable(server_name)
	end
end

return M

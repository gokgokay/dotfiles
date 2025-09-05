local M = {}

local servers = {
	-- python
	pyright = {
		filetypes = { "python" },
		settings = {
			disableOrganizeImports = true, -- using ruff's import organizer
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = "openFilesOnly",
				typeCheckingMode = "standard",
				useLibraryCodeForTypes = true,
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

	for server_name, config in pairs(servers) do
		config.capabilities = capabilities
		lspconfig[server_name].setup(config)
	end
end

return M

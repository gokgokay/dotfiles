local lsp_servers = {
	"lua_ls",
	"marksman",
	"yamlls",
	"bashls",
	"dockerls",
	"jsonls",
	"marksman",
	"cssls",
	"taplo",
	"ruff",
	"pyright",
	"html",
	"marksman",
	"rust_analyzer",
}

local lint_servers = {
	"ansible-lint",
	"eslint_d",
	"prettier",
	"fixjson",
	"jq",
	"ruff",
	"yamlfmt",
	"markdownlint",
	"stylua",
	"ast-grep",
}

return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = lsp_servers,
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = lint_servers,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local lspconfig = require("lspconfig")
			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "LSP actions",
				callback = function(event)
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					local builtin = require("fzf-lua")
					local nmap = function(mode, keys, func, desc)
						vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = desc })
					end

					nmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover documentation")
					nmap("n", "gd", builtin.lsp_definitions, "Go to definition")
					nmap("n", "gD", "<cmd>lua vim.lsp.buf.declaration() <cr>", "Go to declaration")
					nmap("n", "gi", builtin.lsp_implementations, "Go to implementation")
					nmap("n", "go", builtin.lsp_typedefs, "Go to definition")
					nmap("n", "gr", builtin.lsp_references, "Go to references")
					-- nmap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Documentation")
					nmap("n", "gR", "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename symbole")
					nmap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code action")
					nmap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Previous diagnostic")
					nmap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next diagnostic")
					if client ~= nil and client.name == "ruff" then -- Disable hover in favor of Pyright
						client.server_capabilities.hoverProvider = false
					end
				end,
			})
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			for _, lsp in pairs(lsp_servers) do
				lspconfig[lsp].setup({
					capabilites = capabilities,
				})
			end
			lspconfig.pyright.setup({
				capabilities = capabilities,
				settings = {
					pyright = {
						disableOrganizeImports = true, -- using Ruff
					},
					python = {
						analaysis = {
							autoSearchPaths = true,
							diagnosticMode = "openFilesOnly",
							useLibraryCodeForTypes = true,
							typeCheckingMode = "off",
						},
						ignore = { "*" },
					},
				},
			})

			lspconfig.yamlls.setup({
				settings = {
					yamll = {
						schmeas = {
							["http://json.schemastore.org/github-workflow.json"] = ".github/workflows/*.{yml,yaml}",
							["http://json.schemastore.org/github-action.json"] = ".github/action.{yml,yaml}",
							["http://json.schemastore.org/ansible-stable-2.9.json"] = "roles/tasks/*.{yml,yaml}",
							["http://json.schemastore.org/ansible-playbook.json"] = "playbook.{yml,yaml}",
							["https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/inventory.json"] = "inventoy.{yml.yaml}",
							["http://json.schemastore.org/gitlab-ci.json"] = "/*lab-ci.{yml,yaml}",
							["https://json.schemastore.org/databricks-asset-bundles.json"] = ".databricks.{yml,yaml}",
						},
					},
				},
			})

			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						runtime = {
							-- Tell the language server which version of Lua you're using
							-- (most likely LuaJIT in the case of Neovim)
							version = "LuaJIT",
						},
						diagnostics = {
							-- Get the language server to recognize the `vim` global
							globals = {
								"vim",
								"require",
							},
						},
						workspace = {
							-- Make the server aware of Neovim runtime files
							library = vim.api.nvim_get_runtime_file("", true),
						},
					},
				},
			})

			vim.diagnostic.config({
				virtual_text = false,
				signs = true,
				underline = true,
				severity_sort = false,
				float = true,
			})
		end,
	},

	{
		"kosayoda/nvim-lightbulb",
		config = function()
			require("nvim-lightbulb").setup({
				autocmd = { enabled = true },
			})
		end,
	},
}

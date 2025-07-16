return {
	-- Debugging
	{
		"mfussenegger/nvim-dap",
		lazy = true,
		keys = {

			{
				"<leader>db",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "Toggle Breakpoint",
			},
			{
				"<leader>db",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "Toggle Breakpoint",
			},

			{
				"<leader>dc",
				function()
					require("dap").continue()
				end,
				desc = "Continue",
			},
			{
				"<leader>di",
				function()
					require("dap").step_into()
				end,
				desc = "Step Into",
			},
			{
				"<leader>dO",
				function()
					require("dap").step_over()
				end,
				desc = "Step Over",
			},
			{
				"<leader>do",
				function()
					require("dap").step_out()
				end,
				desc = "Step Out",
			},
			{
				"<leader>dt",
				function()
					require("dap").terminate()
				end,
				desc = "Terminate",
			},
		},
	},

	-- Mason integration for DAP adapters
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = {
			"mfussenegger/nvim-dap",
			"williamboman/mason.nvim",
		},
		opts = {
			ensure_installed = {
				"bash",
				"python",
			},
		},
	},

	-- UI for debugging
	{
		"rcarriga/nvim-dap-ui",
		after = "nvim-dap",
		dependencies = {
			"nvim-neotest/nvim-nio",
		},
		opts = function()
			local dap = require("dap")
			local dapui = require("dapui")

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			return {
				layouts = {
					{
						position = "left",
						size = 35,
						elements = {
							{ id = "scopes", size = 0.5 },
							{ id = "breakpoints", size = 0.5 },
						},
					},
					{
						elements = {
							{ id = "repl", size = 1.0 },
						},
						size = 10,
						position = "bottom",
					},
				},
			}
		end,

		config = function(_, opts)
			require("dapui").setup(opts)
		end,
	},

	-- Shows inline debug info (virtual text)
	{
		"theHamsta/nvim-dap-virtual-text",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
		opts = {
			enabled = true,
			virt_text_pos = "eol",
			highlight_changed_variables = true,
		},
	},
}

return {
	-- Debugging
	{
		"mfussenegger/nvim-dap",
		lazy = "VeryLazy",
		keys = {
			{ "<leader>db", require("dap").toggle_breakpoint, desc = "Toggle Breakpoint" },
			{ "<leader>dc", require("dap").continue, desc = "Continue" },
			{ "<leader>di", require("dap").step_into, desc = "Step Into" },
			{ "<leader>do", require("dap").step_out, desc = "Step Out" },
			{ "<leader>dO", require("dap").step_over, desc = "Step Over" },
			{ "<leader>dt", require("dap").terminate, desc = "Terminate" },
		},
	},

	-- Mason integration for dap adapters
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = {
			"mfussenegger/nvim-dap",
			"williamboman/mason.nvim",
		},
		opts = require("config.mason"),
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

	-- Shows inline debug info as virtual text
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

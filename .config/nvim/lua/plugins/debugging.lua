return {
	-- Debugging
	{
		"mfussenegger/nvim-dap",
		lazy = "VeryLazy",
		keys = {
			{
				"<leader>db",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "Toggle breakpoint",
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
				desc = "Step into",
			},
			{
				"<leader>do",
				function()
					require("dap").step_out()
				end,
				desc = "Step out",
			},
			{
				"<leader>dn",
				function()
					require("dap").step_over()
				end,
				desc = "Step over",
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

	-- DAP Mason integration
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = {
			"mfussenegger/nvim-dap",
			"williamboman/mason.nvim",
		},
		opts = require("config.lsp"),
	},

	-- Dap UI
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
		config = function(_, opts)
			local dapui = require("dapui")
			dapui.setup(opts)

			-- open and close the windows automatically
			local dap = require("dap")
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},

	-- Virtual text for DAP
	{
		"theHamsta/nvim-dap-virtual-text",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
		opts = {
			virt_text_pos = "eol",
		},
	},
}

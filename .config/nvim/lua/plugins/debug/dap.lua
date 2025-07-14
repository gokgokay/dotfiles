return {
	{
		"mfussenegger/nvim-dap-python",
		ft = "python",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
		config = function()
			local dap = require("dap")

			local function get_python_path()
				local cwd = vim.fn.getcwd()
				local venv_python = cwd .. "/.venv/bin/python"
				if vim.fn.executable(venv_python) == 1 then
					return venv_python
				else
					return vim.fn.expand("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python3")
				end
			end

			dap.adapters.python = {
				type = "executable",
				command = get_python_path(),
				args = { "-m", "debugpy.adapter" },
			}

			dap.configurations.python = {
				{
					type = "python",
					request = "launch",
					name = "Launch file",
					program = "${file}",
					pythonPath = get_python_path,
				},
			}

			require("dap-python").setup(get_python_path())
		end,
	},
}

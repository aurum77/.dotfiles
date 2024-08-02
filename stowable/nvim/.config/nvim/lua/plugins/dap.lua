local dap = require("dap")
local dapui = require("dapui")

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticError" })
vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "DiagnosticWarning" })
vim.fn.sign_define("DapStopped", { text = "", texthl = "DiagnosticOk" })
vim.fn.sign_define("DapLogPoint", { text = "󱂅", texthl = "DiagnosticInfo" })
vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DiagnosticError" })

dap.adapters.coreclr = {
	type = "executable",
	command = vim.fn.stdpath("data") .. "/mason/bin/netcoredbg",
	args = { "--interpreter=vscode" },
}

dap.configurations.cs = {
	{
		type = "coreclr",
		name = "Debug .NET Project",
		request = "launch",
		cwd = function()
			return require("dotnet.globals").STARTING_PROJECT_DIR
		end,
		program = function()
			return require("dotnet.globals").DEBUG_PROJECT_DLL
		end,
		env = {
			ASPNETCORE_ENVIRONMENT = function()
				return "Development"
			end,
		},
	},
}

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

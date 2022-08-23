local status_ok, dap = pcall(require, "dap")

if not status_ok then
	return
end

vim.fn.sign_define(
	"DapBreakpoint",
	{ text = "", texthl = "debugBreakpoint", linehl = "debugBreakpoint", numhl = "debugBreakpoint" }
)
vim.fn.sign_define(
	"DapStopped",
	{ text = "", texthl = "debugPC", linehl = "debugPC", numhl = "debugPC" }
)

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

local data = vim.fn.stdpath("data")

dap.adapters = {
	codelldb = {
		type = "server",
		port = "${port}",
		executable = {
			command = data .. "/mason/packages/codelldb/extension/adapter/codelldb",
			args = { "--port", "${port}" },
		},
	},
	node2 = {
		type = "executable",
		command = "node",
		args = { data .. "/mason/packages/node-debug2-adapter/out/src/nodeDebug.js" },
	},
}

dap.configurations = {
	cpp = {
		{
			name = "Launch file",
			type = "codelldb",
			request = "launch",
			program = function()
				return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			end,
			cwd = "${workspaceFolder}",
			stopOnEntry = true,
		},
	},
	javascript = {
		{
			name = "Launch",
			type = "node2",
			request = "launch",
			program = "${file}",
			cwd = vim.fn.getcwd(),
			sourceMaps = true,
			protocol = "inspector",
			console = "integratedTerminal",
		},
		{
			-- For this to work you need to make sure the node process is started with the `--inspect` flag.
			name = "Attach to process",
			type = "node2",
			request = "attach",
			processId = require("dap.utils").pick_process,
		},
	},
}
dap.configurations.c = dap.configurations.cpp

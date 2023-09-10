local status_ok, nvim_web_devicons = pcall(require, "nvim-web-devicons")

if not status_ok then
	return
end
nvim_web_devicons.set_icon({
	http = {
		icon = "󰖟",
		color = "#569cd6",
		name = "HTTP",
	},
	httpResult = {
		icon = "󰖟",
		color = "#569cd6",
		name = "HTTP_Result",
	},
	dapui_scopes = {
		icon = "",
		color = "#569cd6",
		name = "DAP_Scopes",
	},
	dapui_breakpoints = {
		icon = "",
		color = "#569cd6",
		name = "DAP_Breakpoints",
	},
	dapui_stacks = {
		icon = "",
		color = "#569cd6",
		name = "DAP_Stacks",
	},
	go = {
		icon = "",
		color = "#2596be",
		name = "go",
	},
	dapui_watches = {
		icon = "",
		color = "#569cd6",
		name = "DAP_Watches",
	},
	["spec.js"] = {
		icon = "ﭧ",
		color = "#cbcb41",
		cterm_color = 180,
		name = "JsSpec",
	},
	["test.js"] = {
		icon = "ﭧ",
		color = "#cbcb41",
		cterm_color = 180,
		name = "JsTest",
	},
	["tsx"] = {
		icon = "",
		color = "#519aba",
		cterm_color = "74",
		name = "Tsx",
	},
	["test.tsx"] = {
		icon = "",
		color = "#519aba",
		cterm_color = "74",
		name = "TypeScriptReactTest",
	},
	["spec.tsx"] = {
		icon = "",
		color = "#519aba",
		cterm_color = "74",
		name = "TypeScriptReactSpec",
	},
	["csproj"] = {
		icon = "",
		color = "#854CC7",
		cterm_color = "98",
		name = "Csproj",
	},
})

nvim_web_devicons.setup({})

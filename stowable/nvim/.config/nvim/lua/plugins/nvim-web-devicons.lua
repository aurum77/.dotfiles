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
	go = {
		icon = "",
		color = "#2596be",
		name = "go",
	},
	js = {
		icon = "",
		color = "#F1F134",
		name = "Javascript",
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
})

nvim_web_devicons.setup({})

local status_ok, rest = pcall(require, "rest-nvim")

if not status_ok then
	return
end

rest.setup({
	result_split_horizontal = false,
	result_split_in_place = true,
	skip_ssl_verification = true,
	-- Highlight request on run
	highlight = {
		enabled = true,
		timeout = 100,
	},
	result = {
		show_url = true,
		show_http_info = true,
		show_headers = true,
		formatters = {
			json = "jq",
			html = function(body)
				return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
			end,
		},
	},
	jump_to_request = false,
	env_file = ".env",
	custom_dynamic_variables = {},
	yank_dry_run = true,
})

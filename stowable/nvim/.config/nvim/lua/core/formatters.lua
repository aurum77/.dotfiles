local M = {}

local util = require("formatter.util")

function M.csharpier()
	return {
		exe = "$HOME/.local/share/nvim/mason/bin/dotnet-csharpier",
		args = {
			"--write-stdout",
			util.escape_path(util.get_current_buffer_file_path()),
		},
		stdin = true,
	}
end

return M

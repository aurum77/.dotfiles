local M = {}

function M.csharpier()
	return {
		exe = "$HOME/.local/share/nvim/mason/bin/dotnet-csharpier",
		stdin = true,
	}
end

return M

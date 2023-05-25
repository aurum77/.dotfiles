local status_ok, project_nvim = pcall(require, "project_nvim")

if not status_ok then
	return
end

project_nvim.setup({
	patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "*.sln", ".luarc.json" },
	silent_chdir = false,
	ignore_lsp = { "jsonls" },
})

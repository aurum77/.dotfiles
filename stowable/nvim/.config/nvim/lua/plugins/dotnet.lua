local status_ok, dotnet = pcall(require, "dotnet")

if not status_ok then
	return
end

dotnet.setup({})

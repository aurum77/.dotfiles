local status_ok, dotnet = pcall(require, "dotnet")

if not status_ok then
	return
end

print("ran dotnet setup")

dotnet.setup({})

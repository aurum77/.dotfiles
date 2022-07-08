local status_ok, nvim_lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

nvim_lsp_installer.setup {}

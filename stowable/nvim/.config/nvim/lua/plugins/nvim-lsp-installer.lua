local status_ok, nvim_lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

nvim_lsp_installer.setup {
  ensure_installed = {
    "sumneko_lua",
    "tsserver",
    "jedi_language_server",
    "emmet_ls",
    "cssls",
    "html",
  },
  automatic_installation = false,
  ui = {
    border = "single",
    icons = {
      server_installed = "✓",
      server_pending = "o",
      server_uninstalled = "✗"
    }
  },
}

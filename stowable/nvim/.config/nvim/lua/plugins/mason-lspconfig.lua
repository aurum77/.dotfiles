local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")

if not status_ok then
  return
end

mason_lspconfig.setup {
  ensure_installed = {
    "html-lsp",
    "css-lsp",
    "emmet-ls",
    "typescript-language-server",
    "lua-language-server",
    "jedi-language-server",
    "clangd",
    "json-lsp"
  },
  automatic_installation = false,
}

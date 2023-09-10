local util = require 'lspconfig.util'

local default_capabilities = vim.lsp.protocol.make_client_capabilities()
default_capabilities.textDocument.semanticTokens = vim.NIL
default_capabilities.workspace.semanticTokens = vim.NIL

return {
  default_config = {
    filetypes = { 'arduino' },
    root_dir = util.root_pattern '*.ino',
    cmd = {
      '~/.local/share/nvim/mason/packages/arduino-language-server/arduino-language-server',
      '-cli-config'
    },
    capabilities = default_capabilities,
  },
}

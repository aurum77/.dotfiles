local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup {
  ensure_installed = { "javascript", "lua" },
  highlight = {
    enable = true,
    disable = {},
  },
}

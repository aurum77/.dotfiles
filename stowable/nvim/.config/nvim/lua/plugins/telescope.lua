local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local action = require("telescope.actions")

telescope.setup {
  defaults = {
    file_ignore_patterns = {
      "node_modules"
    },
  }
}

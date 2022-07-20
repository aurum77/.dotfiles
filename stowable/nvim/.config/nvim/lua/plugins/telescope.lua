local status_ok, telescope = pcall(require, "telescope")

if not status_ok then
  return
end

local borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" }

telescope.setup {
  defaults = {
    file_ignore_patterns = {
      "node_modules"
    },
    border = true,
    borderchars = borderchars,
    selection_caret = " > ",
    prompt_prefix = " > ",
    layout_config = {
      horizontal = { prompt_position = "bottom", results_width = 0.6 },
    },
  },
}

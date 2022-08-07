local status_ok, telescope = pcall(require, "telescope")

if not status_ok then
  return
end

telescope.setup {
  defaults = {
    file_ignore_patterns = {
      "node_modules"
    },
    border = false,
    selection_caret = " > ",
    prompt_prefix = " > ",
    layout_config = {
      horizontal = { prompt_position = "bottom", results_width = 0.6 },
    },
  },
}

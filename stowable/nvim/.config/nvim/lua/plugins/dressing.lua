local status_ok, dressing = pcall(require, "dressing")

if not status_ok then
	return
end

local telescope_borderchars = {
	" ",
	" ",
	" ",
	" ",
	" ",
	" ",
	" ",
	" ",
}

dressing.setup({
	input = {
		enabled = true,
    border = "solid",
    relative = "editor",
    win_options = {
      winblend = 0,
      wrap = false,
    },
	},
  select = {
    telescope = require('telescope.themes').get_dropdown({
      border = true,
      borderchars = telescope_borderchars,
    })
  }
})

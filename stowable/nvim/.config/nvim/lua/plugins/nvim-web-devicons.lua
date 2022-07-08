local status_ok, nvim_web_devicons = pcall(require, "nvim-web-devicons")
if not status_ok then
  return
end

local colors = require("gruvbox-baby.colors").config()

nvim_web_devicons.setup {
  override = {
    sh = {
      icon = "",
      color = colors.soft_green,
      cterm_color = "59",
      name = "Sh",
    },
  },
  default = true
}

local status_ok, dapui = pcall(require, "dapui")

if not status_ok then
	return
end

dapui.setup({
  layouts = {
    {
      elements = {
      -- Elements can be strings or table with id and size keys.
        { id = "scopes", size = 0.25 },
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 40, -- 40 columns
      position = "left",
    },
    {
      elements = {
        "console",
      },
      size = 0.25, -- 25% of total lines
      position = "bottom",
    },
  },
})

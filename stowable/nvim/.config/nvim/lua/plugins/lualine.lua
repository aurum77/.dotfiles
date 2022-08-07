local status_ok, lualine = pcall(require, "lualine")

if not status_ok then
  return
end

local colors = {
  bg0_h  = "#1D2021",
  bg0    = "#282828",
  bg1    = "#3C3836",
  bg2    = "#504945",
  fg     = "#EBDBB2",
  yellow = "#D79921",
  blue   = "#458588",
  aqua   = "#689D6A",
  gray   = "#A89984",
  orange = "#D65D0E",
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 100
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

local lsp = { function()
  local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
  local clients = vim.lsp.get_active_clients()
  if next(clients) == nil then
    return ''
  end
  for _, client in ipairs(clients) do
    local filetypes = client.config.filetypes
    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
      return client.name
    end
  end
  return ''
end,
  icon = 'LSP:',
  cond = conditions.hide_in_width,
}

local mode = {
  "mode",
}
local filesize = {
  'filesize',
  fmt = string.upper,
}

local filetype = {
  "filetype",
  icon_only = true,
  colored = false
}

local filename = {
  "filename",
  path = 1,
  symbols = {
    modified = ' ',
    readonly = ' ',
  },
  cond = conditions.buffer_not_empty,
}

local diff = {
  "diff",
  symbols = { added = " ", modified = " ", removed = " " },
  cond = conditions.hide_in_width,
}

local diagnostics = {
  "diagnostics",
  update_in_insert = true,
  symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
}

local encoding = {
  "encoding",
  fmt = string.upper,
  cond = conditions.hide_in_width
}

local fileformat = {
  "fileformat",
  icons_enabled = false,
  fmt = string.upper
}

local branch = {
  'branch',
  icon = '',
}

lualine.setup {
  options = {
    globalstatus = true,
    icons_enabled = true,
    component_separators = '',
    section_separators = '',
    theme = {
      normal = {
        a = { bg = colors.bg1, fg = colors.fg },
        b = { bg = colors.bg2, fg = colors.fg, gui = 'bold' },
        c = { bg = colors.bg2, fg = colors.fg, gui = 'bold' },
        z = { bg = colors.bg1, fg = colors.fg },
      },
      insert = {
        a = { bg = colors.bg1, fg = colors.fg },
        b = { bg = colors.blue, fg = colors.bg0_h, gui = 'bold' },
        c = { bg = colors.blue, fg = colors.bg0_h, gui = 'bold' },
        z = { bg = colors.bg1, fg = colors.fg },
      },
      visual = {
        a = { bg = colors.bg1, fg = colors.fg },
        b = { bg = colors.orange, fg = colors.bg0_h, gui = 'bold' },
        c = { bg = colors.orange, fg = colors.bg0_h, gui = 'bold' },
        z = { bg = colors.bg1, fg = colors.fg },
      },
      command = {
        a = { bg = colors.bg1, fg = colors.fg },
        b = { bg = colors.aqua, fg = colors.bg0_h, gui = 'bold' },
        c = { bg = colors.aqua, fg = colors.bg0_h, gui = 'bold' },
        z = { bg = colors.bg1, fg = colors.fg },
      },
    },
    -- visual => orange
    -- insert = blue
    -- normal gray
    -- theme = "gruvbox"
  },

  sections = {
    lualine_a = { diagnostics },
    lualine_b = { mode, filesize, lsp },
    lualine_c = { "%=", filetype, filename },
    lualine_x = { "progress" },
    lualine_y = { encoding, fileformat, branch },
    lualine_z = { diff },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  extensions = { "nvim-tree", "toggleterm" },
}

-- Eviine config for lualine
-- Author: shadmansaleh
-- Credit: glepnir

-- Color table for highlights
-- stylua: ignore
-- local colors = {
--   bg         = '#1D2021',
--   fg         = '#EBDBB2',
--   yellow     = '#FABD2F',
--   aqua       = '#8EC07C',
--   darkblue   = '#458588',
--   blue       = '#83A598',
--   green      = '#B8BB26',
--   orange     = '#FE8019',
--   darkpurple = '#B16286',
--   purple     = '#D3869B',
--   red        = '#FB4934',
-- }
--
-- local conditions = {
--   buffer_not_empty = function()
--     return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
--   end,
--   hide_in_width = function()
--     return vim.fn.winwidth(0) > 80
--   end,
--   check_git_workspace = function()
--     local filepath = vim.fn.expand('%:p:h')
--     local gitdir = vim.fn.finddir('.git', filepath .. ';')
--     return gitdir and #gitdir > 0 and #gitdir < #filepath
--   end,
-- }
--
-- -- Config
-- local config = {
--   options = {
--     globalstatus = true,
--     -- Disable sections and component separators
--     component_separators = '',
--     section_separators = '',
--     theme = {
--       -- We are going to use lualine_c an lualine_x as left and
--       -- right section. Both are highlighted by c theme .  So we
--       -- are just setting default looks o statusline
--       normal = { c = { fg = colors.fg, bg = colors.bg } },
--       inactive = { c = { fg = colors.fg, bg = colors.bg } },
--     },
--   },
--   sections = {
--     -- these are to remove the defaults
--     lualine_a = {},
--     lualine_b = {},
--     lualine_y = {},
--     lualine_z = {},
--     -- These will be filled later
--     lualine_c = {},
--     lualine_x = {},
--   },
--   inactive_sections = {
--     -- these are to remove the defaults
--     lualine_a = {},
--     lualine_b = {},
--     lualine_y = {},
--     lualine_z = {},
--     lualine_c = {},
--     lualine_x = {},
--   },
-- }
--
-- -- Inserts a component in lualine_c at left section
-- local function ins_left(component)
--   table.insert(config.sections.lualine_c, component)
-- end
--
-- -- Inserts a component in lualine_x ot right section
-- local function ins_right(component)
--   table.insert(config.sections.lualine_x, component)
-- end
--
-- ins_left {
--   function()
--     return '▊'
--   end,
--   color = { fg = colors.blue }, -- Sets highlighting of component
--   padding = { left = 0, right = 1 }, -- We don't need space before this
-- }
--
-- ins_left {
--   -- mode component
--   function()
--     return 'ﱣ'
--   end,
--   color = function()
--     -- auto change color according to neovims mode
--     local mode_color = {
--       n = colors.red,
--       i = colors.green,
--       v = colors.blue,
--       [''] = colors.blue,
--       V = colors.blue,
--       c = colors.darkpurple,
--       no = colors.red,
--       s = colors.orange,
--       S = colors.orange,
--       [''] = colors.orange,
--       ic = colors.yellow,
--       R = colors.purple,
--       Rv = colors.purple,
--       cv = colors.red,
--       ce = colors.red,
--       r = colors.aqua,
--       rm = colors.aqua,
--       ['r?'] = colors.aqua,
--       ['!'] = colors.red,
--       t = colors.red,
--     }
--     return { fg = mode_color[vim.fn.mode()] }
--   end,
--   padding = { right = 1 },
-- }
--
-- ins_left {
--   -- filesize component
-- }
--
-- ins_left {
--   'filename',
--   path = 1,
--   symbols = {
--     modified = ' ',
--     readonly = ' ',
--   },
--   cond = conditions.buffer_not_empty,
--   color = { fg = colors.darkpurple, gui = 'bold' },
-- }
--
-- ins_left { 'location' }
--
-- ins_left { 'progress', color = { fg = colors.fg, gui = 'bold' } }
--
-- ins_left {
--   'diagnostics',
--   sources = { 'nvim_diagnostic' },
--   symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
--   diagnostics_color = {
--     color_error = { fg = colors.red },
--     color_warn = { fg = colors.yellow },
--     color_info = { fg = colors.aqua },
--     color_hint = { fg = colors.fg },
--   },
-- }
--
-- -- Insert mid section. You can make any number of sections in neovim :)
-- -- for lualine it's any number greater then 2
-- ins_left {
--   function()
--     return '%='
--   end,
-- }
--
-- ins_left {
--   -- Lsp server name .
--   function()
--     local msg = 'No Active Lsp'
--     local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
--     local clients = vim.lsp.get_active_clients()
--     if next(clients) == nil then
--       return msg
--     end
--     for _, client in ipairs(clients) do
--       local filetypes = client.config.filetypes
--       if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
--         return client.name
--       end
--     end
--     return msg
--   end,
--   icon = ' LSP:',
--   color = { fg = colors.fg, gui = 'bold' },
-- }
--
-- -- Add components to right sections
-- ins_right {
--   'o:encoding', -- option component same as &encoding in viml
--   fmt = string.upper, -- I'm not sure why it's upper case either ;)
--   cond = conditions.hide_in_width,
--   color = { fg = colors.green, gui = 'bold' },
-- }
--
-- ins_right {
--   'fileformat',
--   fmt = string.upper,
--   icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
--   color = { fg = colors.green, gui = 'bold' },
-- }
--
-- ins_right {
--   'branch',
--   icon = '',
--   color = { fg = colors.purple, gui = 'bold' },
-- }
--
-- ins_right {
--   'diff',
--   -- Is it me or the symbol for modified us really weird
--   symbols = { added = " ", modified = " ", removed = " " },
--   diff_color = {
--     added = { fg = colors.green },
--     modified = { fg = colors.orange },
--     removed = { fg = colors.red },
--   },
--   cond = conditions.hide_in_width,
-- }
--
-- ins_right {
--   function()
--     return '▊'
--   end,
--   color = { fg = colors.blue },
--   padding = { left = 1 },
-- }
--
-- -- Now don't forget to initialize lualine
-- lualine.setup(config)

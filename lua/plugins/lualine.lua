local colors = {
  background = "#181818",
  foreground = "#e4e4e4",
  surface = "#282828",
  muted = "#565f73",
  red = "#f43841",
  green = "#73d936",
  yellow = "#ffdd33",
  blue = "#96a6c8",
  wisteria = "#9e95c7",
  brown = "#cc8c3c",
}

local theme = {
  normal = {
    a = { bg = colors.green, fg = colors.background, gui = "bold" },
    b = { bg = colors.surface, fg = colors.foreground },
    c = { bg = colors.background, fg = colors.foreground },
  },
  insert = {
    a = { bg = colors.blue, fg = colors.background, gui = "bold" },
    b = { bg = colors.surface, fg = colors.foreground },
    c = { bg = colors.background, fg = colors.foreground },
  },
  visual = {
    a = { bg = colors.wisteria, fg = colors.background, gui = "bold" },
    b = { bg = colors.surface, fg = colors.foreground },
    c = { bg = colors.background, fg = colors.foreground },
  },
  replace = {
    a = { bg = colors.red, fg = colors.background, gui = "bold" },
    b = { bg = colors.surface, fg = colors.foreground },
    c = { bg = colors.background, fg = colors.foreground },
  },
  command = {
    a = { bg = colors.yellow, fg = colors.background, gui = "bold" },
    b = { bg = colors.surface, fg = colors.foreground },
    c = { bg = colors.background, fg = colors.foreground },
  },
  terminal = {
    a = { bg = colors.brown, fg = colors.background, gui = "bold" },
    b = { bg = colors.surface, fg = colors.foreground },
    c = { bg = colors.background, fg = colors.foreground },
  },
  inactive = {
    a = { bg = colors.background, fg = colors.muted },
    b = { bg = colors.background, fg = colors.muted },
    c = { bg = colors.background, fg = colors.muted },
  },
}

return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    opts.options = opts.options or {}
    opts.options.theme = theme
  end,
}

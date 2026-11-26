local colors = {
  background = "#181818",
  tabline = "#181818",
  surface = "#282828",
  foreground = "#e4e4e4",
  muted = "#565f73",
  red = "#f43841",
  green = "#73d936",
  yellow = "#ffdd33",
  blue = "#96a6c8",
}

return {
  "akinsho/bufferline.nvim",
  opts = {
    options = {
      always_show_bufferline = true,
    },
    highlights = {
      fill = { bg = colors.tabline },
      background = { bg = colors.tabline, fg = colors.muted },
      buffer_visible = { bg = colors.surface, fg = colors.foreground },
      buffer_selected = { bg = colors.background, fg = colors.foreground, bold = true, italic = false },
      indicator_selected = { bg = colors.background, fg = colors.green },
      separator = { bg = colors.tabline, fg = colors.tabline },
      separator_visible = { bg = colors.surface, fg = colors.tabline },
      separator_selected = { bg = colors.background, fg = colors.tabline },
      close_button = { bg = colors.tabline, fg = colors.muted },
      close_button_visible = { bg = colors.surface, fg = colors.foreground },
      close_button_selected = { bg = colors.background, fg = colors.foreground },
      modified = { bg = colors.tabline, fg = colors.yellow },
      modified_visible = { bg = colors.surface, fg = colors.yellow },
      modified_selected = { bg = colors.background, fg = colors.yellow },
      diagnostic_selected = { bg = colors.background, fg = colors.yellow },
      error_diagnostic_selected = { bg = colors.background, fg = colors.red },
      warning_diagnostic_selected = { bg = colors.background, fg = colors.yellow },
      info_diagnostic_selected = { bg = colors.background, fg = colors.blue },
    },
  },
}

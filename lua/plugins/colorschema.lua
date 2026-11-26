return {
  "blazkowolf/gruber-darker.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("gruber-darker")

    local colors = {
      background = "#181818",
      foreground = "#e4e4e4",
      border = "#484848",
      selected = "#282828",
    }
    local highlights = {
      SnacksNormal = { bg = colors.background, fg = colors.foreground },
      SnacksNormalNC = { bg = colors.background, fg = colors.foreground },
      SnacksWinSeparator = { fg = colors.border },
      SnacksPicker = { bg = colors.background, fg = colors.foreground },
      SnacksPickerBorder = { bg = colors.background, fg = colors.border },
      SnacksPickerTitle = { bg = colors.background, fg = colors.foreground, bold = true },
      SnacksPickerBox = { bg = colors.background, fg = colors.foreground },
      SnacksPickerBoxBorder = { bg = colors.background, fg = colors.border },
      SnacksPickerBoxTitle = { bg = colors.background, fg = colors.foreground, bold = true },
      SnacksPickerList = { bg = colors.background, fg = colors.foreground },
      SnacksPickerListBorder = { bg = colors.background, fg = colors.border },
      SnacksPickerListTitle = { bg = colors.background, fg = colors.foreground, bold = true },
      SnacksPickerListCursorLine = { bg = colors.selected },
      SnacksPickerInput = { bg = colors.background, fg = colors.foreground },
      SnacksPickerInputBorder = { bg = colors.background, fg = colors.border },
      SnacksPickerInputTitle = { bg = colors.background, fg = colors.foreground, bold = true },
    }

    for group, style in pairs(highlights) do
      vim.api.nvim_set_hl(0, group, style)
    end
  end,
}

-- config nvim appearance
local module = {}
function module.apply_appearance()
  -- 清掉常见窗口和浮窗底色
  local transparent_groups = {
    "NormalNC",
    "NormalFloat",
    "FloatBorder",
    "FloatTitle",
    "Pmenu",
    "SignColumn",
    "EndOfBuffer",
    "WhichKeyNormal",
    "WhichKeyBorder",
    "WhichKeyTitle",
    "BufferLineFill",
    "BufferLineBackground",

    "BufferLineBufferVisible",
    "BufferLineBufferSelected",

    "BufferLineCloseButton",
    "BufferLineCloseButtonVisible",
    "BufferLineCloseButtonSelected",

    "BufferLineSeparator",
    "BufferLineSeparatorVisible",
    "BufferLineSeparatorSelected",

    "BufferLineIndicatorVisible",
    "BufferLineIndicatorSelected",
  }

  for _, group in ipairs(transparent_groups) do
    vim.api.nvim_set_hl(0, group, { bg = "NONE" })
  end
end

return module

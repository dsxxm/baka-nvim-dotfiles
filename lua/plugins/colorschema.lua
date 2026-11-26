return {
  "blazkowolf/gruber-darker.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("gruber-darker")

    local transparent_groups = {
      "FloatBorder",
      "NormalFloat",
      "SnacksPicker",
      "SnacksPickerBorder",
      "SnacksPickerBoxBorder",
      "SnacksPickerDir",
      "SnacksPickerInput",
      "SnacksPickerInputBorder",
      "SnacksPickerList",
      "SnacksPickerPreview",
      "SnacksPickerTitle",
    }

    for _, group in ipairs(transparent_groups) do
      vim.api.nvim_set_hl(0, group, { bg = "NONE" })
    end
  end,
}

return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  opts = {
    flavour = "mocha",
    transparent_background = not vim.g.neovide,
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin")

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

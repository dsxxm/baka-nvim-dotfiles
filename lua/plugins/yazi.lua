local keys = {
  { "<leader>-", "<cmd>Yazi<cr>", desc = "Open yazi at current file" },
  { "<leader>cw", "<cmd>Yazi cwd<cr>", desc = "Open yazi in working directory" },
  { "<c-up>", "<cmd>Yazi toggle<cr>", desc = "Resume last yazi session" },
}

return {
  "mikavilpas/yazi.nvim",
  version = "*",
  event = "VeryLazy",
  dependencies = {
    { "nvim-lua/plenary.nvim", lazy = true },
  },
  keys = keys,
  opts = {
    open_for_directories = false,
    keymaps = {
      show_help = "<f1>",
    },
  },
}

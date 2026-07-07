-- ~/.config/nvim/lua/plugins/yazi.lua
return {
  {
    "mikavilpas/yazi.nvim",
    version = "*",
    event = "VeryLazy",
    dependencies = {
      { "nvim-lua/plenary.nvim", lazy = true },
    },
    keys = {
      -- 快捷键绑定
      { "<leader>-", "<cmd>Yazi<cr>", desc = "Open yazi at current file" },
      { "<leader>cw", "<cmd>Yazi cwd<cr>", desc = "Open yazi in working directory" },
      { "<c-up>", "<cmd>Yazi toggle<cr>", desc = "Resume last yazi session" },
    },
    opts = {
      open_for_directories = false, -- 不自动打开目录
      keymaps = {
        show_help = "<f1>", -- 显示帮助
      },
    },
  },
}

-- Keymaps are automatically loaded on the VeryLazy event.
-- Default keymaps: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- toggle hunk in a float terminal
vim.keymap.set("n", "<leader>ch", function()
  Snacks.terminal("hunk diff --watch", { cwd = vim.uv.cwd() })
end, { desc = "toggle hunk" })

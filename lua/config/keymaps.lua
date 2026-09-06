-- Keymaps are automatically loaded on the VeryLazy event.
-- Default keymaps: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- toggle hunk in a float terminal
vim.keymap.set("n", "<leader>ch", function()
  Snacks.terminal("hunk diff --watch", { cwd = vim.uv.cwd() })
end, { desc = "toggle hunk" })

vim.keymap.set("v", "<leader>yl", function()
  local path = vim.fn.expand("%:.")
  if path == "" then
    vim.notify("Cannot create a location for an unnamed buffer", vim.log.levels.WARN)
    return
  end

  local start_line = vim.fn.getpos("v")[2]
  local end_line = vim.fn.getpos(".")[2]
  if start_line > end_line then
    start_line, end_line = end_line, start_line
  end

  local location = start_line == end_line
      and string.format("%s:%d", path, start_line)
    or string.format("%s:%d-%d", path, start_line, end_line)
  vim.fn.setreg('"', location)
  vim.fn.setreg("+", location)
  vim.notify("Copied location: " .. location)
end, { desc = "Copy code location" })


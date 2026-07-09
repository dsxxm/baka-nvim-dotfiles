-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

if vim.g.neovide then
  vim.g.neovide_opacity = 0.85
  vim.g.neovide_normal_opacity = 0.85
  vim.g.neovide_scale_factor = 1.0
  vim.o.guifont = "JetBrainsMono Nerd Font:h18"

  local change_font_size = function(delta)
    local font, size = vim.o.guifont:match("^(.*):h(%d+)$")
    size = math.max(8, (tonumber(size) or 14) + delta)
    vim.o.guifont = string.format("%s:h%d", font or "JetBrainsMono Nerd Font", size)
  end

  vim.keymap.set("n", "<C-A-=>", function()
    change_font_size(1)
  end, { desc = "Neovide font bigger" })

  vim.keymap.set("n", "<C-A-->", function()
    change_font_size(-1)
  end, { desc = "Neovide font smaller" })
end

-- Options are automatically loaded before lazy.nvim startup.
-- Default options: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

if vim.g.neovide then
  vim.g.neovide_opacity = 0.85
  vim.g.neovide_normal_opacity = 0.85
  vim.g.neovide_scale_factor = 1.0
  vim.o.guifont = "JetBrainsMono Nerd Font:h18"

  local function change_font_size(delta)
    local font, size = vim.o.guifont:match("^(.*):h(%d+)$")
    size = math.max(8, (tonumber(size) or 14) + delta)
    vim.o.guifont = string.format("%s:h%d", font or "JetBrainsMono Nerd Font", size)
  end

  local keymaps = {
    ["<C-A-=>"] = { delta = 1, desc = "Neovide font bigger" },
    ["<C-A-->"] = { delta = -1, desc = "Neovide font smaller" },
  }

  for lhs, opts in pairs(keymaps) do
    vim.keymap.set("n", lhs, function()
      change_font_size(opts.delta)
    end, { desc = opts.desc })
  end
end

vim.opt.updatetime = 150
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true

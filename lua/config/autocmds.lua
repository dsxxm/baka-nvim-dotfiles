-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local tmux_status_group = vim.api.nvim_create_augroup("tmux_statusline", { clear = true })

local function tmux_set_status(value)
  if vim.env.TMUX then
    vim.system({ "tmux", "set", "status", value }, {}, function() end)
  end
end

tmux_set_status("off")

local dashboard_group = vim.api.nvim_create_augroup("empty_buffer_dashboard", { clear = true })

local function open_dashboard_when_empty()
  vim.schedule(function()
    local current = vim.api.nvim_get_current_buf()
    if vim.bo[current].buftype ~= "" or vim.api.nvim_buf_get_name(current) ~= "" then
      return
    end

    for _, buffer in ipairs(vim.api.nvim_list_bufs()) do
      if buffer ~= current and vim.api.nvim_buf_is_valid(buffer) and vim.bo[buffer].buflisted and vim.bo[buffer].buftype == "" then
        return
      end
    end

    Snacks.dashboard.open({ buf = current, win = 0 })
  end)
end

vim.api.nvim_create_autocmd("BufDelete", {
  group = dashboard_group,
  callback = open_dashboard_when_empty,
})

vim.api.nvim_create_autocmd({ "VimEnter", "FocusGained", "BufEnter", "TabEnter", "WinEnter", "VimResume" }, {
  group = tmux_status_group,
  callback = function()
    tmux_set_status("off")
  end,
})

vim.api.nvim_create_autocmd({ "VimLeavePre", "FocusLost", "VimSuspend" }, {
  group = tmux_status_group,
  callback = function()
    tmux_set_status("on")
  end,
})

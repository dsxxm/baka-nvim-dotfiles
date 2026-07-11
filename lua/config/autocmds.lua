-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("spring_boot_inlay_hint", { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.name == "spring-boot" then
      client.server_capabilities.inlayHintProvider = false
    end
  end,
})

local tmux_status_group = vim.api.nvim_create_augroup("tmux_statusline", { clear = true })

local function tmux_set_status(value)
  if vim.env.TMUX then
    vim.system({ "tmux", "set", "status", value }, {}, function() end)
  end
end

tmux_set_status("off")

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

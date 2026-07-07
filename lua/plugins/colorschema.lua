return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false, -- 主题需要尽早加载，禁用懒加载
  priority = 1000, -- 设置一个较高的优先级，确保主题的highlight组能覆盖其他插件[reference:2]
  opts = {
    flavour = "mocha", -- 风味选择: latte, frappe, macchiato, mocha
    transparent_background = true, -- 开启透明背景，这是开启透明的关键
    -- 其它你需要的配置...
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin") -- 最后应用主题配色
  end,
}

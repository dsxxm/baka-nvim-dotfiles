local DASHBOARD_HEADER = [[

                 ◌
            B A K A X X M
      edit deliberately · ship calmly

            ─────────────
              N E O V I M
]]

return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        header = DASHBOARD_HEADER,
      },
      sections = {
        { section = "header", padding = 2 },
      },
    },
    picker = {
      sources = {
        explorer = {
          hidden = true,
          ignored = true,
        },
      },
    },
    image = {},
    scroll = {
      enabled = false,
    },
    statuscolumn = {
      enabled = true,
    },
    terminal = {
      win = {
        relative = "editor",
        position = "float",
        width = 0.9,
        height = 0.85,
        border = "rounded",
        backdrop = 60,
      },
    },
  },
}

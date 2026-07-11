local DASHBOARD_HEADER = [[
▀█████████▄     ▄████████    ▄█   ▄█▄    ▄████████ ▀████    ▐████▀ ▀████    ▐████▀   ▄▄▄▄███▄▄▄▄
  ███    ███   ███    ███   ███ ▄███▀   ███    ███   ███▌   ████▀    ███▌   ████▀  ▄██▀▀▀███▀▀▀██▄
  ███    ███   ███    ███   ███▐██▀     ███    ███    ███  ▐███       ███  ▐███    ███   ███   ███
 ▄███▄▄▄██▀    ███    ███  ▄█████▀      ███    ███    ▀███▄███▀       ▀███▄███▀    ███   ███   ███
▀▀███▀▀▀██▄  ▀███████████ ▀▀█████▄    ▀███████████    ████▀██▄        ████▀██▄     ███   ███   ███
  ███    ██▄   ███    ███   ███▐██▄     ███    ███   ▐███  ▀███      ▐███  ▀███    ███   ███   ███
  ███    ███   ███    ███   ███ ▀███▄   ███    ███  ▄███     ███▄   ▄███     ███▄  ███   ███   ███
▄█████████▀    ███    █▀    ███   ▀█▀   ███    █▀  ████       ███▄ ████       ███▄  ▀█   ███   █▀
                            ▀
]]

return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        header = DASHBOARD_HEADER,
      },
      sections = {
        { section = "header" },
        { section = "keys", gap = 1, padding = 1 },
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

-- i dont need u to notice shits on my screen
return {
  -- https://github.com/folke/noice.nvim
  {
    "folke/noice.nvim",
    opts = {
      views = {
        cmdline_popup = {
          position = {
            row = -2,
            col = "50%",
          },
        },
      },
      routes = {
        {
          filter = {
            event = "lsp",
            kind = "progress",
            cond = function(message)
              return message.opts.progress and message.opts.progress.client == "jdtls"
            end,
          },
          opts = { skip = true },
        },
      },
      lsp = {
        hover = {
          -- Set not show a message if hover is not available
          -- ex: shift+k on Typescript code
          silent = true,
        },
      },
    },
  },
}

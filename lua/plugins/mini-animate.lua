return {
  {
    "nvim-mini/mini.animate",
    opts = function(_, opts)
      local animate = require("mini.animate")

      opts.cursor = {
        enable = true,
        timing = animate.gen_timing.linear({
          duration = 80,
          unit = "total",
        }),
        path = animate.gen_path.line({
          predicate = function()
            -- 只在同窗口内移动时动画，跨窗口跳转不加动画
            return true
          end,
        }),
      }

      opts.resize = {
        enable = true,
        timing = animate.gen_timing.linear({
          duration = 120,
          unit = "total",
        }),
        subresize = animate.gen_subresize.equal(),
      }

      opts.open = {
        enable = true,
        timing = animate.gen_timing.exponential({
          easing = "out",
          duration = 180,
          unit = "total",
        }),
        winconfig = animate.gen_winconfig.center({
          direction = "from_center",
        }),
        winblend = animate.gen_winblend.linear({
          from = 70,
          to = 100,
        }),
      }

      opts.close = {
        enable = true,
        timing = animate.gen_timing.exponential({
          easing = "in",
          duration = 160,
          unit = "total",
        }),
        winconfig = animate.gen_winconfig.wipe({
          direction = "to_edge",
        }),
        winblend = animate.gen_winblend.linear({
          from = 70,
          to = 100,
        }),
      }
    end,
  },
}

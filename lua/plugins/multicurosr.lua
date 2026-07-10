return {
  "jake-stewart/multicursor.nvim",
  branch = "1.0",
  config = function()
    local mc = require("multicursor-nvim")
    mc.setup()

    vim.keymap.set("n", "<c-leftmouse>", mc.handleMouse, { desc = "Multicursor mouse add" })
    vim.keymap.set("n", "<c-leftdrag>", mc.handleMouseDrag, { desc = "Multicursor mouse drag" })
    vim.keymap.set("n", "<c-leftrelease>", mc.handleMouseRelease, { desc = "Multicursor mouse release" })
    vim.keymap.set("n", "<leader>n", mc.addCursor, { desc = "Multicursor add cursor" })

    mc.addKeymapLayer(function(layer_set)
      layer_set("n", "<esc>", function()
        if mc.cursorsEnabled() then
          mc.clearCursors()
        else
          mc.enableCursors()
        end
      end)
    end)

    local highlights = {
      MultiCursorCursor = { reverse = true },
      MultiCursorDisabledCursor = { reverse = true },
      MultiCursorDisabledSign = { link = "SignColumn" },
      MultiCursorDisabledVisual = { link = "Visual" },
      MultiCursorMatchPreview = { link = "Search" },
      MultiCursorSign = { link = "SignColumn" },
      MultiCursorVisual = { link = "Visual" },
    }

    for group, opts in pairs(highlights) do
      vim.api.nvim_set_hl(0, group, opts)
    end
  end,
}

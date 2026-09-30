local function configure_golangci_lint()
  local lint = require("lint")
  lint.linters.golangcilint = function()
    return vim.tbl_extend("force", require("lint.linters.golangcilint"), {
      cwd = vim.fs.root(0, { "go.work", "go.mod" }) or vim.fn.getcwd(),
    })
  end
end

return {
  {
    "mfussenegger/nvim-lint",
    optional = true,
    init = function()
      vim.api.nvim_create_autocmd("User", {
        group = vim.api.nvim_create_augroup("go-golangci-lint-root", { clear = true }),
        pattern = "LazyLoad",
        callback = function(event)
          if event.data == "nvim-lint" then
            configure_golangci_lint()
          end
        end,
      })
      if package.loaded["lint"] then
        configure_golangci_lint()
      end
    end,
  },
}

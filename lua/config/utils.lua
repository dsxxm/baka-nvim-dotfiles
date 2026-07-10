local M = {}

function M.joinpath(...)
  return vim.fs.joinpath(...)
end

function M.mason_path(...)
  return M.joinpath(vim.fn.stdpath("data"), "mason", ...)
end

function M.glob(pattern)
  return vim.fn.glob(pattern, false, true)
end

function M.extend_unique(dst, src)
  local seen = {}

  for _, item in ipairs(dst) do
    seen[item] = true
  end

  for _, item in ipairs(src or {}) do
    if not seen[item] then
      table.insert(dst, item)
      seen[item] = true
    end
  end

  return dst
end

return M

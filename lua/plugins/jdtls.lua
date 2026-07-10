local java = require("config.java")
local utils = require("config.utils")

local function spring_boot_bundles()
  local ok, spring_boot = pcall(require, "spring_boot")
  return ok and spring_boot.java_extensions() or {}
end

local function append_bundles(config, bundles)
  config.init_options = config.init_options or {}
  config.init_options.bundles = utils.extend_unique(vim.deepcopy(config.init_options.bundles or {}), bundles)
end

local function enable_debug_code_lens(config)
  config.settings = vim.tbl_deep_extend("force", config.settings or {}, {
    java = {
      debug = {
        settings = {
          enableRunDebugCodeLens = true,
        },
      },
    },
  })
end

local function apply_user_config(config, user_jdtls)
  if type(user_jdtls) == "function" then
    return user_jdtls(config) or config
  end

  if user_jdtls then
    return vim.tbl_deep_extend("force", config, user_jdtls)
  end

  return config
end

return {
  {
    "mfussenegger/nvim-jdtls",
    opts = function(_, opts)
      opts.cmd = opts.cmd or { vim.fn.exepath("jdtls") }

      local java_arg = "--java-executable=" .. java.executable
      if not vim.tbl_contains(opts.cmd, java_arg) then
        table.insert(opts.cmd, java_arg)
      end

      local bundles = spring_boot_bundles()
      local user_jdtls = opts.jdtls

      opts.jdtls = function(config)
        config = config or {}

        enable_debug_code_lens(config)
        config = apply_user_config(config, user_jdtls)
        append_bundles(config, bundles)

        return config
      end
    end,
  },
}

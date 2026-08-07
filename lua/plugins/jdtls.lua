local java = require("config.java")
local utils = require("config.utils")

local function jdtls_cmd(opts)
  return utils.extend_unique(opts.cmd or { vim.fn.exepath("jdtls") }, {
    "--java-executable=" .. java.executable,
    "--jvm-arg=-Xms2g",
    "--jvm-arg=-Xmx4g",
    "--jvm-arg=-XX:+UseG1GC",
    "--jvm-arg=-XX:MaxGCPauseMillis=200",
    "--jvm-arg=-XX:+UseStringDeduplication",
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

local function tune_jdtls(config)
  config.settings = vim.tbl_deep_extend("force", config.settings or {}, {
    java = {
      autobuild = { enabled = false },
      implementationsCodeLens = { enabled = false },
      referencesCodeLens = { enabled = false },
    },
  })

  return config
end

return {
  {
    "mfussenegger/nvim-jdtls",
    opts = function(_, opts)
      opts.cmd = jdtls_cmd(opts)
      opts.dap = false
      opts.dap_main = false
      opts.test = false

      local user_jdtls = opts.jdtls

      opts.jdtls = function(config)
        config = tune_jdtls(config or {})
        return apply_user_config(config, user_jdtls)
      end
    end,
  },
}

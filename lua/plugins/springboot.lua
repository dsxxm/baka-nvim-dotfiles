local java = require("config.java")

return {
  {
    "mason-org/mason.nvim",
    optional = true,
    opts = {
      ensure_installed = {
        "vscode-spring-boot-tools",
      },
    },
  },

  {
    "JavaHello/spring-boot.nvim",
    ft = { "java", "yaml", "jproperties" },
    opts = {
      java_cmd = java.executable,
      server = {
        settings = {
          ["boot-java"] = {
            validation = {
              java = {
                ["version-validation"] = "OFF",
              },
            },
          },
        },
      },
    },
  },
}

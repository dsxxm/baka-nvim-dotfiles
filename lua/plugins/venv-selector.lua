local MINICONDA_HOME = "~/program/miniconda"

return {
  "linux-cultist/venv-selector.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    search = {
      miniconda_base = {
        command = "$FD '/python$' " .. MINICONDA_HOME .. "/bin --no-ignore-vcs --full-path --color never",
        type = "anaconda",
      },
      miniconda_envs = {
        command = "$FD 'bin/python$' " .. MINICONDA_HOME .. "/envs --no-ignore-vcs --full-path --color never",
        type = "anaconda",
      },
    },
  },
}

return {
  "linux-cultist/venv-selector.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    -- 覆盖 miniconda 的搜索路径
    search = {
      miniconda_envs = {
        command = "$FD 'bin/python$' ~/program/miniconda/envs --no-ignore-vcs --full-path --color never",
        type = "anaconda",
      },
      miniconda_base = {
        command = "$FD '/python$' ~/program/miniconda/bin --no-ignore-vcs --full-path --color never",
        type = "anaconda",
      },
    },
    -- 如果你还想设置 conda 基础路径供其他逻辑使用（可选）
    -- anaconda_base_path = "~/program/miniconda",
  },
}

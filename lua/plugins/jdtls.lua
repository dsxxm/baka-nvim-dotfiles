return {
  {
    "mfussenegger/nvim-jdtls",
    opts = function(_, opts)
      table.insert(opts.cmd, "--java-executable=/usr/lib/jvm/java-21-openjdk/bin/java")

      opts.root_dir = function(path)
        return vim.fs.root(path, { "pom.xml", "mvnw", "gradlew", "build.gradle", "settings.gradle", ".project", ".git" })
      end

      opts.project_name = function(root_dir)
        return root_dir and vim.fn.fnamemodify(root_dir, ":p:h:t") .. "-" .. vim.fn.sha256(root_dir):sub(1, 8)
      end
    end,
  },
}

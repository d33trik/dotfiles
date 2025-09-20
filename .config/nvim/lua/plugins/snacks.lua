return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        projects = {
          recent = false,
          dev = { "~/projects", "~/work" },
          projects = {},
          patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "package.json", "Makefile", "go.mod" },
        },
      },
    },
  },
}

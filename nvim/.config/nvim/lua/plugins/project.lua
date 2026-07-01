return {
  {
    "DrKJeff16/project.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    cmd = {
      "Project",
    },
    keys = {
      { "<leader>pp", "<cmd>Project<CR>", desc = "Project menu" },
      { "<leader>pr", "<cmd>Project root<CR>", desc = "Register project root" },
      { "<leader>ps", "<cmd>Project telescope<CR>", desc = "Switch project" },
      { "<leader>pR", "<cmd>Project recents<CR>", desc = "Recent projects" },
      { "<leader>pS", "<cmd>Project session<CR>", desc = "Project sessions" },
    },
    opts = {
      detection_methods = { "pattern", "lsp" },
      patterns = {
        ".git",
        "pyproject.toml",
        "setup.py",
        "setup.cfg",
        "requirements.txt",
        "CMakeLists.txt",
        "Makefile",
        "package.json",
        "Cargo.toml",
      },
      enable_autochdir = false,
      telescope = {
        enabled = true,
      },
    },
  },
}

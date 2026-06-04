return {
  {
    "sindrets/diffview.nvim",
    cmd = {
      "DiffviewOpen",
      "DiffviewFileHistory",
      "DiffviewClose",
      "DiffviewToggleFiles",
      "DiffviewFocusFiles",
      "DiffviewRefresh",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<CR>", desc = "Git diff view" },
      { "<leader>gh", "<cmd>DiffviewFileHistory %<CR>", desc = "Git file history" },
      { "<leader>gH", "<cmd>DiffviewFileHistory<CR>", desc = "Git repo history" },
      { "<leader>gq", "<cmd>DiffviewClose<CR>", desc = "Close diff view" },
    },
    config = function()
      require("diffview").setup({})
    end,
  },
}

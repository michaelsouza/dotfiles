return {
  {
    "folke/todo-comments.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>xt", "<cmd>TodoTrouble<CR>", desc = "Todo comments in Trouble" },
      { "<leader>ft", "<cmd>TodoTelescope<CR>", desc = "Find todo comments" },
    },
    config = function()
      require("todo-comments").setup({})
    end,
  },
}

return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      local wk = require("which-key")

      wk.setup({})

      wk.add({
        { "<leader>f", group = "find" },
        { "<leader>h", group = "git hunks" },
        { "<leader>r", group = "rename" },
        { "<leader>c", group = "code" },
        { "<leader>d", group = "diagnostics" },
        { "<leader>e", desc = "Toggle file explorer" },
        { "<leader>w", desc = "Save file" },
        { "<leader>q", desc = "Quit" },
      })
    end,
  },
}

return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "+" },
          change = { text = "~" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
        },
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns
          local map = vim.keymap.set
          local opts = { buffer = bufnr }

          map("n", "]c", gs.next_hunk, opts)
          map("n", "[c", gs.prev_hunk, opts)
          map("n", "<leader>hp", gs.preview_hunk, opts)
          map("n", "<leader>hr", gs.reset_hunk, opts)
          map("n", "<leader>hb", gs.blame_line, opts)
        end,
      })
    end,
  },
}

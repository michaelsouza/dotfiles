return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>fm",
        function()
          require("conform").format({
            async = true,
            lsp_fallback = true,
          })
        end,
        desc = "Format file",
      },
    },
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
          python = { "ruff_format", "black" },
          c = { "clang_format" },
          cpp = { "clang_format" },
          json = { "prettier" },
          yaml = { "prettier" },
          markdown = { "prettier" },
        },

        format_on_save = function(bufnr)
          local disabled_filetypes = {}

          if disabled_filetypes[vim.bo[bufnr].filetype] then
            return nil
          end

          return {
            timeout_ms = 1000,
            lsp_fallback = true,
          }
        end,
      })
    end,
  },
}

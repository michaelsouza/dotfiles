return {
  {
    "echasnovski/mini.surround",
    version = false,
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("mini.surround").setup({
        mappings = {
          add = "sa",
          delete = "sd",
          replace = "sr",
          find = "sf",
          find_left = "sF",
          highlight = "sh",
          update_n_lines = "sn",
        },
      })
    end,
  },
}

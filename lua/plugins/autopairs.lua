return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({})

      local ok_cmp, cmp = pcall(require, "cmp")
      if ok_cmp then
        local ok_autopairs, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
        if ok_autopairs then
          cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end
      end
    end,
  },
}

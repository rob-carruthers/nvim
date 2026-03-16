return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  version = "*",
  config = function()
    require("which-key").setup({
      preset = "helix",
    })
  end,
}

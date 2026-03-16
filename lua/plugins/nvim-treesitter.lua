return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  build = ":TSUpdate",
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
      lazy = false,
    },
  },
  lazy = false,
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "bash", "lua", "python" },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}

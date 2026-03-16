return {
  "echasnovski/mini.surround",
  version = false,
  dependencies = { "folke/which-key.nvim" },
  config = function()
    require("mini.surround").setup({
      mappings = {
        add = "ms",
        delete = "md",
        replace = "mr",
        find = "",
        find_left = "",
        highlight = "",
        update_n_lines = "",
      },
    })
    require("which-key").add({
      { "m", group = "match/surround", mode = { "n", "v" } },
      { "ms", desc = "Add surround", mode = { "n", "v" } },
      { "md", desc = "Delete surround", mode = { "n", "v" } },
      { "mr", desc = "Replace surround", mode = { "n", "v" } },
      { "mm", desc = "Matching bracket", mode = { "n", "v" } },
      { "mi", desc = 'Select inside (mi( mi" etc)', mode = { "n", "v" } },
      { "ma", desc = 'Select around (ma( ma" etc)', mode = { "n", "v" } },
    })
  end,
}

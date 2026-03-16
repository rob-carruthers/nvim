return {
  "echasnovski/mini.surround",
  version = false,
  dependencies = { "folke/which-key.nvim" },
  config = function()
    require("mini.surround").setup({
      mappings = {
        add = "ms", -- add surround
        delete = "md", -- delete surround
        replace = "mr", -- replace surround

        find = "",
        find_left = "",
        highlight = "",
        update_n_lines = "",
      },
    })
    require("which-key").add({
      { "m", group = "surround", mode = { "n", "v" } },
      { "ms", desc = "Add surround", mode = { "n", "v" } },
      { "md", desc = "Delete surround", mode = { "n", "v" } },
      { "mr", desc = "Replace surround", mode = { "n", "v" } },
    })
  end,
}

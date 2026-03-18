return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  dependencies = { "HiPhish/rainbow-delimiters.nvim" },
  config = function()
    local highlight = {
      "RainbowDelimiterRed",
      "RainbowDelimiterYellow",
      "RainbowDelimiterBlue",
      "RainbowDelimiterOrange",
      "RainbowDelimiterGreen",
      "RainbowDelimiterViolet",
      "RainbowDelimiterCyan",
    }
    local hooks = require("ibl.hooks")
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "RainbowDelimiterRed", { fg = "#C5727A" })
      vim.api.nvim_set_hl(0, "RainbowDelimiterYellow", { fg = "#EFD49F" })
      vim.api.nvim_set_hl(0, "RainbowDelimiterBlue", { fg = "#81A1C1" })
      vim.api.nvim_set_hl(0, "RainbowDelimiterOrange", { fg = "#D79784" })
      vim.api.nvim_set_hl(0, "RainbowDelimiterGreen", { fg = "#B1C89D" })
      vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", { fg = "#BE9DB8" })
      vim.api.nvim_set_hl(0, "RainbowDelimiterCyan", { fg = "#9FC6C5" })
    end)
    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    require("ibl").setup({
      scope = {
        highlight = highlight,
        char = "▏",
      },
      indent = {
        highlight = highlight,
        char = "▏",
      },
    })
  end,
}

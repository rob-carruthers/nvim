return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "nvim-mini/mini.icons" },
  ---@module "fzf-lua"
  ---@type fzf-lua.Config|{}
  config = function()
    require("fzf-lua").setup {
      fzf_bin = "sk",
    }
    require("fzf-lua").register_ui_select()
  end
}

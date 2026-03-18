vim.diagnostic.config({
  -- with update_in_insert, the diagnostic gutter is retained while in insert mode
  update_in_insert = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "●",
      [vim.diagnostic.severity.WARN] = "●",
      [vim.diagnostic.severity.HINT] = "●",
      [vim.diagnostic.severity.INFO] = "●",
    },
    linehl = {},
    numhl = {
      [vim.diagnostic.severity.ERROR] = "ErrorMsg",
      [vim.diagnostic.severity.WARN] = "WarningMsg",
    },
    priority = 4,
  },
  virtual_lines = true,
  virtual_text = false,
})
vim.lsp.enable("ruff")
vim.lsp.enable("ty")
vim.lsp.config["lua_ls"] = {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { { ".luarc.json", ".luarc.jsonc" }, ".git" },
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
    },
  },
}
vim.lsp.enable("lua_ls")

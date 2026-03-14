-- Redo
vim.keymap.set("n", "U", "<C-r>")

-- Line navigation
vim.keymap.set({ "n", "v" }, "gh", "0", { desc = "Go to beginning of line" })
vim.keymap.set({ "n", "v" }, "gs", "^", { desc = "Go to beginning of content of line" })
vim.keymap.set({ "n", "v" }, "gl", "$", { desc = "Go to end of line" })
vim.keymap.set({ "n", "v" }, "ge", "G", { desc = "Go to end of file" })

-- LSP actions, ported from helix
-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
-- vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to references" })
vim.keymap.set("n", "<leader>k", function()
  vim.lsp.buf.hover {
    border = "single",
    max_height = 20,
    max_width = 130,
    close_events = { "CursorMoved", "BufLeave", "WinLeave", "LSPDetach" },
  }
end, { desc = "Hover" })
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { desc = "Rename symbol" })
-- vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, { desc = "Code actions" })

-- Bufferline
vim.keymap.set("n", "<A-PageDown>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<A-PageUp>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<A-w>", "<cmd>bdelete<CR>", { desc = "Close buffer" })

-- fzf-lua
vim.keymap.set("n", "gd", "<cmd>FzfLua lsp_definitions<CR>", { desc = "Go to definition" })
vim.keymap.set("n", "gr", "<cmd>FzfLua lsp_references<CR>", { desc = "Go to references" })
vim.keymap.set("n", "<leader>f", "<cmd>FzfLua files<CR>", { desc = "File picker" })
vim.keymap.set("n", "<leader>g", "<cmd>FzfLua git_diff<CR>", { desc = "File picker" })
vim.keymap.set("n", "<leader>d", "<cmd>FzfLua diagnostics_document<CR>", { desc = "Diagnostics picker" })
vim.keymap.set("n", "<leader>D", "<cmd>FzfLua diagnostics_workspace<CR>", { desc = "Diagnostics picker (workspace)" })
vim.keymap.set("n", "<leader>/", "<cmd>FzfLua files<CR>", { desc = "Grep picker" })
vim.keymap.set("n", "<leader>a", "<cmd>FzfLua lsp_code_actions<CR>", { desc = "Code actions" })
vim.keymap.set("n", "<leader>s", "<cmd>FzfLua lsp_document_symbols<CR>", { desc = "Symbol picker" })
vim.keymap.set("n", "<leader>S", "<cmd>FzfLua lsp_live_workspace_symbols<CR>", { desc = "Symbol picker" })

-- Yanks/pastes
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>p", '"+p', { desc = "Paste after (clipboard)" })
vim.keymap.set("v", "<leader>p", '"_d"+p', { desc = "Replace selection with clipboard" })
vim.keymap.set("n", "<leader>P", '"+P', { desc = "Paste before (clipboard)" })
vim.keymap.set("v", "<leader>P", '"_d"+P', { desc = "Replace selection with clipboard" })
vim.keymap.set("v", "R", '"_dP', { desc = "Replace selection with default register" })
vim.keymap.set("v", "<leader>R", '"_d"+p', { desc = "Replace selection with system clipboard" })

-- Redo
vim.keymap.set("n", "U", "<C-r>")

-- Line navigation
vim.keymap.set({ "n", "v" }, "gh", "0", { desc = "Go to beginning of line" })
vim.keymap.set({ "n", "v" }, "gs", "^", { desc = "Go to beginning of content of line" })
vim.keymap.set({ "n", "v" }, "gl", "$", { desc = "Go to end of line" })
vim.keymap.set({ "n", "v" }, "ge", "G", { desc = "Go to end of file" })

-- Comments
vim.keymap.set({ "n" }, "<C-c>", "Vgc", { desc = "Comment line", remap = true })
vim.keymap.set({ "v" }, "<C-c>", "gc", { desc = "Comment selection", remap = true })

-- Incremental line selection with counts
local function helix_select_lines(count)
  count = count or 1
  local mode = vim.fn.mode()

  if mode == "n" then
    -- normal mode: start visual line selection
    vim.api.nvim_feedkeys("V", "n", false)
    if count > 1 then
      vim.api.nvim_feedkeys(string.rep("j", count - 1), "n", false)
    end
  elseif mode == "V" or mode == "v" then
    -- visual mode: extend selection downward
    vim.api.nvim_feedkeys(string.rep("j", count), "v", false)
  end
end

-- Map 'x' in normal and visual modes
vim.keymap.set("n", "x", function()
  helix_select_lines(vim.v.count1)
end, { desc = "Helix-style line selection" })

vim.keymap.set("v", "x", function()
  helix_select_lines(vim.v.count1)
end, { desc = "Extend line selection downward" })

-- mi == vi
vim.keymap.set({ "n", "v" }, "mi", "vi", { desc = "Select inside", remap = true })
vim.keymap.set({ "n", "v" }, "ma", "va", { desc = "Select around", remap = true })

-- flip selection cursor location
vim.keymap.set("v", "<A-;>", "o", { desc = "Flip selection cursor" })

-- LSP actions, ported from helix
-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
-- vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to references" })
vim.keymap.set("n", "<leader>k", function()
  vim.lsp.buf.hover({
    border = "single",
    max_height = 20,
    max_width = 130,
    close_events = { "CursorMoved", "BufLeave", "WinLeave", "LSPDetach" },
  })
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
vim.keymap.set("n", "<leader>/", "<cmd>FzfLua live_grep<CR>", { desc = "Grep picker" })
vim.keymap.set("n", "<leader>a", "<cmd>FzfLua lsp_code_actions<CR>", { desc = "Code actions" })
vim.keymap.set("n", "<leader>s", "<cmd>FzfLua lsp_document_symbols<CR>", { desc = "Symbol picker" })
vim.keymap.set("n", "<leader>S", "<cmd>FzfLua lsp_live_workspace_symbols<CR>", { desc = "Symbol picker" })

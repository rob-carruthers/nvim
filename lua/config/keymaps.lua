-- Redo
vim.keymap.set("n", "U", "<C-r>")

-- Line navigation
vim.keymap.set({ "n", "v" }, "gh", "0", { desc = "Go to beginning of line" })
vim.keymap.set({ "n", "v" }, "gs", "^", { desc = "Go to beginning of content of line" })
vim.keymap.set({ "n", "v" }, "gl", "$", { desc = "Go to end of line" })
vim.keymap.set({ "n", "v" }, "ge", "G", { desc = "Go to end of file" })

-- LSP actions, ported from helix
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to references" })
vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, { desc = "Hover" })
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { desc = "Rename symbol" })
vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, { desc = "Code actions" })

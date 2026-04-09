-- vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<Leader>gd", vim.lsp.buf.definition, {})

-- Compatibilidade com TMUX
vim.keymap.set({ "n", "i", "v" }, "<Find>", "^")
vim.keymap.set({ "n", "i", "v" }, "<Select>", "$")

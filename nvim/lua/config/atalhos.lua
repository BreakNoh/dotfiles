-- Renomear
-- vim.keymap.set("n", "<F2>", ":IncRename ")

-- Ações de código
vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, {})

-- Ir pra definição
vim.keymap.set("n", "<Leader>gd", vim.lsp.buf.definition, {})

-- Alternar mostrar explorador de arquivos
-- local nvim_tree = require("nvim-tree.api")
-- vim.keymap.set("n", "<C-b>", nvim_tree.tree.toggle, { desc = "Alterna Explorador de Arquivos" })

-- Compatibilidade com TMUX
vim.keymap.set({ "n", "i", "v" }, "<Find>", "^")
vim.keymap.set({ "n", "i", "v" }, "<Select>", "$")

-- Abrir Telescope
-- local telescope = require("telescope.builtin")
vim.keymap.set("n", "<C-o>", function()
	print("use o <leader>ff")
end, { desc = "Notifica sobre novo atalho" }) -- Procurar Arquivos
-- vim.keymap.set("n", "<A-o>", telescope.live_grep, {}) -- Procurar Texto

-- Desativa as setas para te forçar a usar hjkl
vim.keymap.set("n", "<up>", "<nop>")
vim.keymap.set("n", "<down>", "<nop>")
vim.keymap.set("n", "<left>", "<nop>")
vim.keymap.set("n", "<right>", "<nop>")

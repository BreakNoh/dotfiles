local pasta_lsps = "~/.config/nvim/lsp"

for lsp, tipo in vim.fs.dir(pasta_lsps) do
	if tipo == "file" then
		local nome_base = vim.fn.split(lsp, "\\.")[1]
		vim.lsp.enable(nome_base)
	end
end

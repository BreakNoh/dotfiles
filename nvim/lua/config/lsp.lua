local pasta_lsps = "~/.config/nvim/lsp"

for lsp, tipo in vim.fs.dir(pasta_lsps) do
	if tipo == "file" then
		local nome_base = vim.fn.split(lsp, "\\.")[1]
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		-- para o ufo.nvim
		capabilities.textDocument.foldingRange = { lineFoldingOnly = true, dynamicRegistration = false }

		vim.lsp.enable(nome_base)
		vim.lsp.config("*", {
			capabilities = capabilities,
		})
	end
end

---@class vim.lsp.Config
return {
	cmd = { "emmet-language-server", "--stdio" },
	filetypes = { "html", "css", "javascriptreact", "typescriptreact" },
	root_markers = { "tsconfig.json", "package.json", ".git" },
}

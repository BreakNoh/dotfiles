---@class vim.lsp.Config
return {
	cmd = { "vscode-css-language-server", "--stdio" },
	filetypes = { "css" },
	root_markers = { ".git", "package.json", "tsconfig.json" },
}

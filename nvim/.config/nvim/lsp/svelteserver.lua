---@class vim.lsp.Config
return {
	cmd = { "svelteserver", "--stdio" },
	filetypes = { "svelte" },
	root_markers = { ".git", "svelte.config.js" },
}

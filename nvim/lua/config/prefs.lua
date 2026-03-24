local no_celular = os.getenv("TERMUX_VERSION")
local identacao = no_celular and 2 or 4

-- Setup
vim.opt.filetype = "on"
vim.opt.syntax = "on"
vim.opt.termguicolors = true
vim.opt.updatetime = 1000
vim.opt.ttyfast = true
vim.opt.mouse = ""

vim.g.mapleader = " " -- muda o <leader> pra ser o espaco
vim.g.linguagens = {
	"bash",
	"sh",
	"zsh",
	"powershell",
	"rust",
	"toml",
	"javascript",
	"typescript",
	"html",
	"css",
	"svelte",
	"json",
	"markdown",
	"python",
}
-- Tamanho do Tab
vim.opt.tabstop = identacao
vim.opt.shiftwidth = identacao
vim.opt.softtabstop = identacao

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99

-- Coluna Números
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"

vim.diagnostic.config({
	severity_sort = true,

	float = {
		source = true,
		focusable = true,
		border = "rounded",
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.HINT] = "",
		},
	},

	virtual_lines = false,
	virtual_text = false,
})

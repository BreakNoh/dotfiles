return {
	"nvim-treesitter/nvim-treesitter",

	lazy = false,
	branch = "main",
	build = ":TSUpdate",
	config = function()
		local treesitter = require("nvim-treesitter")
		treesitter.install(vim.g.linguagens)

		-- autocmd pra ativar o treesitter nos arquivos que geralmente uso
		vim.api.nvim_create_autocmd("FileType", {
			pattern = vim.g.linguagens,
			callback = function()
				vim.treesitter.start()
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
				vim.wo[0][0].foldmethod = "expr"
			end,
		})
	end,
}

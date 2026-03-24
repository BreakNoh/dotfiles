return {
	"nvim-treesitter/nvim-treesitter",

	lazy = false,
	branch = "main",
	build = ":TSUpdate",

	config = function()
		local treesitter = require("nvim-treesitter")
		local linguagens = {
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
		treesitter.install(linguagens)

		-- autocmd pra ativar o treesitter nos arquivos instalados
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "*",
			callback = function()
				local ok, _ = pcall(vim.treesitter.start) -- ok = true se treesitter

				if ok then
					vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
					vim.wo.foldmethod = "expr"
				end
			end,
		})
	end,
}

return {
	"stevearc/conform.nvim",

	config = true,
	opts = {
		log_level = vim.log.levels.DEBUG,
		formatters = {
			prettier = {
				prepend_args = { "--tab-width", "4" },
			},
		},

		format_on_save = function(bufnr)
			if vim.bo[bufnr].filetype == "svelte" then
				return { timeout_ms = 2000, lsp_fallback = false }
			end
			return { timeout_ms = 500, lsp_fallback = true }
		end,

		formatters_by_ft = {
			javascript = { "prettierd", "prettier", stop_after_first = true },
			typescript = { "prettierd", "prettier", stop_after_first = true },
			svelte = { "prettierd", "prettier", stop_after_first = true },
			html = { "prettierd", "prettier", stop_after_first = true },
			css = { "prettierd", "prettier", stop_after_first = true },

			typst = { "prettypst" },
			markdown = { "prettierd", "prettier", stop_after_first = true },
			json = { "prettierd", "prettier", stop_after_first = true },
			jsonc = { "prettierd", "prettier", stop_after_first = true },

			lua = { "stylua" },
			python = { "ruff_format" },

			rust = { "rustfmt", lsp_format = "fallback" },
			toml = { "tombi" },
		},
	},
}

return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>fm",
			function()
				require("conform").format({ async = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},

	---@module "conform"
	---@type conform.setupOpts
	opts = {
		-- Define your formatters
		formatters_by_ft = {
			-- typst = { "prettypst" },

			rust = { "rustfmt" },
			toml = { "tombi" },
			lua = { "stylua" },
			python = { "ruff_format" },

			markdown = { "prettierd", "prettier" },
			json = { "prettierd", "prettier" },
			jsonc = { "prettierd", "prettier" },
			javascript = { "prettierd", "prettier" },
			typescript = { "prettierd", "prettier" },
			svelte = { "prettierd", "prettier" },
			html = { "prettierd", "prettier" },
			css = { "prettierd", "prettier" },

			sh = { "beautysh" },
			bash = { "beautysh" },
			zsh = { "beautysh" },
		},
		default_format_opts = {
			lsp_format = "fallback",
			stop_after_first = true,
		},
		format_on_save = { timeout_ms = 500 },
	},
	init = function()
		-- If you want the formatexpr, here is the place to set it
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}

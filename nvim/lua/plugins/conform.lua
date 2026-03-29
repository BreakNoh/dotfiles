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
			zsh = { "beautysh" },
		},
		default_format_opts = {
			lsp_format = "fallback",
			stop_after_first = true,
		},
		format_on_save = { timeout_ms = 500 },
		formatters = {
			shfmt = {
				append_args = { "-i", "2" },
			},
		},
	},
	init = function()
		-- If you want the formatexpr, here is the place to set it
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
	-- "stevearc/conform.nvim",
	--
	-- opts = {
	-- 	log_level = vim.log.levels.DEBUG,
	-- 	formatters = {
	-- 		prettier = {
	-- 			prepend_args = { "--tab-width", "4" },
	-- 		},
	-- 	},
	--
	-- 	format_on_save = function(bufnr)
	-- 		if vim.bo[bufnr].filetype == "svelte" then
	-- 			return { timeout_ms = 2000, lsp_fallback = false }
	-- 		end
	-- 		return { timeout_ms = 500, lsp_fallback = true }
	-- 	end,
	--
	-- 	formatters_by_ft = {
	-- 		javascript = { "prettierd", "prettier", stop_after_first = true },
	-- 		typescript = { "prettierd", "prettier", stop_after_first = true },
	-- 		svelte = { "prettierd", "prettier", stop_after_first = true },
	-- 		html = { "prettierd", "prettier", stop_after_first = true },
	-- 		css = { "prettierd", "prettier", stop_after_first = true },
	--
	-- 		typst = { "prettypst" },
	-- 		markdown = { "prettierd", "prettier", stop_after_first = true },
	-- 		json = { "prettierd", "prettier", stop_after_first = true },
	-- 		jsonc = { "prettierd", "prettier", stop_after_first = true },
	--
	-- 		lua = { "stylua" },
	-- 		python = { "ruff_format" },
	--
	-- 		rust = { "rustfmt", lsp_format = "fallback" },
	-- 		toml = { "tombi" },
	-- 	},
	-- },
	-- -- config = true,
	--
	-- keys = {
	-- 	{
	-- 		"<leader>fm",
	-- 		function(_)
	-- 			require("conform").format()
	-- 		end,
	-- 		desc = "Conform Format",
	-- 	},
	-- },
}

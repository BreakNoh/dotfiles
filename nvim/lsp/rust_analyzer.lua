---@class vim.lsp.Config
return {
	cmd = { "rust-analyzer" },
	filetypes = { "rust" },
	root_markers = { "Cargo.toml", ".git" },
	settings = {
		["rust-analyzer"] = {
			cargo = {
				targetDir = true,
				allFeatures = true, -- Garante que o LSP veja tudo que o seu código usa
				loadOutDirsFromCheck = true,
			},
			checkOnSave = {
				enable = true,
				command = "clippy", -- Ou "check" se o clippy estiver muito lento
				extraArgs = { "--no-deps" }, -- Não re-checa dependências externas toda hora
			},
			procMacro = {
				enable = true,
				ignored = {
					["async-trait"] = { "async_trait" },
					["napi-derive"] = { "napi" },
				},
			},
			diagnostics = {
				enable = true,
				disabled = { "unresolved-proc-macro" }, -- Evita avisos falsos que pesam
				enableExperimental = false,
			},
			hover = {
				actions = {
					enable = true,
				},
			},
			inlayHints = {
				bindingModeHints = { enable = false },
				chainingHints = { enable = true },
				closingBraceHints = { enable = true, minLines = 25 },
				parameterHints = { enable = true },
				typeHints = { enable = true },
			},
		},
	},
}

---@class vim.lsp.Config
return {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = { { ".luarc.json", ".luarc.jsonc" }, ".git" },

	settings = {
		Lua = {
			runtime = {
				version = "Lua 5.4",
				path = {
					"?.lua",
					"?/init.lua",
					vim.fn.expand("~/.luarocks/share/lua/5.4/?.lua"),
					vim.fn.expand("~/.luarocks/share/lua/5.4/?/init.lua"),
					"/usr/share/5.4/?.lua",
					"/usr/share/lua/5.4/?/init.lua",
				},
			},
			diagnostics = {
				-- globals = { "vim" },
			},
			-- workspace = {
			-- checkThirdParty = false,
			-- telemetry = { enable = false },
			-- library = {
			-- 	vim.fn.expand("~/.luarocks/share/lua/5.4"),
			-- 	"/usr/share/lua/5.4",
			-- },
			-- },
		},
	},
}

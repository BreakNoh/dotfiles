return {
	"nvim-telescope/telescope.nvim",
	branch = "master",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-file-browser.nvim" },
	lazy = false,

	config = function()
		local telescope = require("telescope")

		telescope.setup({
			extensions = {
				file_browser = {
					hijack_netrw = true,
					hidden = { file_browser = true, folder_browser = true },
					respect_gitignore = false,
					no_ignore = true,

					path = "%:p:h",
					cwd = "%:p:h",

					-- setup_delay = 100,
				},
			},
			defaults = {
				file_ignore_patterns = {
					"node_modules",
					".git/",
					"dist/",
					"build/",
					"target/", -- Rust
					"%.jpg",
					"%.png",
					"%.webp", -- Ignora imagens
				},
			},
		})

		telescope.load_extension("file_browser")
	end,
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Telescope Find Files" },
		{ "<leader>lg", "<cmd>Telescope live_grep<cr>", desc = "Telescope Live Grep" },
		{ "<leader>fb", "<cmd>Telescope file_browser<cr>", desc = "Telescope File Browser" },
	},
}

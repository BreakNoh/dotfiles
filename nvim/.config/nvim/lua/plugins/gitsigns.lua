return {
	"lewis6991/gitsigns.nvim",
	opts = {
		numhl = true,
		signs = {
			-- add = { text = "│" },
			-- change = { text = "│" },
			-- delete = { text = "│" },
			-- topdelete = { text = "┐" },
			-- changedelete = { text = "│" },

			add = { text = "+" },
			change = { text = "~" },
			delete = { text = "-" },
			topdelete = { text = "-" },
			changedelete = { text = "~" },
			untracked = { text = ":" },
		},
	},
	config = true,
}

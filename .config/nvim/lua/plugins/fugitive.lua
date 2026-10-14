return {
	"tpope/vim-fugitive",
	cmd = {
		"Git",
		"Gdiffsplit",
		"Gvdiffsplit",
		"Gread",
		"Gwrite",
		"Gblame",
	},
	keys = {
		{ "<leader>gs", "<cmd>Git<CR>", desc = "Git: Status" },
		{ "<leader>ga", "<cmd>Git add %<CR>", desc = "Git: Stage Current File" },
		{ "<leader>gc", "<cmd>Git commit<CR>", desc = "Git: Commit" },
		{ "<leader>gp", "<cmd>Git push<CR>", desc = "Git: Push" },
		{ "<leader>gP", "<cmd>Git pull --rebase<CR>", desc = "Git: Pull (Rebase)" },
		{ "<leader>gb", "<cmd>Git blame<CR>", desc = "Git: Blame" },
		{ "<leader>gl", "<cmd>Git log --oneline --graph --decorate<CR>", desc = "Git: Log" },
		{ "<leader>gv", "<cmd>Gvdiffsplit<CR>", desc = "Git: Vertical Diff" },
		{ "<leader>gu", "<cmd>diffget //2<CR>", desc = "Git: Take Ours" },
		{ "<leader>gh", "<cmd>diffget //3<CR>", desc = "Git: Take Theirs" },
	},
}

return {
	"christoomey/vim-tmux-navigator",
	event = "VeryLazy",
	cmd = {
		"TmuxNavigateLeft",
		"TmuxNavigateDown",
		"TmuxNavigateUp",
		"TmuxNavigateRight",
		"TmuxNavigatePrevious",
	},
	keys = {
		{ "<c-h>", ":TmuxNavigateLeft<cr>" },
		{ "<c-j>", ":TmuxNavigateDown<cr>" },
		{ "<c-k>", ":TmuxNavigateUp<cr>" },
		{ "<c-l>", ":TmuxNavigateRight<cr>" },
		{ "<c-\\>", ":TmuxNavigatePrevious<cr>" },
	},
	init = function()
		vim.g.tmux_navigator_save_on_switch = 2
		vim.g.tmux_navigator_disable_when_zoomed = 1
	end,
}

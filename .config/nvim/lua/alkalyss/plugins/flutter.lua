return {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    opts = {
		debugger = {
			enabled = true,
			run_via_dap = true,
			register_configurations = function(paths)
				require("dap").configurations.dart = {}
				require("dap.ext.vscode").load_launchjs()
			end
		},
		widget_guides = {
			enabled = true,
		},
		lsp = {
			settings = {
				analysisExcludedFolders = {
					vim.fn.expand "$HOME/.pub-cache",
					"/usr/lib/flutter/packages",
				},
				lineLength = 120,
			}
		}
	},
}

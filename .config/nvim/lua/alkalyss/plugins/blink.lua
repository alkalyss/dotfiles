return {
	{
		"saghen/blink.cmp",
		version = "*",
		dependencies = {
			"rafamadriz/friendly-snippets",
			"MahanRahmati/blink-nerdfont.nvim",
			"bydlw98/blink-cmp-env",
			'nvim-tree/nvim-web-devicons',
			"onsails/lspkind.nvim",

			{
				'folke/lazydev.nvim',
				ft = "lua",
				opts = {
					library = {
						-- See the configuration section for more details
						-- Load luvit types when the `vim.uv` word is found
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				}
			},
		},
		opts = {
			keymap = {
				preset = "enter",
			},
			cmdline = {
				keymap = {

				}
			},
			appearance = {
				nerd_font_variant = "mono",
			},
			completion = {
				menu = {
					border = "rounded",
					draw = {
						components = {
							kind_icon = {
								text = function(ctx)
									local icon = ctx.kind_icon
									if vim.tbl_contains({ "Path" }, ctx.source_name) then
            						    local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
            						    if dev_icon then
            						        icon = dev_icon
            						    end
            						else
            						    icon = require("lspkind").symbolic(ctx.kind, {
            						        mode = "symbol",
            						    })
            						end

									return icon .. ctx.icon_gap
								end,
								highlight = function(ctx)
									local hl = ctx.kind_hl
									if vim.tbl_contains({ "Path" }, ctx.source_name) then
										local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
										if dev_icon then
											hl = dev_hl
										end
									end
									return hl
								end,
							}
						}
					}
				},
				list = {
					selection = {auto_insert = false},
				},
				documentation = {
					auto_show = true,
					window = {
						border = "rounded",
					},
				},
			},
			signature = {
				window = {
					border = "rounded",
				},
			},
			sources = {
				default = {"lsp", "lazydev", "path", "snippets", "buffer", "env", "nerdfont"},
				providers = {
					lsp = {
						name = "LSP",
						module = "blink.cmp.sources.lsp",
						score_offset = 100,
					},
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 50,
					},
					path = {
						name = "Path",
						module = "blink.cmp.sources.path",
						score_offset = 30,
					},
					buffer = {
						name = "Buffer",
						module = "blink.cmp.sources.buffer",
						score_offset = 5,
					},
					env = {
						name = "Env",
						module = "blink-cmp-env",
						score_offset = -5,
					},
					nerdfont = {
						name = "Nerd Fonts",
						module = "blink-nerdfont",
						score_offset = 15,
						opts = {insert = true},
					},
				}
			},
			fuzzy = {
				implementation = "prefer_rust_with_warning",
				sorts = {
					"exact",
					"score",
					"sort_text",
				}
			},
		},
	},
}

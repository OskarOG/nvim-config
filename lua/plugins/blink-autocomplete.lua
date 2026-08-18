return {
	{
		"saghen/blink.cmp",
		event = "VimEnter",
		version = "1.*",
		dependencies = {
			-- Snippet Engine
			{
				"L3MON4D3/LuaSnip",
				version = "2.*",
				build = (function()
					return "make install_jsregexp"
				end)(),
				dependencies = {
					-- Base setup for snippets
					{
						"rafamadriz/friendly-snippets",
						config = function()
							require("luasnip.loaders.from_vscode").lazy_load()
						end,
					},
				},
				opts = {},
			},
			"folke/lazydev.nvim",
		},
		--- @module 'blink.cmp'
		--- @type blink.cmp.Config
		opts = {
			keymap = {
				preset = "none",
				["<C-e>"] = { "show", "show_documentation", "hide_documentation" },
				["<C-q>"] = { "hide", "fallback" },
				["<CR>"] = { "accept", "fallback" },

				-- ["<Tab>"] = { "snippet_forward", "fallback" },
				-- ["<S-Tab>"] = { "snippet_backward", "fallback" },

				["<Tab>"] = { "select_next", "fallback" },
				["<S-Tab>"] = { "select_prev", "fallback" },
				-- ["<Up>"] = { "select_prev", "fallback" },
				-- ["<Down>"] = { "select_next", "fallback" },

				["<C-b>"] = { "scroll_documentation_up", "fallback" },
				["<C-f>"] = { "scroll_documentation_down", "fallback" },

				["<C-k>"] = { "show_signature", "hide_signature", "fallback" },

				-- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
				--    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
			},

			appearance = {
				-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = "mono",
			},

			completion = {
				documentation = { auto_show = true, auto_show_delay_ms = 500 },
				ghost_text = { enabled = false, show_with_menu = true },
				menu = {
					min_width = 50,
				},
			},

			sources = {
				default = { "lsp", "path", "snippets", "lazydev", "buffer" },
				providers = {
					lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
					-- snippets = {
					-- opts = {
					-- search_paths = { "~/.config/nvim/snippets" },
					-- },
					-- },
				},
			},

			snippets = { preset = "luasnip" },

			-- Blink.cmp includes an optional, recommended rust fuzzy matcher,
			-- which automatically downloads a prebuilt binary when enabled.
			--
			-- By default, we use the Lua implementation instead, but you may enable
			-- the rust implementation via `'prefer_rust_with_warning'`
			--
			-- See :h blink-cmp-config-fuzzy for more information
			fuzzy = { implementation = "lua" },

			-- Shows a signature help window while you type arguments for a function
			signature = { enabled = true },

			cmdline = {
				enabled = true,
				-- use 'inherit' to inherit mappings from top level `keymap` config
				keymap = { preset = "cmdline" },
				sources = function()
					local type = vim.fn.getcmdtype()
					-- Search forward and backward
					if type == "/" or type == "?" then
						return { "buffer" }
					end
					-- Commands
					if type == ":" or type == "@" then
						return { "cmdline" }
					end
					return {}
				end,
				completion = {
					trigger = {
						show_on_blocked_trigger_characters = {},
						show_on_x_blocked_trigger_characters = {},
					},
					list = {
						selection = {
							-- When `true`, will automatically select the first item in the completion list
							preselect = true,
							-- When `true`, inserts the completion item automatically when selecting it
							auto_insert = true,
						},
					},
					-- Whether to automatically show the window when new completion items are available
					menu = { auto_show = true },
					-- Displays a preview of the selected item on the current line
					ghost_text = { enabled = false },
				},
			},
		},
	},
	{
		"chrisgrieser/nvim-scissors",
		dependencies = "nvim-telescope/telescope.nvim", -- if using telescope
		opts = {
			snippetDir = "path/to/your/snippetFolder",
		},
	},
}

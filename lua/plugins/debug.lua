return {
	"nvim-neotest/nvim-nio",
	{
		"rcarriga/nvim-dap-ui",
		depdendencies = {
			"nvim-neotest/nvim-nio",
		},
		keys = {
			{
				"<F7>",
				function()
					require("dapui").toggle()
				end,
				desc = "Debug: Toggle DAP UI panels",
			},
		},
		opts = {
			icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
			controls = {
				icons = {
					pause = "⏸",
					play = "▶",
					step_into = "⏎",
					step_over = "⏭",
					step_out = "⏮",
					step_back = "b",
					run_last = "▶▶",
					terminate = "⏹",
					disconnect = "⏏",
				},
			},
		},
	},
	{ "jay-babu/mason-nvim-dap.nvim", opts = {} },
	{
		"mfussenegger/nvim-dap",
		depdendencies = {
			"williamboman/mason.nvim",
		},
		keys = {
			{
				"<F5>",
				function()
					require("dap").continue()
				end,
				desc = "Debug: Start/Continue",
			},
			{
				"<F10>",
				function()
					require("dap").step_into()
				end,
				desc = "Debug: Step into",
			},
			{
				"<F11>",
				function()
					require("dap").step_over()
				end,
				desc = "Debug: Step over",
			},
			{
				"<F9>",
				function()
					require("dap").step_out()
				end,
				desc = "Debug: Step out",
			},
			{
				"<leader>b",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "Debug: Toggle breakpoint",
			},
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			require("mason-nvim-dap").setup({
				automatic_installation = true,
				handlers = {},
				ensure_installed = {
					"codelldb",
				},
			})

			dap.adapters.codelldb = {
				type = "server",
				port = "${port}",
				executable = {
					command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
					args = { "--port", "${port}" },
					-- Potential fix for windows environment
					-- detached = false,
				},
			}

			require("dap.ext.vscode").load_launchjs(nil, {
				codelldb = { "c", "cpp" },
			})

			dap.listeners.after.event_initialized["dapui_config"] = dapui.open
			dap.listeners.before.event_terminated["dapui_config"] = dapui.close
			dap.listeners.before.event_exited["dapui_config"] = dapui.close
		end,
	},
}

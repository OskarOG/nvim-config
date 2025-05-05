return {
	"GustavEikaas/easy-dotnet.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		local function get_sdk_path()
			if require("easy-dotnet.extensions").isWindows() then
				return "C:\\Program Files\\dotnet\\sdk"
			else
				local home_dir = vim.fn.expand("~")
				return home_dir .. "/.dotnet/sdk"
			end
		end

		local function get_secret_path(secret_guid)
			local home_dir = vim.fn.expand("~")
			if require("easy-dotnet.extensions").isWindows() then
				return home_dir .. "\\AppData\\Roaming\\Microsoft\\UserSecrets\\" .. secret_guid .. "\\secrets.json"
			else
				return home_dir .. "/.microsoft/usersecrets/" .. secret_guid .. "/secrets.json"
			end
		end

		local easy_dotnet = require("easy-dotnet")
		easy_dotnet.setup({
			get_sdk_path = get_sdk_path,
			---@type TestRunnerOptions
			test_runner = {
				---@type "split" | "float" | "buf"
				viewmode = "float",
				enable_buffer_test_execution = true,
				noBuild = true,
				noRestore = true,
				icons = {
					passed = "",
					skipped = "",
					failed = "",
					success = "",
					reload = "",
					test = "",
					sln = "󰘐",
					project = "󰘐",
					dir = "",
					package = "",
				},
				mappings = {
					close = { lhs = "q", desc = "Close testrunner" },
					collapse_all = { lhs = "W", desc = "Collapse all" },
					debug_test = { lhs = "<leader>ddt", desc = "[d]otnet: [d]ebug [t]est" },
					debug_test_from_buffer = { lhs = "<leader>ddt", desc = "[d]otnet: [d]ebug [t]est from buffer" },
					expand = { lhs = "o", desc = "Expand" },
					expand_all = { lhs = "-", desc = "Expand all" },
					filter_failed_tests = { lhs = "<leader>dfft", desc = "[d]otnet: [f]ilter [f]ailed [t]ests" },
					go_to_file = { lhs = "dtg", desc = "Dotnet: Go to file" },
					peek_stacktrace = { lhs = "<leader>dps", desc = "[d]otnet: [p]eek [s]tack trace of failed test" },
					refresh_testrunner = { lhs = "<C-r>", desc = "Refresh testrunner" },
					run = { lhs = "<leader>drt", desc = "[d]otnet: [r]un [t]est" },
					run_test_from_buffer = { lhs = "<leader>drt", desc = "[d]otnet: [r]un [t]est from buffer" },
					run_all = { lhs = "<leader>drT", desc = "[d]otnet: [r]un all [T]ests" },
				},
				additional_args = {},
			},
			new = {
				project = {
					prefix = "sln",
				},
			},
			terminal = function(path, action, args)
				local commands = {
					run = function()
						return string.format("dotnet run --project %s %s", path, args)
					end,
					test = function()
						return string.format("dotnet test %s %s", path, args)
					end,
					restore = function()
						return string.format("dotnet restore %s %s", path, args)
					end,
					build = function()
						return string.format("dotnet build %s %s", path, args)
					end,
					watch = function()
						return string.format("dotnet watch --project %s %s", path, args)
					end,
				}

				vim.cmd("vsplit")
				vim.cmd("term " .. commands[action]() .. "\r")
			end,
			secrets = {
				path = get_secret_path,
			},
			csproj_mappings = true,
			fsproj_mappings = true,
			auto_bootstrap_namespace = {
				type = "block_scoped",
				enabled = true,
			},
			picker = "telescope",
			background_scanning = true,
		})

		vim.api.nvim_create_user_command("Secrets", function()
			easy_dotnet.secrets()
		end, {})

		vim.keymap.set("n", "C-p>", function()
			easy_dotnet.run_project()
		end, { desc = "Dotnet: Run project" })

		vim.keymap.set("n", "<C-n>", function()
			easy_dotnet.new()
		end, { desc = "Dotnet: New project" })

		vim.keymap.set("n", "<C-a>", function()
			easy_dotnet.createfile()
		end, { desc = "Dotnet: New file" })
	end,
}

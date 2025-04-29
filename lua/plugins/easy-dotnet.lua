return {
	"GustavEikaas/easy-dotnet.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		local function get_secret_path(secret_guid)
			local home_dir = vim.fn.expand("~")
			if require("easy-dotnet.extensions").isWindows() then
				return home_dir .. "\\AppData\\Roaming\\Microsoft\\UserSecrets\\" .. secret_guid .. "\\secrets.json"
			else
				return home_dir .. "/.microsoft/usersecrets/" .. secret_guid .. "/secrets.json"
			end
		end

		local function get_sdk_path()
			if require("easy-dotnet.extensions").isWindows() then
				return "C:\\Program Files\\dotnet\\sdk"
			else
				return "/home/oskarg/.dotnet/sdk"
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
					run = { lhs = "<leader>tr", desc = "Run test" },
					run_test_from_buffer = { lhs = "<leader>tr", desc = "Run test from buffer" },
					filter_failed_tests = { lhs = "<leader>tfe", desc = "Filter failed tests" },
					debug_test = { lhs = "<leader>td", desc = "Debug test" },
					debug_test_from_buffer = { lhs = "<leader>td", desc = "Debug test" },
					go_to_file = { lhs = "tg", desc = "Go to file" },
					run_all = { lhs = "<leader>tR", desc = "Run all tests" },
					peek_stacktrace = { lhs = "<leader>tp", desc = "Peek stack trace of failed test" },
					expand = { lhs = "o", desc = "Expand" },
					expand_node = { lhs = "E", desc = "Expand node" },
					expand_all = { lhs = "-", desc = "Expand all" },
					collapse_all = { lhs = "W", desc = "Collapse all" },
					close = { lhs = "q", desc = "Close testrunner" },
					refresh_testrunner = { lhs = "<C-r>", desc = "Refresh testrunner" },
				},
				additional_args = {},
			},
			new = {
				project = {
					prefix = "sln",
				},
			},
			---@param action "test" | "restore" | "build" | "run"
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

				local command = commands[action]() .. "\r"
				vim.cmd("vsplit")
				vim.cmd("term " .. command)
			end,
			secrets = {
				path = get_sdk_path,
			},
			csproj_mappings = true,
			fsproj_mappings = true,
			auto_bootstrap_namespace = {
				type = "block_scoped",
				enabled = true,
			},
			picker = "telescope",
		})

		vim.api.nvim_create_user_command("Secrets", function()
			easy_dotnet.secrets()
		end, {})

		vim.keymap.set("n", "<C-p>", function()
			easy_dotnet.run_project()
		end)
	end,
}

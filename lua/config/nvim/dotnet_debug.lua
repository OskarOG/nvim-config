local function get_dll_name(dll_path)
	local item_count = 0
	local map = {}
	for part in string.gmatch(dll_path, "([^/]+)") do
		table.insert(map, part)
		item_count = item_count + 1
	end

	return map[item_count]
end

local function get_pid(process_name)
	local output = vim.fn.system("pgrep -f " .. process_name)
	return tonumber(output)
end

vim.api.nvim_create_user_command("DotnetDebugAttachProcess", function(args)
	local dap = require("dap")

	local dll_path = vim.fn.input("Path to DLL: ", vim.fn.getcwd(), "file")
	local process_name = get_dll_name(dll_path)

	if vim.fn.filereadable(dll_path) == 0 then
		vim.notify("❌ Build your project first: " .. dll_path .. " not found", vim.log.levels.ERROR)
		return
	end

	vim.cmd('botright split | terminal dotnet "' .. dll_path .. '"')

	local attempts = 20
	local function try_attach()
		local output = vim.fn.system("pgrep -af 'dotnet .*" .. process_name .. "'")
		local pids = vim.fn.split(output, "\n")
		pids = vim.fn.filter(pids, function(pid)
			return pid ~= ""
		end)

		if #pids == 0 then
			if attempts > 0 then
				attempts = attempts - 1
				vim.defer_fn(try_attach, 300)
			else
				vim.notify(
					"⚠️ Could not find .NET process to attach to after multiple attempts",
					vim.log.levels.WARN
				)
			end
		elseif #pids == 1 then
			local splitted_pid = vim.fn.split(pids[1])
			local pid = tonumber(splitted_pid[1])
			vim.notify("✅ Attaching to process PID: " .. pid)
			dap.run({
				type = "coreclr",
				name = "Attach - Auto",
				request = "attach",
				processId = pid,
			})
		else
			local choices = {}
			for i, pid in ipairs(pids) do
				table.insert(choices, string.format("%d: %s", i, pid))
			end

			local choice = vim.fn.inputlist(choices)

			local pid = tonumber(vim.fn.split(choice[1]))
			vim.notify("✅ Attaching to process PID: " .. pid)
			dap.run({
				type = "coreclr",
				name = "Attach - Auto",
				request = "attach",
				processId = pid,
			})
		end
	end

	vim.defer_fn(try_attach, 200)
end, { desc = "Dotnet: Run a debugging session by attaching to a process" })

-- vim.keymap.set("n", "<leader>db", function()
-- local dap = require("dap")

-- local dll_path = vim.fn.input("Path to DLL: ", vim.fn.getcwd(), "file")
-- local process_name = get_dll_name(dll_path)

-- if vim.fn.filereadable(dll_path) == 0 then
-- vim.notify("❌ Build your project first: " .. dll_path .. " not found", vim.log.levels.ERROR)
-- return
-- end

-- vim.cmd('botright split | terminal dotnet "' .. dll_path .. '"')

-- local attempts = 20
-- local function try_attach()
-- local output = vim.fn.system("pgrep -af 'dotnet .*" .. process_name .. "'")
-- local pids = vim.fn.split(output, "\n")
-- pids = vim.fn.filter(pids, function(pid)
-- return pid ~= ""
-- end)

-- if #pids == 0 then
-- if attempts > 0 then
-- attempts = attempts - 1
-- vim.defer_fn(try_attach, 300)
-- else
-- vim.notify(
-- "⚠️ Could not find .NET process to attach to after multiple attempts",
-- vim.log.levels.WARN
-- )
-- end
-- elseif #pids == 1 then
-- local splitted_pid = vim.fn.split(pids[1])
-- local pid = tonumber(splitted_pid[1])
-- vim.notify("✅ Attaching to process PID: " .. pid)
-- dap.run({
-- type = "coreclr",
-- name = "Attach - Auto",
-- request = "attach",
-- processId = pid,
-- })
-- else
-- local choices = {}
-- for i, pid in ipairs(pids) do
-- table.insert(choices, string.format("%d: %s", i, pid))
-- end

-- local choice = vim.fn.inputlist(choices)

-- local pid = tonumber(vim.fn.split(choice[1]))
-- vim.notify("✅ Attaching to process PID: " .. pid)
-- dap.run({
-- type = "coreclr",
-- name = "Attach - Auto",
-- request = "attach",
-- processId = pid,
-- })
-- end
-- end

-- vim.defer_fn(try_attach, 200)
-- end, { desc = "Start .NET app and attach debugger" })

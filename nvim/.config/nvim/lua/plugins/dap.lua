local dap = require("dap")
local dapui = require("dapui")
local mason = require("mason-nvim-dap")

dap.adapters.elixir = {
	type = "executable",
	command = "elixir-ls-debugger", -- debugger.bat for windows
	args = {},
}

dap.configurations.elixir = {
	{
		type = "elixir",
		name = "mix test",
		task = "test",
		taskArgs = { "--trace" },
		request = "launch",
		startApps = true, -- for Phoenix projects
		projectDir = "${workspaceFolder}",
		requireFiles = {
			"test/**/test_helper.exs",
			"test/**/*_test.exs",
		},
	},
}


mason.setup({
	automatic_installation = true,
})

dapui.setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

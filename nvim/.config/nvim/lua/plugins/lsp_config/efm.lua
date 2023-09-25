local efm_fs = require("efmls-configs.fs")

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local get_python_venv_exec = function(name)
	local local_bin_path = ".venv/bin"
	local path = string.format("%s/%s/%s", vim.loop.cwd(), local_bin_path, name)

	if vim.fn.filereadable(path) == 0 then
		path = efm_fs.executable(name)
	end

	return path
end

local black = require("efmls-configs.formatters.black")

local flake8 = vim.tbl_extend("force", require("efmls-configs.linters.flake8"), {
	lintCommand = string.format("%s --max-line-length 88 --extend-ignore E203 -", get_python_venv_exec("flake8")),
})

local pylint = vim.tbl_extend("force", require("efmls-configs.linters.pylint"), {
	lintCommand = string.format(
		"% --score=no --max-line-length 88 --disable W1203 ${INPUT}",
		get_python_venv_exec("pylint")
	),
})

return {
	settings = {
		rootMarkers = { ".git/" },
		languages = {
			python = {
				black,
				flake8,
				pylint,
			},
		},
	},
	filetypes = { 'python' },
	init_options = { documentFormatting = true },
}

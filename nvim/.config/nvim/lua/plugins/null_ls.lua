local null_ls = require("null-ls")
local mason_null_ls = require("mason-null-ls")
local lspconfig = require("plugins.lsp_config")

null_ls.setup({
	on_attach = lspconfig.on_attach,
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.pg_format,
		null_ls.builtins.diagnostics.credo,
		-- null_ls.builtins.diagnostics.selene.with({
		-- 	cwd = function(_params)
		-- 		return vim.fs.dirname(
		-- 			vim.fs.find({ "selene.toml" }, { upward = true, path = vim.api.nvim_buf_get_name(0) })[1]
		-- 		) or vim.fn.expand("~/.config/selene/") -- fallback value
		-- 	end,
		-- }),
		null_ls.builtins.diagnostics.flake8.with({
			extra_args = { "--max-line-length", "88", "--extend-ignore", "E203" },
			prefer_local = ".venv/bin",
		}),
		null_ls.builtins.diagnostics.pylint.with({
			extra_args = { "--max-line-length", "88", "--disable", "W1203" },
			prefer_local = ".venv/bin",
		}),
	},
})

mason_null_ls.setup({
	automatic_installation = true,
})

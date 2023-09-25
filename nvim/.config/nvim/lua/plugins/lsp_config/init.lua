local mason = require("mason-lspconfig")
local lspconfig = require("lspconfig")

local jsonls_config = require("plugins.lsp_config.jsonls")
local efm_config = require("plugins.lsp_config.efm")
local templ_config = require("plugins.lsp_config.templ")

local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "<space>f", function()
		vim.lsp.buf.format({ async = true })
	end, bufopts)
end

mason.setup({
	automatic_installation = true,
})

local servers = {
	lua_ls = {
		on_attach = function(client)
			client.server_capabilities.document_formatting = false
			client.server_capabilities.document_range_formatting = false
		end,
		settings = {
			Lua = {
				format = {
					enable = false,
				},
				workspace = {
					userThirdParty = { vim.fn.expand("$HOME/.config/nvim/sumneko_lua_envs") },
				},
			},
		},
	},
	pyright = {},
	cssls = {},
	elixirls = {},
	eslint = {},
	fsautocomplete = {},
	gopls = {},
    templ = {},
	groovyls = {},
	html = {},
	jdtls = {},
	jsonls = {
		settings = {
			json = {
				schemas = jsonls_config.schemas,
			},
		},
	},
	omnisharp = {},
	r_language_server = {},
	rnix = {},
	rust_analyzer = {},
	bashls = {},
	solargraph = {},
	sqlls = {},
	stylelint_lsp = {},
	terraformls = {},
	tsserver = {},
	lemminx = {},
	yamlls = {},
	vimls = {},
	powershell_es = {},
	efm = efm_config,
}

for server, options in pairs(servers) do
    local server_setup = {
		capabilities = require("cmp_nvim_lsp").default_capabilities(
			vim.tbl_extend("force", vim.lsp.protocol.make_client_capabilities(), options.capabilities or {})
		),
		on_attach = function(client, bufnr)
			if options.on_attach then
				options.on_attach(client, bufnr)
			end

			on_attach(client, bufnr)
		end,
		settings = options.settings,
    }
    if options.filetypes then
        server_setup.filetypes = options.filetypes
    end
    if options.init_options then
        server_setup.init_options = options.init_options
    end
	lspconfig[server].setup(server_setup)
end

return {
	on_attach = on_attach,
}

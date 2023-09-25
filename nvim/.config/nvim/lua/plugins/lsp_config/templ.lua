local lspconfig = require("lspconfig")
local configs = require("lspconfig.configs")
local path = require("mason-core.path")
local process = require("mason-core.process")

configs.templ = {
  default_config = {
    cmd = {  "templ", "lsp", "-log=/tmp/templ-lsp.log" },
    filetypes = { 'templ' },
    root_dir = lspconfig.util.root_pattern("go.mod", ".git"),
    settings = {},
  };
}

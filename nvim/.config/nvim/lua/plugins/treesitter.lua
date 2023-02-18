require("nvim-treesitter.configs").setup({
	ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	highlight = {
		enable = true, -- false will disable the whole extension
	},
	playground = {
		enable = true,
	},
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.rego = {
	install_info = {
		url = "~/git_projects/tree-sitter-rego", -- local path or git repo
		files = { "src/parser.c" },
	},
	-- filetype = "rego", -- if filetype does not agrees with parser name
}

local ft_to_parser = require("nvim-treesitter.parsers").filetype_to_parsername
ft_to_parser.rmd = "markdown"

local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	use("folke/neodev.nvim")

	use("tpope/vim-fugitive")
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	})

	use({
		"nvim-lualine/lualine.nvim",
		config = function()
			require("plugins.lualine")
		end,
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		config = function()
			require("plugins.treesitter")
		end,
	})
	use("nvim-treesitter/playground")

	use("L3MON4D3/LuaSnip")

	use("FooSoft/vim-argwrap")
	use("rhysd/vim-grammarous")
	use({
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup({})
		end,
	})

	use("gpanders/editorconfig.nvim")
	use("elkowar/yuck.vim")

	use({
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	})

	use({
		"neovim/nvim-lspconfig",
		requires = { "williamboman/mason-lspconfig.nvim", "williamboman/mason.nvim", "creativenull/efmls-configs-nvim" },
		after = { "mason.nvim", "mason-lspconfig.nvim", "nvim-cmp" },
		config = function()
			require("plugins.lsp_config")
		end,
	})

    -- use({
	-- 	"jose-elias-alvarez/null-ls.nvim",
	-- 	requires = { "nvim-lua/plenary.nvim", "jayp0521/mason-null-ls.nvim" },
	-- 	after = { "mason.nvim", "nvim-lspconfig" },
	-- 	config = function()
	-- 		require("plugins.null_ls")
	-- 	end,
	-- })

	use({
		"mfussenegger/nvim-dap",
		requires = { "rcarriga/nvim-dap-ui", "jayp0521/mason-nvim-dap.nvim" },
		after = { "mason.nvim" },
		config = function()
			require("plugins.dap")
		end,
	})

	use({
		"hrsh7th/nvim-cmp",
		requires = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-path", "saadparwaiz1/cmp_luasnip" },
		config = function()
			require("plugins.cmp")
		end,
	})

	use({
		"nvim-neotest/neotest",
		requires = {
			"jfpedroza/neotest-elixir",
			"nvim-neotest/neotest-python",
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("plugins.neotest")
		end,
	})

	use({
		"andythigpen/nvim-coverage",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("coverage").setup()
		end,
	})

	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use({
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup({})
		end,
	})

	use({
		"epwalsh/obsidian.nvim",
		config = function()
			require("plugins.obsidian")
		end,
	})

	use({
		"nvim-neorg/neorg",
		requires = { { "nvim-lua/plenary.nvim" } },
		run = ":Neorg sync-parsers",
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {},
					["core.dirman"] = {
						config = {
							workspaces = {
								home = "~/Documents/Notes",
								work = "~/Work/Documents/Notes",
							},
							default_workspace = "home",
						},
					},
					["core.concealer"] = {},
					["core.completion"] = {
						config = {
							engine = "nvim-cmp",
						},
					},
				},
			})
		end,
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end)

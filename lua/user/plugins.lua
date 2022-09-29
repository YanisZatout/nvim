local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here

	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/plenary.nvim") -- Useful lua functions used by lots of plugins
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
	use("numToStr/Comment.nvim")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("kyazdani42/nvim-web-devicons")
	use("kyazdani42/nvim-tree.lua")
	use("akinsho/bufferline.nvim")
	use("moll/vim-bbye")
	use("nvim-lualine/lualine.nvim")
	use("akinsho/toggleterm.nvim")
	use("ahmedkhalf/project.nvim")
	use("lewis6991/impatient.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use("folke/which-key.nvim")
	use("hrsh7th/cmp-cmdline")
	use("nvim-lua/popup.nvim")
	-- Colorschemes
	--	use({ "folke/tokyonight.nvim" })
	use({ "lunarvim/darkplus.nvim" })
	--	use("LunarVim/horizon.nvim")
	--	use({ "LunarVim/onedarker.nvim" })

	-- Startup stuff
	use("goolord/alpha-nvim")
	use({ "glepnir/dashboard-nvim" })
	-- cmp plugins
	use({ "hrsh7th/nvim-cmp" }) -- The completion plugin
	use({ "hrsh7th/cmp-buffer" }) -- buffer completions
	use({ "hrsh7th/cmp-path" }) -- path completions
	use({ "saadparwaiz1/cmp_luasnip" }) -- snippet completions
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-nvim-lua" })
	-- COPILOT EQUIVALENT --
	--[[ use 'vappolinario/cmp-clippy' ]]

	-- snippets
	use({ "L3MON4D3/LuaSnip" }) --snippet engine
	use({ "rafamadriz/friendly-snippets" }) -- a bunch of snippets to use

	-- LSP
	use({ "neovim/nvim-lspconfig" }) -- enable LSP
	use({ "williamboman/nvim-lsp-installer" }) -- simple to use language server installer
	use({ "jose-elias-alvarez/null-ls.nvim" }) -- for formatters and linters

	-- Telescope
	use({ "nvim-telescope/telescope.nvim" })

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		--[[ commit = "518e27589c0463af15463c9d675c65e464efc2fe", ]]
	})

	use({
		"TimUntersberger/neogit",
		requires = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
		},
		commit = "92fa410c2edcb407fa92b454dc9e9b7d7a185fd6",
	})
	-- Git
	use({ "lewis6991/gitsigns.nvim" })

	use("p00f/nvim-ts-rainbow")
	use("nvim-treesitter/playground")

	use("ggandor/lightspeed.nvim")
	use("petertriho/nvim-scrollbar")
	use("karb94/neoscroll.nvim") -- Smoothe scroll
	use("Pocco81/HighStr.nvim")
	use("nacro90/numb.nvim")

	use("simrat39/symbols-outline.nvim")
	use("mfussenegger/nvim-dap")
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
	use("theHamsta/nvim-dap-virtual-text")
	use("mfussenegger/nvim-dap-python")
	use("nvim-telescope/telescope-dap.nvim")
	use("Pocco81/DAPInstall.nvim")
	use("jbyuki/one-small-step-for-vimkind")
	use({ -- Incremental rename
		"smjonas/inc-rename.nvim",
		config = function()
			require("inc_rename").setup()
		end,
	})

	use("nvim-treesitter/nvim-treesitter-textobjects")
	use({ "EdenEast/nightfox.nvim" })
	use({
		"ThePrimeagen/refactoring.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
			{ "nvim-telescope/telescope.nvim" },
		},
	})
	use({ "lervag/vimtex" })
	use("RRethy/vim-illuminate")
	use("SmiteshP/nvim-navic")
	use("tiagovla/scope.nvim")
	-- NAVIGATION UTILITIES --
	use({
		"abecodes/tabout.nvim",
	})
	-- TODO SEARCHER --
	use("folke/todo-comments.nvim")
	-- Put this at the end after all plugins
	use("nvim-treesitter/nvim-treesitter-context")
	-- Improved search
	use("junegunn/vim-slash")
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)

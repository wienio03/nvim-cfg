local ensure_packer = function()
	local fn = vim.fn
	--this part of the code ensures correct installation on windows and linux-
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() --if packer was just installed its true

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
  ]])

local status, packer = pcall(require, "packer")
--checks if packer is there to be required
if not status then
	return
end

return packer.startup(function(use)
	use("wbthomason/packer.nvim")
	use("tpope/vim-surround")
	use("rose-pine/neovim")
	use("vim-scripts/ReplaceWithRegister")
	use("nvim-lua/plenary.nvim")
	use("nvim-tree/nvim-tree.lua")
	use("nvim-lualine/lualine.nvim")
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use({ "glepnir/lspsaga.nvim", branch = "main" })
	use("onsails/lspkind.nvim")
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-tresitter.install").update({ with_sync = true })
		end,
	})
	use("windwp/nvim-autopairs")
	use("norcalli/nvim-colorizer.lua")
	use("stevearc/dressing.nvim")
  use("NLKNguyen/papercolor-theme")
	use("lukas-reineke/indent-blankline.nvim")
	use({ "akinsho/toggleterm.nvim", tag = "*" })
	use("mbbill/undotree")
	if packer_bootstrap then
		require("packer").sync()
	end
end)

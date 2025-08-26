-- Plugins gestionados por lazy.nvim
return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = function()
      return require("configs.telescope")
    end,
  },
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate", "MasonUninstallAll" },
    opts = function()
      return require("configs.mason")
    end,
    config = function(_, opts)
      require("mason").setup(opts)
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
     version = "*",
     lazy = false,
     dependencies = {
     "nvim-tree/nvim-web-devicons",
     },
     opts = function()
	return require("configs.nvimtree")
     end,
     config = function(_, opts)
        require("nvim-tree").setup(opts)
     end,
  },


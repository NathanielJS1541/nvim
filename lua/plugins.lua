return require("packer").startup(function()
  -- Packer can manage itself
  use "wbthomason/packer.nvim"

  use {"lewis6991/hover.nvim", config = function()
    require("hover").setup{
      init = function()
        -- Require providers
        require("hover.providers.lsp")
        -- require("hover.providers.gh")
        -- require("hover.providers.man")
        -- require("hover.providers.dictionary")
      end,
      preview_opts = {
        border = nil
      },
      title = true
    }
  end}
  
  use {
    "nvim-telescope/telescope.nvim",
    requires = { {"nvim-lua/plenary.nvim"}, {"nvim-tree/nvim-web-devicons"} }
  }
  
  use {"nvim-telescope/telescope-fzf-native.nvim", run = "make" }

  use {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
    ft = { "markdown" },
  }

  use {
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons", -- optional, for file icons
    },
    tag = "nightly" -- optional, updated every week. (see issue #1193)
  }

  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate"
  }
  
  use {"lukas-reineke/indent-blankline.nvim"}

  use {
    "nvim-lualine/lualine.nvim",
    requires = { "nvim-tree/nvim-web-devicons", opt = true }
  }
  
  use {
    "romgrk/barbar.nvim",
    requires = {"nvim-tree/nvim-web-devicons"},
    requires = {"lewis6991/gitsigns.nvim"}
  }

  use {"tjdevries/colorbuddy.vim"}

  use {"dracula/vim", as = "dracula"}
  
  use {"EdenEast/nightfox.nvim"}

  use {"neovim/nvim-lspconfig"}

  use {"neoclide/coc.nvim", branch = "release"}

  -- Coc Language Servers
  use {"fannheyward/coc-rust-analyzer", run = "yarn install --frozen-lockfile"}
  use {"yaegassy/coc-ruff", run = "yarn install --frozen-lockfile"}

end)

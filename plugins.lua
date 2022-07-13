local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  -- use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
   use'nvim-lua/plenary.nvim'
   use'nvim-telescope/telescope.nvim'
   use'nvim-treesitter/nvim-treesitter'
   use'BurntSushi/ripgrep'

   use'EdenEast/nightfox.nvim'
   use'jdhao/better-escape.vim'

   use'airblade/vim-gitgutter'
   use'kyazdani42/nvim-web-devicons'
   use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
   use'karb94/neoscroll.nvim'


   use "hrsh7th/nvim-cmp" -- The completion plugin
   use "hrsh7th/cmp-buffer" -- buffer completions
   use "hrsh7th/cmp-path" -- path completions
   use "hrsh7th/cmp-cmdline" -- cmdline completions
   use "saadparwaiz1/cmp_luasnip" -- snippet completions
   use "hrsh7th/cmp-nvim-lsp"
   use "hrsh7th/cmp-nvim-lua"

   use "L3MON4D3/LuaSnip" --snippet engine
   use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

   use'neovim/nvim-lspconfig'
   use "williamboman/nvim-lsp-installer" -- simple to use language server installer


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

vim.cmd('colorscheme nightfox')


require('nightfox').setup({
  options = {
    -- Compiled file's destination location
    compile_path = vim.fn.stdpath("cache") .. "/nightfox",
    compile_file_suffix = "_compiled", -- Compiled file suffix
    transparent = false,    -- Disable setting background
    terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
    dim_inactive = false,   -- Non focused panes set to alternative background
    styles = {              -- Style to be applied to different syntax groups
      comments = "NONE",    -- Value is any valid attr-list value `:help attr-list`
      conditionals = "NONE",
      constants = "NONE",
      functions = "NONE",
      keywords = "NONE",
      numbers = "NONE",
      operators = "NONE",
      strings = "NONE",
      types = "NONE",
      variables = "NONE",
    },
    inverse = {             -- Inverse highlight for different types
      match_paren = false,
      visual = false,
      search = false,
    },
  },
    palettes = {
        nordfox = {
            comment = "#70829a",
            -- comment = "#ffffff",
          },
    }
})

require('neoscroll').setup({
    mappings = {},
    easing_function = 'sine',
})

local actions = require("telescope.actions")
require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ['<C-e>'] = false, 
        ['<C-e>'] = actions.move_selection_previous,
        ['<C-x>'] = false,
        ['<C-x>'] = actions.move_selection_next,
        ['<C-u>'] = false,
      },
    },
  }
}

require('bufferline').setup()
















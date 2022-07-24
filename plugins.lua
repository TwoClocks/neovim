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
  use 'wbthomason/packer.nvim' -- Have packer manage itself
  use 'nvim-lua/popup.nvim' -- An implementation of the Popup API from vim in Neovim
  use 'nvim-lua/plenary.nvim' -- Useful lua functions used ny lots of plugins
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter


  -- color
  use 'EdenEast/nightfox.nvim'

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lua"
  use "hrsh7th/cmp-nvim-lsp"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use


  -- LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "neovim/nvim-lspconfig" -- enable LSP
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for


  -- Telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use 'BurntSushi/ripgrep'


  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "p00f/nvim-ts-rainbow"
  -- use "nvim-treesitter/playground"

  use 'karb94/neoscroll.nvim'
  use 'airblade/vim-gitgutter'

  use 'kyazdani42/nvim-web-devicons'
  use { 'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons' }


  use "terrortylor/nvim-comment"
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'


  -- for ftplugin / indent, etc
  use 'ziglang/zig.vim'
  use 'simrat39/rust-tools.nvim'
  use 'xiyaowong/nvim-cursorword'
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

require('nvim_comment').setup()
-- require('nvim_cursorword').setup()

require('nightfox').init({
  dim_inactive = true, -- Non focused panes set to alternative background
})



local override = require('nightfox').override

override.palettes({
  nordfox = {
    comment = "#8092aa",
    comments = "#8092aa",
    -- comment = "#ffffff",
    -- comments = "#ffffff",
  },
})

vim.cmd('colorscheme nordfox')
vim.cmd('hi default CursorWord cterm=underline gui=underline')

require('neoscroll').setup({
  mappings = {},
  easing_function = 'sine',
})


require('bufferline').setup()

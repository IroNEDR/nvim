require("netwe.remap")
require("netwe.set")
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    "folke/which-key.nvim",
    { "folke/neoconf.nvim", cmd = "Neoconf" },
    "folke/neodev.nvim",
    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme kanagawa]])
        end,
    },
    { 
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function () 
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = { "c", "lua", "vim", "vimdoc", "javascript", "typescript", "go", "rust", "query", "heex", "javascript", "html" },
            sync_install = false,
            prefer_git = true,
            highlight = { enable = true },
            indent = { enable = true },  
            })
        end
    },
    "nvim-lua/plenary.nvim",
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {'L3MON4D3/LuaSnip'},
    { 'ThePrimeagen/harpoon', branch= 'harpoon2',
      dependencies = { "nvim-lua/plenary.nvim"}
    },
    "tpope/vim-fugitive",
    "github/copilot.vim",
    "ray-x/go.nvim",
    "ray-x/guihua.lua",
    --{ "vhyrro/luarocks.nvim", priority = 1000, config = true, },
    {
        "nvim-neorg/neorg",
       -- dependencies = { "luarocks.nvim" },
        lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
        tag = "v7.0.0", -- Pin Neorg to the latest stable release
       -- config = true,
    }

})

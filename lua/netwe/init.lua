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
    { "vhyrro/luarocks.nvim", priority = 1000, config = true, },
    { "nvim-neotest/nvim-nio" },
    { "pysan3/pathlib.nvim" },
    {
        "nvim-neorg/neorg",
        dependencies = { "luarocks.nvim" },
        lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
        version = "*",
    },
    {
     "hedyhli/outline.nvim",
      config = function()
        -- Example mapping to toggle outline
        vim.keymap.set("n", "<leader>mm", "<cmd>Outline<CR>",
          { desc = "Toggle Outline" })

        require("outline").setup {
          -- Your setup opts here (leave empty to use defaults)
        }
      end,
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    }
})

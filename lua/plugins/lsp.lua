return {
  -- Mason
  {
    "mason-org/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup({
        ui = { border = "rounded" },
        registries = {
          "github:mason-org/mason-registry",
          "github:Crashdummyy/mason-registry",  -- registry roslyn
        },
      })
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "pyright",   -- Python
          "gopls",     -- Go
          "clangd",    -- C/C++
          "lua_ls",    -- Lua
          -- C# : on utilise csharp_ls en manuel via F8, ou omnisharp via mason
          -- "omnisharp",
        },
        automatic_installation = true,
      })
    end,
  },

  -- LSP config
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      require("configs.lsp")
    end,
  },

  -- lsp_signature
  {
    "ray-x/lsp_signature.nvim",
    event = "LspAttach",
    config = function()
      require("lsp_signature").setup({
        bind = true,
        floating_window = true,
        hint_enable = true,
        hi_parameter = "IncSearch",
        handler_opts = { border = "rounded" },
      })
    end,
  },

  -- Rust (rustaceanvim gere rust-analyzer, pas lspconfig)
  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    lazy = false,
  },

  -- Conform (formatter)
  {
    "stevearc/conform.nvim",
    config = function()
      require("configs.conform")
    end,
  },

  -- nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      require("configs.cmp")
    end,
  },

  -- rosly-ls
  {
    "seblyng/roslyn.nvim",
    ft = "cs",
    opts = {},
  },
}

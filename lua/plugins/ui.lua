return {
  -- Colorscheme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({ style = "night" })
      vim.cmd.colorscheme("tokyonight")
    end,
  },

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = { theme = "tokyonight" },
      })
    end,
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    config = function()
      require("nvim-treesitter").setup({
        ensure_installed = {
          "lua", "python", "rust", "go", "c", "cpp", "c_sharp",
          "javascript", "typescript", "json", "toml", "yaml",
          "markdown", "bash",
        },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },

  -- Which-key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = true,
  },

  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "BufReadPost",
    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers",
          separator_style = "slant",
          show_buffer_close_icons = true,
          show_close_icon = false,
        },
      })
    end,
  },
}

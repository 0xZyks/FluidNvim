return {
  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope",
  },

  -- Oil (file explorer)
  {
    "stevearc/oil.nvim",
    lazy = false,
    opts = {
      default_file_explorer = true,
      view_options = { show_hidden = true },
      keymaps = {
        ["g?"]    = "actions.show_help",
        ["<CR>"]  = "actions.select",
        ["<C-s>"] = "actions.select_vsplit",
        ["<C-h>"] = "actions.select_split",
        ["<C-t>"] = "actions.select_tab",
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = "actions.close",
        ["<C-l>"] = "actions.refresh",
        ["-"]     = "actions.close",
        ["<BS>"]  = "actions.parent",
        ["_"]     = "actions.open_cwd",
        ["`"]     = "actions.cd",
        ["~"]     = "actions.tcd",
        ["g."]    = "actions.toggle_hidden",
      },
    },
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
  },

  -- Toggleterm
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    lazy = false,
    config = function()
      require("toggleterm").setup({
        size = 20,
        direction = "float",
        float_opts = { border = "curved" },
      })
    end,
  },

  -- Autoclose pairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },

  -- Comments
  {
    "numToStr/Comment.nvim",
    event = "BufReadPost",
    config = true,
  },

  -- Gitsigns
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPost",
    config = true,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    lazy = false,
    keys = {
      { "<leader>e", "<cmd>Neotree toggle<CR>", desc = "Toggle Neotree" },
    },
    config = function()
      require("neo-tree").setup({
        window = { width = 30 },
        filesystem = {
          follow_current_file = { enabled = true },  -- suit le fichier ouvert
          use_libuv_file_watcher = true,
          filtered_items = { hide_dotfiles = false },
        },
      })
    end,
  },
}

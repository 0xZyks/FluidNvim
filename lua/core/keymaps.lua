vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

-- General
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })
map("n", "<Esc>", "<cmd>nohl<CR>", { desc = "Clear search highlight" })
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save" })

-- Navigation
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Windows
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")
map("n", "<leader>sv", "<cmd>vsplit<CR>", { desc = "Split vertical" })
map("n", "<leader>sh", "<cmd>split<CR>", { desc = "Split horizontal" })
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close split" })

-- Buffers
map("n", "<A-Left>", "<cmd>bprev<CR>", { desc = "Previous buffer" })
map("n", "<A-Right>", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>q", "<cmd>bd<CR>", { desc = "Close current buffer" })

-- Visual
map("v", "<", "<gv")
map("v", ">", ">gv")
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Terminal
map({ "n", "t" }, "<C-\\>", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })
map("n", "<F4>", "<cmd>ToggleTerm direction=float<CR>", { desc = "Terminal float" })
map("n", "<F5>", "<cmd>ToggleTerm size=10 direction=horizontal<CR>", { desc = "Terminal horizontal" })
map("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

-- Oil
map("n", "-", "<cmd>Oil<CR>", { desc = "Open Oil" })

-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Buffers" })
map("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Recent files" })

-- LSP diagnostics
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Diagnostics" })

-- Format
map("n", "<leader>fm", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format file" })

-- 42 Header
map("n", "<F1>", function()
  if vim.api.nvim_buf_line_count(0) <= 1 then
    vim.cmd("Stdheader")
  end
end, { desc = "Add 42 Header" })

-- F3 visual -> block comment
map("v", "<F3>", function()
  require("Comment.api").toggle.blockwise(vim.fn.visualmode())
end, { desc = "Toggle block comment" })

-- C# LSP manuel
map("n", "<F8>", function()
  vim.lsp.start({
    name = "csharp_ls",
    cmd = { vim.fn.expand("~/.dotnet/tools/csharp-ls") },
    root_dir = vim.fn.getcwd(),
  })
end, { desc = "Start C# LSP" })

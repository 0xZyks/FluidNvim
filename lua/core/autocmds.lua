local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
autocmd("TextYankPost", {
  group = augroup("YankHighlight", { clear = true }),
  callback = function() vim.highlight.on_yank() end,
})

-- Remove trailing whitespace on save
autocmd("BufWritePre", {
  group = augroup("TrimWhitespace", { clear = true }),
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

-- Indentation 2 espaces pour ces filetypes
autocmd("FileType", {
  group = augroup("IndentSettings", { clear = true }),
  pattern = { "lua", "javascript", "typescript", "html", "css", "json", "yaml" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})

-- Ouvre Neotree au lancement
autocmd("VimEnter", {
  group = augroup("NeoTreeOpen", { clear = true }),
  callback = function()
    require("neo-tree.command").execute({ action = "show" })
  end,
})

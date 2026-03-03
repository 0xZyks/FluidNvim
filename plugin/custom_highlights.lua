local function set_custom_highlights()
  -- Variables
  vim.api.nvim_set_hl(0, "@variable",            { fg = "#ffb86c" })
  vim.api.nvim_set_hl(0, "@variable.parameter",  { fg = "#ffb86c" })
  vim.api.nvim_set_hl(0, "@variable.member",     { fg = "#ffb86c" })
  vim.api.nvim_set_hl(0, "@lsp.type.variable",   { fg = "#ffb86c" })
  vim.api.nvim_set_hl(0, "@lsp.type.parameter",  { fg = "#ffb86c" })

  -- Fields / Properties
  vim.api.nvim_set_hl(0, "@field",               { fg = "#7aa2f7" })
  vim.api.nvim_set_hl(0, "@property",            { fg = "#7aa2f7" })
  vim.api.nvim_set_hl(0, "@lsp.type.field",      { fg = "#7aa2f7" })
  vim.api.nvim_set_hl(0, "@lsp.type.property",   { fg = "#7aa2f7" })

  -- Popup menu (autocompletion)
  vim.api.nvim_set_hl(0, "Pmenu",      { bg = "#1a1b2e", fg = "#c0caf5" })
  vim.api.nvim_set_hl(0, "PmenuSel",   { bg = "#364A82", fg = "#c0caf5" })
  vim.api.nvim_set_hl(0, "PmenuSbar",  { bg = "#1a1b2e" })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#364A82" })
end

set_custom_highlights()

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = set_custom_highlights,
})

return {}

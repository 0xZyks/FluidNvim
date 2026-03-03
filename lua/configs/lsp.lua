local capabilities = require("cmp_nvim_lsp").default_capabilities()

local on_attach = function(_, bufnr)
  local map = function(keys, func, desc)
    vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
  end

  map("gd",         vim.lsp.buf.definition,     "Go to definition")
  map("gD",         vim.lsp.buf.declaration,     "Go to declaration")
  map("gr",         vim.lsp.buf.references,      "References")
  map("gi",         vim.lsp.buf.implementation,  "Implementation")
  map("K",          vim.lsp.buf.hover,           "Hover docs")
  map("<leader>rn", vim.lsp.buf.rename,          "Rename")
  map("<leader>ca", vim.lsp.buf.code_action,     "Code action")
  map("<leader>ds", vim.lsp.buf.document_symbol, "Document symbols")
end

-- Rust est géré par rustaceanvim, pas lspconfig
vim.g.rustaceanvim = {
  server = {
    capabilities = capabilities,
    on_attach = on_attach,
  },
}

-- API moderne nvim 0.11+
vim.lsp.config("pyright", {
  capabilities = capabilities,
  on_attach = on_attach,
})

vim.lsp.config("gopls", {
  capabilities = capabilities,
  on_attach = on_attach,
})

vim.lsp.config("clangd", {
  capabilities = capabilities,
  on_attach = on_attach,
})

vim.lsp.config("lua_ls", {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
})

vim.lsp.enable({ "pyright", "gopls", "clangd", "lua_ls" })

require("conform").setup({
  formatters_by_ft = {
    python = { "black" },
    go     = { "gofmt" },
    c      = { "clang_format" },
    cpp    = { "clang_format" },
    cs     = { "csharpier" },
    lua    = { "stylua" },
    rust   = { "rustfmt" },
  },
  format_on_save = false, -- passe a true si tu veux auto-format
})

local M = {}

function M.setup()
  local formatters = require "lvim.lsp.null-ls.formatters"
  local linters = require "lvim.lsp.null-ls.linters"

  formatters.setup {
    { name = "beautysh" },
    {
      command = "prettierd",
      filetypes = { "typescript", "typescriptreact", "html" },
    },
  }

  linters.setup {
    { name = "eslint_d" },
    { command = "shellcheck" },
  }
end

return M

local M = {}

function M.setup()
  vim.opt.foldenable = false
  vim.opt.foldmethod = "expr" -- folding set to "expr" for treesitter based folding
  vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
  vim.opt.relativenumber = true -- set relative numbered lines
end

return M

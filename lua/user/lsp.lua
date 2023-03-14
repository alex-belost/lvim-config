local M = {}

function M.setup()
  require("lvim.lsp.manager").setup("stylelint_lsp", {
    filetypes = { "scss", "css" },
    settings = {
      stylelintplus = {
        trace = { server = "messages" },
        validateOnType = true,
        autoFixOnFormat = true,
      }
    }
  })

  require("lvim.lsp.manager").setup("emmet_ls", {
    init_options = {
      html = {
        options = {
          ["bem.enabled"] = true,
          ['bem.element'] = '__',
          ['bem.modifier'] = '--',
        },
      },
    }
  })

  -- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
  -- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
  lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
    return server ~= "angularls"
  end, lvim.lsp.automatic_configuration.skipped_servers)

  -- -- you can set a custom on_attach function that will be used for all the language servers
  -- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
  -- lvim.lsp.on_attach_callback = function(client, bufnr)
  --   local function buf_set_option(...)
  --     vim.api.nvim_buf_set_option(bufnr, ...)
  --   end
  --   --Enable completion triggered by <c-x><c-o>
  --   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
  -- end
end

return M

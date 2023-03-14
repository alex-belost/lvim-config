local M = {}

function M.setup()
  -- TODO: User Config for predefined plugins
  -- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
  lvim.log.level = "warn"
  lvim.colorscheme = "lunar"
  lvim.format_on_save.enabled = false
  -- lvim.transparent_window = false -- enable/disable transparency
  lvim.builtin.alpha.active = true
  lvim.builtin.alpha.mode = "dashboard"
  lvim.builtin.terminal.active = true
  lvim.builtin.telescope.pickers = {
    -- find_files = {
    --   previewer = true
    -- },
    buffers = {
      breviewer = true
    }
  }
  lvim.builtin.nvimtree.setup.view.side = "left"
  lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
  lvim.builtin.nvimtree.setup.view.adaptive_size = true
  lvim.builtin.nvimtree.setup.view.centralize_selection = true
  lvim.builtin.nvimtree.setup.view.update_focused_file = true


  lvim.builtin.tabnine = { active = true } -- change to false if you don't like tabnine
  -- lvim.builtin.harpoon = { active = true } -- use the harpoon plugin
  lvim.builtin.hlslens = { active = true } -- enable/disable hlslens
  -- lvim.builtin.tag_provider = "symbols-outline" -- change this to use different tag providers ( symbols-outline or vista )
  -- lvim.builtin.editorconfig = { active = true } -- enable/disable editorconfig
  -- lvim.builtin.global_statusline = false -- set true to use global statusline
  -- lvim.builtin.dressing = { active = false } -- enable to override vim.ui.input and vim.ui.select with telescope
  -- lvim.builtin.refactoring = { active = false } -- enable to use refactoring.nvim code_actions
  lvim.builtin.tmux_lualine = true -- use vim-tpipeline to integrate lualine and tmux
  lvim.builtin.lsp_lines = true    -- enable/disable lsp_lines to display lsp virtual text below instead of behind
  if lvim.builtin.lsp_lines then
    lvim.lsp.diagnostics.virtual_text = false
  end
  lvim.builtin.lir.active = false
  lvim.builtin.breadcrumbs.active = false
  -- lvim.builtin.illuminate.active = false
  lvim.builtin.indentlines.active = true
  lvim.builtin.web_programming = { active = true } -- typescript.nvim + package-info.nvim
  -- lvim.builtin.cmp.cmdline.enable = false
  -- lvim.builtin.borderless_cmp = false
  -- lvim.builtin.colored_args = false -- if true then sets up hlargs.nvim
  -- lvim.builtin.bigfile.active = true
  -- lvim.builtin.inlay_hints = { active = false } -- enable/disable inlay hints
  -- lvim.builtin.mind = { active = false, root_path = "~/.mind" } -- enable/disable mind.nvim

  lvim.builtin.treesitter.rainbow.enable = true
  lvim.builtin.treesitter.highlight.enable = true
  -- if you don't want all the parsers change this to a table of the ones you want
  lvim.builtin.treesitter.ensure_installed = {
    "bash",
    "javascript",
    "typescript",
    "json",
    "lua",
    "html",
    "tsx",
    "css",
    "scss",
    "yaml",
  }

  lvim.builtin.treesitter.ignore_install = { "haskell" }
end

return M

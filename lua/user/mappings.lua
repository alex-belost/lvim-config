local M = {}

function M.setup()
  lvim.leader = "space"

  lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
  lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
  lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
  lvim.keys.normal_mode["<Esc>"] = ":nohl<cr>"
  -- unmap a default keymapping
  -- vim.keymap.del("n", "<C-Up>")
  -- vim.keymap.del("n", "<leader>o")
  -- override a default keymapping
  -- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

  -- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
  -- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
  local _, actions = pcall(require, "telescope.actions")


  lvim.builtin.telescope.defaults.mappings = {
    i = {
      ["<C-j>"] = actions.move_selection_next,
      ["<C-k>"] = actions.move_selection_previous,
      ["<C-n>"] = actions.cycle_history_next,
      ["<C-p>"] = actions.cycle_history_prev,
    },
    n = {
      ["<C-j>"] = actions.move_selection_next,
      ["<C-k>"] = actions.move_selection_previous,
    },
  }

  -- Change theme settings
  -- lvim.builtin.theme.options.dim_inactive = true
  -- lvim.builtin.theme.options.style = "storm"

  -- lvim.builtin.which_key.mappings["t"] = {
  --   name = "+Trouble",
  --   r = { "<cmd>Trouble lsp_references<cr>", "References" },
  --   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  --   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  --   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  --   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  --   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
  -- }
  lvim.builtin.which_key.mappings["t"] = {
    name = "Diagnostics",
    t = { "<cmd>TroubleToggle<cr>", "Trouble" },
    w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace" },
    d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document" },
    q = { "<cmd>TroubleToggle quickfix<cr>", "Quickfix" },
    l = { "<cmd>TroubleToggle loclist<cr>", "Loclist" },
    r = { "<cmd>TroubleToggle lsp_references<cr>", "References" },
  }

  -- Use which-key to add extra bindings with the leader-key prefix
  lvim.builtin.which_key.mappings["o"] = { "<cmd>NvimTreeFocus<CR>", "Explorer Focus" }
  lvim.builtin.which_key.mappings["dl"] = { "<cmd>LoggerRun<cr>", "Log variable" }
  lvim.builtin.which_key.mappings["lo"] = { "<cmd>SymbolsOutlineOpen<cr>", "Open symbols" }
  lvim.builtin.which_key.mappings["lO"] = { "<cmd>SymbolsOutlineClose<cr>", "Close symbols" }
  lvim.builtin.which_key.mappings["<space>"] = { function()
    require("telescope.builtin").buffers()
  end, "Search buffers" }
end

return M

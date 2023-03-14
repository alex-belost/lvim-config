local M = {}

function M.setup()
  -- Additional Plugins
  lvim.plugins = {
    -- {
    --   "nvim-treesitter/nvim-treesitter-angular"
    -- },
    {
      'alex-belost/logger',
      requires = {
        'nvim-treesitter/nvim-treesitter'
      }
    },
    { "vimpostor/vim-tpipeline" },
    {
      "ErichDonGubler/lsp_lines.nvim",
      config = function()
        require("lsp_lines").setup()
      end,
    },
    {
      "kylechui/nvim-surround",
      tag = "*", -- Use for stability; omit to use `main` branch for the latest features
      config = function()
        require("nvim-surround").setup({
          -- Configuration here, or leave empty to use defaults
        })
      end
    },
    {
      "folke/todo-comments.nvim",
      event = "BufRead",
      config = function()
        require("todo-comments").setup()
      end,
    },
    {
      "nacro90/numb.nvim",
      event = "BufRead",
      config = function()
        require("numb").setup {
          show_numbers = true,    -- Enable 'number' for the window while peeking
          show_cursorline = true, -- Enable 'cursorline' for the window while peeking
        }
      end,
    },
    {
      "mrjones2014/nvim-ts-rainbow",
    },
    {
      "romgrk/nvim-treesitter-context",
      config = function()
        require("treesitter-context").setup {
          enable = true,   -- Enable this plugin (Can be enabled/disabled later via commands)
          throttle = true, -- Throttles plugin updates (may improve performance)
          max_lines = 0,   -- How many lines the window should span. Values <= 0 mean no limit.
          patterns = {
            -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
            -- For all filetypes
            -- Note that setting an entry here replaces all other patterns for this entry.
            -- By setting the 'default' entry below, you can control which nodes you want to
            -- appear in the context window.
            default = {
              'class',
              'function',
              'method',
            },
          },
        }
      end
    },
    {
      "tzachar/cmp-tabnine",
      run = "./install.sh",
      requires = "hrsh7th/nvim-cmp",
      event = "InsertEnter",
    },
    {
      "simrat39/symbols-outline.nvim",
      config = function()
        require('symbols-outline').setup()
      end
    },
    {
      "folke/trouble.nvim",
      cmd = "TroubleToggle",
    },
    -- {
    --   "Pocco81/auto-save.nvim",
    --   config = function()
    --     require("auto-save").setup()
    --   end,
    -- },
    {
      "metakirby5/codi.vim",
      cmd = "Codi",
    },
    {
      "folke/persistence.nvim",
      event = "BufReadPre", -- this will only start session saving when an actual file was opened
      module = "persistence",
      config = function()
        require("persistence").setup {
          dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
          options = { "buffers", "curdir", "tabpages", "winsize" },
        }
      end,
    },
    {
      "itchyny/vim-cursorword",
      event = { "BufEnter", "BufNewFile" },
      config = function()
        vim.api.nvim_command("augroup user_plugin_cursorword")
        vim.api.nvim_command("autocmd!")
        vim.api.nvim_command("autocmd FileType NvimTree,lspsagafinder,dashboard,vista let b:cursorword = 0")
        vim.api.nvim_command("autocmd WinEnter * if &diff || &pvw | let b:cursorword = 0 | endif")
        vim.api.nvim_command("autocmd InsertEnter * let b:cursorword = 0")
        vim.api.nvim_command("autocmd InsertLeave * let b:cursorword = 1")
        vim.api.nvim_command("augroup END")
      end
    },
    { "tpope/vim-repeat" },
  }
end

return M

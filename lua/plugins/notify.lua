return {
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      local function pick_target_window()
        local current_tab = vim.api.nvim_get_current_tabpage()
        local current_win = vim.api.nvim_get_current_win()

        local function is_valid_target(win)
          if not vim.api.nvim_win_is_valid(win) then return false end
          if vim.api.nvim_win_get_tabpage(win) ~= current_tab then return false end
          if vim.api.nvim_win_get_config(win).relative ~= "" then return false end

          local buf = vim.api.nvim_win_get_buf(win)
          local bt = vim.bo[buf].buftype
          local ft = vim.bo[buf].filetype

          if bt == "terminal" or ft == "toggleterm" or vim.b[buf].codex_term then return false end
          if ft:find "^snacks" then return false end

          return true
        end

        for _, win in ipairs(vim.api.nvim_tabpage_list_wins(current_tab)) do
          if is_valid_target(win) then
            local buf = vim.api.nvim_win_get_buf(win)
            if vim.bo[buf].filetype == "alpha" then return win end
          end
        end

        for _, win in ipairs(vim.api.nvim_tabpage_list_wins(current_tab)) do
          if is_valid_target(win) then return win end
        end

        return current_win
      end

      opts.notifier = opts.notifier or {}
      opts.notifier.enabled = false

      opts.picker = opts.picker or {}
      opts.picker.sources = opts.picker.sources or {}
      opts.picker.sources.recent = opts.picker.sources.recent or {}
      opts.picker.sources.recent.confirm = function(picker, item, action)
        local actions = require "snacks.picker.actions"
        picker.main = pick_target_window()
        return actions.confirm(picker, item, action)
      end
    end,
  },
  {
    "rcarriga/nvim-notify",
    lazy = false,
    config = function()
      vim.notify = require "notify"
      require("notify").setup {
        stages = "slide",
        timeout = 2000,
        fps = 60,
        render = "default",
        background_colour = "#1e1e2e",
      }
    end,
  },
}

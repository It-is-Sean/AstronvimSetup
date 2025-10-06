-- plugins/snacks.lua
return {
  {
    "folke/snacks.nvim",
    opts = {
      notifier = {
        enabled = false, -- 禁用 snacks 的通知模块
      },
    },
  },

  {
    "rcarriga/nvim-notify",
    lazy = false,
    config = function()
      vim.notify = require "notify"
      require("notify").setup {
        -- stages = "fade_in_slide_out",
        stages = "slide",
        timeout = 2000,
        fps = 60,
        render = "default",
        background_colour = "#1e1e2e",
      }
    end,
  },
}

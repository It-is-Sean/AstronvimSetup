return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  enabled = true,
  init = false,
  opts = function()
    local dashboard = require "alpha.themes.dashboard"
    local logo = [[
 █████╗ ███████╗████████╗██████╗  ██████╗
██╔══██╗██╔════╝╚══██╔══╝██╔══██╗██╔═══██╗
███████║███████╗   ██║   ██████╔╝██║   ██║
██╔══██║╚════██║   ██║   ██╔══██╗██║   ██║
██║  ██║███████║   ██║   ██║  ██║╚██████╔╝
╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝
  N      E      O      V      I      M
    ]]
    dashboard.section.header.val = vim.split(logo, "\n")
    dashboard.section.buttons.val = {
      dashboard.button("f", "  Find file", "<cmd>lua require('snacks').picker.files()<cr>"),
      dashboard.button("n", "  New file", "<cmd>ene <BAR> startinsert<cr>"),
      dashboard.button("r", "  Recent files", "<cmd>lua require('snacks').picker.recent()<cr>"),
      dashboard.button("g", "  Find text", "<cmd>lua require('snacks').picker.grep()<cr>"),
      dashboard.button("h", "󰞋  Help", "<cmd>lua require('snacks').picker.help()<CR>"),
      dashboard.button(
        "c",
        "  Config",
        "<cmd>lua require('snacks').picker.files({cwd=vim.fn.stdpath('config'),title='Config Files'})<cr>"
      ),
      dashboard.button("l", "󰒲  Lazy", "<cmd>Lazy<cr>"),
      dashboard.button("q", "  Quit", "<cmd>qa<cr>"),
    }

    for _, button in ipairs(dashboard.section.buttons.val) do
      button.opts.hl = "AlphaButtons"
      button.opts.hl_shortcut = "AlphaShortcut"
    end
    dashboard.section.header.opts.hl = "AlphaHeader"
    dashboard.section.buttons.opts.hl = "AlphaButtons"
    dashboard.section.footer.opts.hl = "AlphaFooter"
    dashboard.opts.layout[1].val = 4
    dashboard.opts.layout[3].val = 2
    return dashboard
  end,
  config = function(_, dashboard)
    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        once = true,
        pattern = "AlphaReady",
        callback = function() require("lazy").show() end,
      })
    end

    require("alpha").setup(dashboard.opts)

    vim.api.nvim_create_autocmd("User", {
      once = true,
      pattern = "LazyVimStarted",
      callback = function()
        local stats = require("lazy").stats()
        local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
        dashboard.section.footer.val = "⚡ Neovim loaded "
          .. stats.loaded
          .. "/"
          .. stats.count
          .. " plugins in "
          .. ms
          .. "ms"
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
}

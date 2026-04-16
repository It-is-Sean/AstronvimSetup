return {
  "akinsho/toggleterm.nvim",
  keys = {
    {
      "<Leader>tc",
      function()
        local terminal = require "toggleterm.terminal"
        if not terminal._codex_term then
          terminal._codex_term = terminal.Terminal:new {
            cmd = "codex",
            count = 99,
            direction = "vertical",
            hidden = true,
            display_name = "codex",
            on_open = function(term)
              vim.b[term.bufnr].codex_term = true
              vim.wo[term.window].winfixbuf = true
              vim.wo[term.window].winfixwidth = true
              vim.cmd "startinsert!"
            end,
          }
        end

        terminal._codex_term:toggle()
      end,
      desc = "Toggle Codex terminal",
    },
  },
  opts = {
    direction = "float",
    shade_terminals = false,
    size = function(term)
      if term.direction == "vertical" then return math.floor(vim.o.columns * 0.4) end
    end,
  },
}

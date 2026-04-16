return {
  n = {
    L = {
      function() require("astrocore.buffer").nav(vim.v.count1) end,
      desc = "Next buffer",
    },
    H = {
      function() require("astrocore.buffer").nav(-vim.v.count1) end,
      desc = "Previous buffer",
    },
    ["<Leader>bd"] = {
      function()
        require("astroui.status.heirline").buffer_picker(function(bufnr)
          require("astrocore.buffer").close(bufnr)
        end)
      end,
      desc = "Close buffer from tabline",
    },
    ["<Leader>fo"] = false,
    ["<Leader>fr"] = {
      function() require("snacks").picker.recent { title = "Recent Files" } end,
      desc = "Find recent files",
    },
    ["<Leader>fR"] = {
      function() require("snacks").picker.recent { filter = { cwd = true }, title = "Recent Files (cwd)" } end,
      desc = "Find recent files (cwd)",
    },
    ["<Leader>r"] = { "<cmd>CompilerOpen<CR>", desc = "Open Compiler" },
    ["<D-a>"] = { "ggVG", desc = "Select all" },
    gb = { "<C-o>", desc = "Go back" },
  },
  i = {
    ["<C-s>"] = { "<cmd>w<CR>", desc = "Save current file" },
    ["<C-S>"] = { "<cmd>wa<CR>", desc = "Save all files" },
    ["<C-q>"] = { "<cmd>qa<CR>", desc = "Quit AstroNvim" },
  },
}

return {
  -- first key is the mode
  n = {

    -- second key is the lefthand side of the map

    -- navigate buffer tabs
    ["L"] = {
      function()
        require("astrocore.buffer").nav(vim.v.count1)
      end,
      desc = "Next buffer",
    },
    ["H"] = {
      function()
        require("astrocore.buffer").nav(-vim.v.count1)
      end,
      desc = "Previous buffer",
    },

    -- mappings seen under group name "Buffer"
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
      "<cmd>lua require('snacks').picker.recent({title='Recent Files'})<cr>",
      desc = "Find recent files",
    },
    ["<Leader>fR"] = {
      "<cmd>lua require('snacks').picker.recent({filter={cwd=true}, title = 'Recent Files (cwd)})<cr>",
      desc = "Find recend files (cwd)",
    },
    ["<leader>r"] = { "<cmd>CompilerOpen<CR>", desc = "Open Compiler" },
    -- tables with just a `desc` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    -- ["<Leader>b"] = { desc = "Buffers" },

    -- setting a mapping to false will disable it
    -- ["<C-S>"] = false,
    ["<D-a>"] = { "ggVG", desc = "Select all" },
    ["gb"] = { "<C-o>", desc = "Go back" },
  },
  i = {
    ["<C-s>"] = { "<cmd>w<CR>", desc = "Save current file" },
    ["<C-S>"] = { "<cmd>wa<CR>", desc = "Save all file" },
    ["<C-q>"] = { "<cmd>qa<CR>", desc = "Quit astronvim" },
  },
}

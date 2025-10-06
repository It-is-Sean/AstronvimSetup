return {
  "kawre/leetcode.nvim",
  build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
  lazy = "leetcode.nvim" ~= vim.fn.argv(0, -1),
  dependencies = {
    -- include a picker of your choice, see picker section for more details
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    -- configuration goes here
    lang = "cpp",
    cn = {
      enabled = true, -- 启用中国版leetcode.cn
      translator = true, -- 启用题目翻译
    },
  },
}

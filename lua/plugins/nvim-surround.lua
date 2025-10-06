return {
  "kylechui/nvim-surround",
  opts = function(_, opts)
    opts.surrounds = vim.tbl_deep_extend("force", opts.surrounds or {}, {
      ["("] = {
        add = function()
          return { { "(" }, { ")" } } -- 没有空格
        end,
      },
      ["["] = {
        add = function() return { { "[" }, { "]" } } end,
      },
      ["{"] = {
        add = function() return { { "{" }, { "}" } } end,
      },
    })
    return opts
  end,
}

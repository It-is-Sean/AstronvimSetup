return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require "null-ls"

    null_ls.setup {
      sources = {
        -- ✅ 启用 stylua 格式化
        null_ls.builtins.formatting.stylua,
        -- ❌ 不启用诊断（注释掉这一行即可）
        -- null_ls.builtins.diagnostics.selene,
      },
    }
  end,
}

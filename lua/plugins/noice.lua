-- ~/.config/nvim/lua/user/plugins/noice.lua
return {
  "folke/noice.nvim",
  -- 如果你希望在特定事件后加载 noice，可以加上 event/keys/cmd 等字段
  -- event = "VeryLazy",
  opts = function(_, opts)
    -- 1. 新增过滤规则，不替换原有 routes
    local extra_routes = {
      {
        filter = { event = "notify", find = "ContentModified" },
        opts = { skip = true },
      },
      {
        filter = { event = "notify", find = "fewer lines" },
        opts = { skip = true },
      },
      {
        filter = { event = "notify", find = "lines yanked" },
        opts = { skip = true },
      },
    }
    opts.routes = opts.routes or {}
    for _, r in ipairs(extra_routes) do
      table.insert(opts.routes, r)
    end

    -- 2. 调整 LSP 子模块（保留其它默认项，仅关闭不想要的）
    opts.lsp = opts.lsp or {}
    opts.lsp.progress = opts.lsp.progress or {}
    opts.lsp.progress.enabled = false -- 关闭进度消息
    opts.lsp.hover = opts.lsp.hover or {}
    opts.lsp.hover.enabled = false -- 关闭 hover
    opts.lsp.signature = opts.lsp.signature or {}
    opts.lsp.signature.enabled = false -- 关闭签名提示

    -- 3. 其他细节设置（同样是修改单个字段，不替换整个表）
    opts.presets = opts.presets or {}
    opts.presets.lsp_doc_border = true -- 启用文档边框

    opts.messages = opts.messages or {}
    opts.messages.enabled = false -- 全局消息关闭

    opts.cmdline = opts.cmdline or {}
    opts.cmdline.enabled = true -- 保留命令行补全

    return opts
  end,
}

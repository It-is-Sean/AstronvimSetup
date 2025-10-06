return {
  -- 使用 AstroNvim 的 LSP 插件系统
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      pyright = {
        cmd = { "pyright-langserver", "--stdio" },
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "basic",
              reportAttributeAccessIssue = false,
            },
          },
        },
      },
    },
  },
}

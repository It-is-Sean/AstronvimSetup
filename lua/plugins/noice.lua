return {
  "folke/noice.nvim",
  opts = function(_, opts)
    opts.lsp = opts.lsp or {}
    opts.lsp.progress = opts.lsp.progress or {}
    opts.lsp.progress.enabled = false
    opts.lsp.hover = opts.lsp.hover or {}
    opts.lsp.hover.enabled = false
    opts.lsp.signature = opts.lsp.signature or {}
    opts.lsp.signature.enabled = false

    opts.presets = opts.presets or {}
    opts.presets.lsp_doc_border = true

    opts.cmdline = opts.cmdline or {}
    opts.cmdline.enabled = true

    return opts
  end,
}

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
	"AstroNvim/astrocommunity",
	{ import = "astrocommunity.pack.lua" },
	-- import/override with your plugins folder
	{ import = "astrocommunity.colorscheme.catppuccin" },
	{ import = "astrocommunity.colorscheme.tokyonight-nvim" },
	{ import = "astrocommunity.colorscheme.tokyodark-nvim" },
	{ import = "astrocommunity.pack.python" },
	{ import = "astrocommunity.startup.alpha-nvim" },
	{ import = "astrocommunity.utility.noice-nvim" },
	{ import = "astrocommunity.scrolling.nvim-scrollbar" },
	{ import = "astrocommunity.pack.rust" },
	{ import = "astrocommunity.pack.cpp" },
	-- { import = "astrocommunity.pack.cmake" },
	{ import = "astrocommunity.code-runner.compiler-nvim" },
	{ import = "astrocommunity.motion.nvim-surround" },
	{ import = "astrocommunity.utility.noice-nvim" },
	{ import = "astrocommunity.pack.markdown" },
	{ import = "astrocommunity.markdown-and-latex.markview-nvim" },
	{ import = "astrocommunity.editing-support.multiple-cursors-nvim" },
	{ import = "astrocommunity.motion.hop-nvim" },
}

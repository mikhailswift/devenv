return {
  { "vimpostor/vim-prism" },
  { "Mofiqul/dracula.nvim" },
  {
    "vimpostor/vim-lumen",
    init = function()
      vim.g.lumen_light_colorscheme = "prism"
      vim.g.lumen_dark_colorscheme = "dracula"
    end,
  },
}

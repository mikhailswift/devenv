return {
  {
    dir = "~/.config/nvim/draculapro",
  },
  {
    "vimpostor/vim-lumen",
    init = function()
      vim.g.lumen_light_colorscheme = "dracula_pro_alucard"
      vim.g.lumen_dark_colorscheme = "dracula_pro"
    end,
  },
}

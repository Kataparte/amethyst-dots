return {
  -- Configure Catppuccin specifically for Macchiato
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "macchiato", -- latte, frappe, macchiato, mocha
      transparent_background = false,
      term_colors = true,
    },
  },

  -- Tell LazyVim to use Catppuccin as the default
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}

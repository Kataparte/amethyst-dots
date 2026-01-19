return {
  -- 1. First, define the plugin
  {
    "RRethy/nvim-base16",
    lazy = false, -- Load immediately
    priority = 1000, -- Highest priority
  },

  -- 2. Then, tell LazyVim how to apply the colors
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        -- Safely try to load the Matugen file
        local status, colors = pcall(require, "config.matugen_colors")

        if status then
          -- If file exists, apply it
          require("base16-colorscheme").setup(colors)
        else
          -- If file is missing, use a built-in default so it doesn't crash
          vim.cmd.colorscheme("habamax")
        end
      end,
    },
  },
}

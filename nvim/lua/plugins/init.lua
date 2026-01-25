return {
  {
    "michaelb/sniprun",
    branch = "master",
    build = "sh ./install.sh",
    config = function()
      require("sniprun").setup({
        -- This tells SnipRun to show results in a floating window
        display = { "FloatingWindow" }, 
      })
    end,
  },
}

return {
  "barrettruth/live-server.nvim",
  build = "npm install -g live-server", -- This ensures the engine is installed
  cmd = { "LiveServerStart", "LiveServerStop" },
  config = function()
    require("live-server").setup({
      args = { "--browser=google-chrome-stable" } 
    })
  end,
}

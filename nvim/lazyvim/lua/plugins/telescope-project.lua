return {
  "nvim-telescope/telescope-project.nvim",
  config = function()
    require("telescope").load_extension("project")
  end,
}

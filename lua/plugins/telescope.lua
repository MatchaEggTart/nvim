return {

  -- Telescopt
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.2",
    -- or                              , branch = '0.1.x',
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    lazy = true,
    cmd = { "Telescope" },
    keys = {
      { "<leader>ff", "<cmd>:Telescope find_files<CR>", desc = "find files" },
      { "<leader>fg", "<cmd>:Telescope live_grep<CR>",  desc = "grep file" },
      { "<leader>fb", "<cmd>:Telescope buffers<CR>",    desc = "buffers" },
      { "<leader>fo", "<cmd>:Telescope oldfiles<CR>",   desc = "oldfiles" },
      { "<leader>fh", "<cmd>:Telescope help_tags<CR>",  desc = "help_tags" },
    },
  },

}

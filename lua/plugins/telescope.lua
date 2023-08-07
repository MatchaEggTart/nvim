return {
  'nvim-telescope/telescope.nvim', tag = '0.1.2',
  -- or                              , branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  lazy = true,
  keys = {
    { "<leader>ff", ":Telescope find_files<CR>", desc = "find files" },
    { "<leader>fg", ":Telescope live_grep<CR>", desc = "grep file" },
    { "<leader>fb", ":Telescope buffers<CR>", desc = "buffers" },
    { "<leader>fh", ":Telescope help_tags<CR>", desc = "help_tags" },
  },
}

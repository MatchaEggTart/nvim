return {
  {
    "nvim-lualine/lualine.nvim",
    -- lazy = false,
    -- priority = 1000,
    opts = {},
    config = function()
      require('lualine').setup()
    end,
  }
}

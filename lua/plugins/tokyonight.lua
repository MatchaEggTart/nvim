return {
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    lazy = false,
    opts = {
    },
    config = function()
      require("tokyonight").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
        -- light_style = "night", -- The theme is used when the background is set to light
        transparent = true, -- Enable this to disable setting the background color
        styles = {
          -- Background styles. Can be "dark", "transparent" or "normal"
          sidebars = "transparent", -- style for sidebars, see below
        }
      })
      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight]])
    end,
  }
}

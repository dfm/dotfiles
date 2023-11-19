return {
  {
    'mrjones2014/legendary.nvim',
    priority = 10000,
    lazy = false,
    opts = {
      extensions = {
        lazy_nvim = true,
        which_key = { auto_register = true, do_binding = false },
      }
    },
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "stevearc/dressing.nvim",
    },
    keys = {
      { "<leader>p", "<cmd>Legendary<cr>", desc = "Open legendary command [P]alette" },
    }
  },

  { "folke/which-key.nvim", opts = {} },
}

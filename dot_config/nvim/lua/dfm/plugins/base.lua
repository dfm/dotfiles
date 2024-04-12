return {
  -- Detect tabstop and shiftwidth automatically
  "tpope/vim-sleuth",

  -- Session managment
  {
    "rmagatti/auto-session",
    opts = {
      log_level = "error",
      cwd_change_handling = {
        post_cwd_changed_hook = function()
          require("lualine").refresh()
        end,
      },
    }
  },

  -- Set lualine as statusline
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        icons_enabled = false,
        theme = "nord",
        component_separators = "|",
        section_separators = "",
      },
    },
  },

  -- Add indentation guides even on blank lines
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },

  -- "<leader>/" to comment visual regions/lines
  {
    "numToStr/Comment.nvim",
    opts = {
      toggler = {
        line = "<leader>/",
      },
      opleader = {
        line = "<leader>/",
      },
    },
  },

  -- Soft wrapping
  { "andrewferrier/wrapping.nvim", opts = {} },
}

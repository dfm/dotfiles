return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    build = ":TSUpdate",
    config = function()
      -- Defer Treesitter setup after first render to improve startup time of 'nvim {filename}'
      vim.defer_fn(function()
        require("nvim-treesitter.configs").setup({
          modules = {},
          sync_install = false,
          ignore_install = {},
          ensure_installed = {
            "bash",
            "bibtex",
            "c",
            "cmake",
            "cpp",
            "css",
            "csv",
            "cuda",
            "diff",
            "dockerfile",
            "doxygen",
            "fortran",
            "go",
            "haskell",
            "html",
            "javascript",
            "julia",
            "latex",
            "lua",
            "make",
            "markdown_inline",
            "meson",
            "python",
            "rst",
            "rust",
            "scss",
            "sql",
            "swift",
            "toml",
            "tsx",
            "typescript",
            "vimdoc",
            "vim",
            "xml",
            "yaml",
          },
          auto_install = false,
          highlight = { enable = true },
          indent = { enable = true },
          -- incremental_selection = {
          --   enable = true,
          --   keymaps = {
          --     init_selection = "<c-space>",
          --     node_incremental = "<c-space>",
          --     scope_incremental = "<c-s>",
          --     node_decremental = "<M-space>",
          --   },
          -- },
          -- textobjects = {
          --   select = {
          --     enable = true,
          --     lookahead = true,
          --     keymaps = {
          --       ["aa"] = "@parameter.outer",
          --       ["ia"] = "@parameter.inner",
          --       ["af"] = "@function.outer",
          --       ["if"] = "@function.inner",
          --       ["ac"] = "@class.outer",
          --       ["ic"] = "@class.inner",
          --     },
          --   },
          --   move = {
          --     enable = true,
          --     set_jumps = true,
          --     goto_next_start = {
          --       ["]m"] = "@function.outer",
          --       ["]]"] = "@class.outer",
          --     },
          --     goto_next_end = {
          --       ["]M"] = "@function.outer",
          --       ["]["] = "@class.outer",
          --     },
          --     goto_previous_start = {
          --       ["[m"] = "@function.outer",
          --       ["[["] = "@class.outer",
          --     },
          --     goto_previous_end = {
          --       ["[M"] = "@function.outer",
          --       ["[]"] = "@class.outer",
          --     },
          --   },
          --   swap = {
          --     enable = true,
          --     swap_next = {
          --       ["<leader>a"] = "@parameter.inner",
          --     },
          --     swap_previous = {
          --       ["<leader>A"] = "@parameter.inner",
          --     },
          --   },
          -- },
        })
      end, 0)
    end,
  },
}

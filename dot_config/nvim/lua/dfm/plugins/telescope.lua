local function is_git_repo()
  vim.fn.system("git rev-parse --is-inside-work-tree")
  return vim.v.shell_error == 0
end

local function get_git_root()
  local dot_git_path = vim.fn.finddir(".git", ".;")
  return vim.fn.fnamemodify(dot_git_path, ":h")
end

local function find_files_git_root()
  local opts = {}
  if is_git_repo() then
    opts = {
      cwd = get_git_root(),
    }
  end
  require("telescope.builtin").find_files(opts)
end

local function live_grep_git_root()
  local opts = {}
  if is_git_repo() then
    opts = {
      search_dirs = { get_git_root() },
    }
  end
  require("telescope.builtin").live_grep(opts)
end

return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
          return vim.fn.executable("make") == 1
        end,
      },
      "nvim-telescope/telescope-file-browser.nvim",
    },
    config = function()
      local actions = require("telescope.actions")
      require("telescope").setup {
        defaults = {
          mappings = {
            i = {
              ["<esc>"] = actions.close,
            },
          },
        },
      }
      pcall(require("telescope").load_extension, "fzf")
      require("telescope").load_extension "file_browser"
    end,
    keys = {
      {
        "<leader><space>",
        find_files_git_root,
        desc = "Find files in git root",
      },
      {
        "<leader>o",
        require("telescope.builtin").buffers,
        desc = "Open existing buffer",
      },
      {
        "<leader>?",
        live_grep_git_root,
        desc = "Live grep in git root"
      },
      {
        "<leader>e",
        "<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>",
        desc = "Open file [e]xplorer",
      },
    },
  },
}

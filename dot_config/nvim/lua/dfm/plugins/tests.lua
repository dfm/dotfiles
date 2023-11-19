return {
  "klen/nvim-test",
  opts = {},
  keys = {
    { "<leader>tt", function() require("nvim-test").run("nearest") end, desc = "Run [T]est nearest to cursor" },
    { "<leader>ta", function() require("nvim-test").run("suite") end, desc = "Run full [T]est suite" },
    { "<leader>tf", function() require("nvim-test").run("file") end, desc = "Run [T]ests in current file" },
  },
  config = function() 
    require("which-key").register{
      ["<leader>t"] = { name = "[T]ests" },
    }
  end,
}

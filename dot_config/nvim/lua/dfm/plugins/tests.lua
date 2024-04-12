return {
  "klen/nvim-test",
  keys = {
    { "<leader>tt", function() require("nvim-test").run("nearest") end, desc = "Run [T]est nearest to cursor" },
    { "<leader>ta", function() require("nvim-test").run("suite") end, desc = "Run full [T]est suite" },
    { "<leader>tf", function() require("nvim-test").run("file") end, desc = "Run [T]ests in current file" },
  },
  config = function() 
    require("which-key").register{
      ["<leader>t"] = { name = "[T]ests" },
    }

    require("nvim-test.runners.cargo-test"):setup{ package = true }
    require("nvim-test").setup{}
  end,
}

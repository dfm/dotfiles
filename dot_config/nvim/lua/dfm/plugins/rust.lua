return {
  "simrat39/rust-tools.nvim",
  config = function()
    pcall(
      function()
        require("rust-tools").setup {
          tools = {
            reload_workspace_from_cargo_toml = true,
            on_initialized = function()
              vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "CursorHold", "InsertLeave" }, {
                pattern = { "*.rs" },
                callback = function()
                  local _, _ = pcall(vim.lsp.codelens.refresh)
                end,
              })
            end,
          },
          server = {
            on_attach = function(client, bufnr)
              require("dfm.lsp").on_attach(client, bufnr)
              local rt = require("rust-tools")
              vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr, desc = "Hover Documentation" })
              vim.keymap.set("n", "<leader>cl", vim.lsp.codelens.run, { buffer = bufnr, desc = "[C]ode [L]ens" })
            end,
            settings = {
              ["rust-analyzer"] = {
                lens = {
                  enable = true,
                },
                checkOnSave = {
                  enable = true,
                  command = "clippy",
                },
              },
            },
          },
          -- server = {
          --   on_attach = function(_, bufnr)
          --     local rt = require("rust-tools")
          --     -- Hover actions
          --     vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
          --     -- Code action groups
          --     vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
          --   end,
          -- },
        }
      end
    )
  end,
}

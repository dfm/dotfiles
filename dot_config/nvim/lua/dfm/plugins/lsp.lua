return {
  -- LSP Configuration & Plugins
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { "williamboman/mason.nvim",           opts = {} },
      { "williamboman/mason-lspconfig.nvim", opts = {} },

      -- Useful status updates for LSP
      { "j-hui/fidget.nvim",                 tag = "legacy", opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      { "folke/neodev.nvim",                 opts = {} },

      -- Project specific configuration; added here to make sure it gets set up before LSP
      { "folke/neoconf.nvim", opts = {} }
    },
    config = function()
      -- Document LSP key chains
      require("which-key").register{
        ["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
        ["<leader>d"] = { name = "[D]ocument", _ = "which_key_ignore" },
        ["<leader>r"] = { name = "[R]ename", _ = "which_key_ignore" },
        ["<leader>w"] = { name = "[W]orkspace", _ = "which_key_ignore" },
        ["<leader>f"] = { name = "[F]ormat buffer", _ = "which_key_ignore" },
      }

      local servers = {
        -- clangd = {},
        -- gopls = {},
        -- tsserver = {},
        -- html = { filetypes = { 'html', 'twig', 'hbs'} },

        -- Python
        pyright = {},
        ruff_lsp = {
          args = {}
        },

        -- Rust -- see ./rust.lua
        -- rust_analyzer = {},

        -- Lua
        lua_ls = {
          Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
          },
        },

        -- LaTeX
        ltex = {},
      }

      -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

      -- Ensure the servers above are installed
      local mason_lspconfig = require("mason-lspconfig")

      mason_lspconfig.setup({
        ensure_installed = vim.tbl_keys(servers),
      })

      local on_attach = require("dfm.lsp").on_attach
      mason_lspconfig.setup_handlers({
        function(server_name)
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
            filetypes = (servers[server_name] or {}).filetypes,
          })
        end,
      })
    end,
  },
}

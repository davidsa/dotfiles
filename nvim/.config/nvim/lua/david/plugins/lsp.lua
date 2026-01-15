return {

  {
    "williamboman/mason.nvim",
    lazy = false,
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })

      lspconfig.ts_ls.setup({
        capabilities = capabilities,
      })

      lspconfig.tailwindcss.setup({})

      lspconfig.gopls.setup({
        capabilities = capabilities,
      })

      local dotnet_root = vim.fn.trim(vim.fn.system("asdf where dotnet 10.0.101 2>/dev/null"))

      lspconfig.csharp_ls.setup({
        capabilities = capabilities,
        cmd_env = {
          DOTNET_ROOT = dotnet_root,
          DOTNET_ROOT_X64 = dotnet_root,
        }
      })

      vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>")
      vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
      vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
      vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")
      vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>")
      vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>")
      vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>")
      vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>")
      vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>")
      vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>")
      vim.keymap.set("n", "gk", function()
        vim.diagnostic.open_float(0, { scope = "line" })
      end)
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "SirVer/ultisnips",
        config = function()
          vim.g.UltiSnipsSnippetDirectories = { "~/.config/snippets" }
        end,
      },
      { "quangnguyen30192/cmp-nvim-ultisnips", opts = {} },
    },
    config = function()
      local cmp = require("cmp")
      local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")
      local types = require("cmp.types")

      cmp.setup({
        window = {
          completion = cmp.config.window.bordered({
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
            col_offset = -3,
            side_padding = 1,
            -- Try increasing these
            max_width = 80,
            max_height = 20,
          }),
          documentation = cmp.config.window.bordered({
            max_width = 80,
            max_height = 30,
          }),
        },
        snippet = {
          expand = function(args)
            vim.fn["UltiSnips#anon"](args.body)
          end,
        },
        sources = {
          { name = "path" },
          { name = "nvim_lsp" },
          { name = "buffer",   keyword_length = 3 },
          { name = "ultisnips" },
          { name = "copilot" },
        },
        preselect = types.cmp.PreselectMode.None,
        mapping = {
          ["<Tab>"] = cmp.mapping(function(fallback)
            cmp_ultisnips_mappings.compose({ "select_next_item", "jump_forwards" })(fallback)
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            cmp_ultisnips_mappings.compose({ "select_prev_item", "jump_backwards" })(fallback)
          end, { "i", "s" }),
          ["<C-j>"] = cmp.mapping(function(fallback)
            cmp_ultisnips_mappings.compose({ "expand" })(fallback)
          end, { "i", "s" }),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        },
      })
    end,
  },
}

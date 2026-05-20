return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      -- Install parsers (no-op if already installed; runs async).
      require("nvim-treesitter").install({
        "markdown",
        "markdown_inline",
        "lua",
        "vim",
        "vimdoc",
        "typescript",
        "tsx",
        "javascript",
        "html",
        "css",
        "json",
        "yaml",
        "go",
        "elixir",
        "bash",
        "regex",
        "query",
        "diff",
        "gitcommit",
        "git_rebase",
        "gitignore",
        "gitattributes",
      })

      -- Enable treesitter highlighting + (experimental) indent for any
      -- filetype that has a parser available.
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          local ok = pcall(vim.treesitter.start, args.buf)
          if ok then
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
  },
}

return {
  "rebelot/kanagawa.nvim",
  opts = {},
  config = function()
    vim.cmd.colorscheme("kanagawa-wave")

    vim.cmd [[
    hi Normal guibg=NONE ctermbg=NONE
    hi NormalNC guibg=NONE ctermbg=NONE
    ]]
  end,
}

return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local colors = {
      orange = "#FE5D26",
      violet = "#541388",
      pink = "#FF69EB",
      azure = "#6CCFF6",
      yellow = "#F9CB40",
      black = "#1F1F28",
      white = "#FFFFFF",
      gray = "#303030",
    }

    local theme = {
      normal = {
        a = { bg = colors.azure, fg = colors.black },
        b = { bg = colors.gray, fg = colors.white },
        c = { bg = colors.black, fg = colors.black },
      },
      insert = {
        a = { bg = colors.orange, fg = colors.black },
      },
      visual = {
        a = { bg = colors.pink, fg = colors.black },
      },
      replace = {
        a = { bg = colors.violet, fg = colors.white },
      },
      command = {
        a = { bg = colors.yellow, fg = colors.black },
      },
      inactive = {
        a = { bg = colors.gray, fg = colors.white },
        b = { bg = colors.gray, fg = colors.white },
        c = { bg = colors.gray, fg = colors.white },
      },
    }

    require("lualine").setup({
      options = {
        theme = theme,
        component_separators = "|",
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = {
          { "mode", separator = { left = "" }, right_padding = 2 },
        },
        lualine_b = { "filename", "branch" },
        lualine_c = {},
        lualine_x = {},
        lualine_y = { "filetype" },
        lualine_z = {
          { "location", separator = { right = "" }, left_padding = 2 },
        },
      },
      inactive_sections = {
        lualine_a = { "filename" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location" },
      },
      tabline = {},
      extensions = {},
    })
  end,
}

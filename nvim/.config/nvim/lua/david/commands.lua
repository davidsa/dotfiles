vim.api.nvim_create_user_command('FixMSCR', function()
  vim.cmd("%s/\r//g")
end, {})

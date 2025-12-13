local group = vim.api.nvim_create_augroup("DotEnv", { clear = true })

vim.api.nvim_create_autocmd(
  { "BufRead", "BufNewFile" },
  { pattern = "*.env*", command = "set filetype=bash", group = group }
)

local augroup = vim.api.nvim_create_augroup("strdr4605", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "typescript,typescriptreact",
  group = augroup,
  command = "compiler tsc | setlocal makeprg=npx\\ tsc",
})

local create_azure_pr = function()
  local branch = vim.fn.system("git branch --show-current"):gsub("%s+", "")
  if branch == "" then
    print("Not in a git repository")
  end

  local repo = vim.fn.system("git remote get-url origin | xargs basename"):gsub("%s+", "")

  local id = vim.fn.system("az repos list | jq '.[] | select(.name==\"workframe-be\") | .id'")

  local org = "LeasingD365"
  local project = "EndToEndPlatform"
  local target = "main"

  local url = string.format(
    "https://dev.azure.com/%s/%s/_git/%s/pullrequestcreate?sourceRef=%s&targetRef=%s&sourceRepositoryId=%s&targetRepositoryId=%s",
    org,
    project,
    repo,
    branch,
    target,
    id,
    id
  )


  vim.fn.jobstart({ "chrome.exe", url }, { detach = true })
end

vim.api.nvim_create_user_command("CreateAzurePr", create_azure_pr, {})

-- get all file names in this directory
local function require_plugin_settings(dir)
  local files = {}
  for _, file in ipairs(vim.fn.readdir(dir)) do
    -- add only .lua files, remove extension, ignore init.lua
    if string.match(file, "%.lua$") and file ~= "init.lua" then
      file = string.gsub(file, "%.lua$", "")
      require("custom.plugins.settings." .. file)
    end
  end
  return files
end

require_plugin_settings(vim.fn.stdpath("config") .. "/lua/custom/plugins/settings")

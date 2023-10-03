require("git-worktree").setup({})
require("telescope").load_extension("git_worktree")

vim.keymap.set('n', '<leader>ga', function()
    require('telescope').extensions.git_worktree.create_git_worktree()
end)


vim.keymap.set('n', '<leader>gs', function()
    -- <Enter> - switches to that worktree
    -- <c-d> - deletes that worktree
    -- <c-f> - toggles forcing of the next deletion
    require('telescope').extensions.git_worktree.git_worktrees()
end)


-- Print info
local Worktree = require("git-worktree")

-- op = Operations.Switch, Operations.Create, Operations.Delete
-- metadata = table of useful values (structure dependent on op)
--      Switch
--          path = path you switched to
--          prev_path = previous worktree path
--      Create
--          path = path where worktree created
--          branch = branch name
--          upstream = upstream remote name
--      Delete
--          path = path where worktree deleted

Worktree.on_tree_change(function(op, metadata)
  if op == Worktree.Operations.Switch then
    print("Switched from " .. metadata.prev_path .. " to " .. metadata.path)
  end
end)

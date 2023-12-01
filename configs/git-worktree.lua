local present, worktree = pcall(require, 'git-worktree')

if not present then
  return
end

local options = {
  change_directory_command = 'cd', -- default: "cd",
  update_on_change = true, -- default: true,
  update_on_change_command = 'e', -- default: "e .",
  clearjumps_on_change = true, -- default: true,
  autopush = false, -- default: false,
}

worktree.on_tree_change(function(op, metadata)
  if op == worktree.Operations.Switch then
    print('Switched from ' .. metadata.prev_path .. ' to ' .. metadata.path)
  end
end)

worktree.setup(options)

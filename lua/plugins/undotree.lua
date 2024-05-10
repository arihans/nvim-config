-----------------------------------------------------------
-- UndoTree configuratio file
-----------------------------------------------------------

-- Plugin: undotree
-- url: https://github.com/mbbill/undotree/blob/master/plugin/undotree.vim

local status_ok = pcall(require, 'undotree')
if not status_ok then
    return
end

vim.g.undotree_WindowLayout = 1
vim.g.undotree_SplitWidth = 26

vim.g.undotree_ToggleLayout = function()
  if vim.g.undotree_WindowLayout == 1 then
    vim.g.undotree_WindowLayout = 2
  else
    vim.g.undotree_WindowLayout = 1
  end
  vim.cmd('UndotreeHide')
  vim.cmd('sleep 10m')
  vim.cmd('UndotreeShow')
end

-----------------------------------------------------------
-- Comment.nvim configuration file
----------------------------------------------------------

-- Plugin: Comment.nvim
-- url: https://github.com/numToStr/Comment.nvim

local status_ok, Comment = pcall(require, 'Comment')
if not status_ok then
  return
end

Comment.setup {
  toggler = {
    ---Line-comment toggle keymap
    line = '<leader>cc',
    ---Block-comment toggle keymap
    block = '<leader>bc',
  },
  ---LHS of operator-pending mappings in NORMAL and VISUAL mode
  opleader = {
    ---Line-comment keymap
    line = '<leader>c',
    ---Block-comment keymap
    block = '<leader>b',
  },
  ---LHS of extra mappings
  extra = {
    ---Add comment on the line above
    above = '<leader>cO',
    ---Add comment on the line below
    below = '<leader>co',
    ---Add comment at the end of line
    eol = '<leader>cA',
  },
  ---Enable keybindings
  ---NOTE: If given `false` then the plugin won't create any mappings
  mappings = {
    ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
    basic = true,
    ---Extra mapping; `gco`, `gcO`, `gcA`
    extra = true,
  },
}

local ft = require('Comment.ft')

ft.kdl = '//%s'

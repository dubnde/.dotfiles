-- Finds and lists all of the TODO, HACK, BUG, etc comment
-- in your project and loads them into a browsable list.
return {
  "folke/todo-comments.nvim",
  config = true,
  keys = {
    { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
    { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
  },
}

local notify = prequire("notify")

if not notify then
  return
end

notify.setup({})

vim.notify = notify

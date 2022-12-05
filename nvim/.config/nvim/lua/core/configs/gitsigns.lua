local gitsigns = Prequire 'gitsigns'
if not gitsigns then
  return
end

-- configure/enable gitsigns
gitsigns.setup()

local toggleterm = prequire("toggleterm")

if not toggleterm then
  return
end

toggleterm.setup{
  size = 15,
  persist_size = false,
  direction =  'horizontal'
}

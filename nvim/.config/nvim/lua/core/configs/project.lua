local project = Prequire 'project_nvim'

if not project then
  return
end

project.setup {
  detection_methods = { 'lsp', 'pattern' },
  patterns = { '.git', 'Dockerfile', 'package.json', '.cargo' },
  datapath = vim.fn.stdpath 'data',
}

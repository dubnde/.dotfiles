-- better diagnostics list and others
return {
  'folke/trouble.nvim',
  config = function()
    local trouble = require 'trouble'

    mapn('<leader>xx', function()
      trouble.open()
    end, 'Toggle')
    mapn('<leader>xw', function()
      trouble.open 'Workspace_diagnostics'
    end, 'Workspace diagnostics')
    mapn('<leader>xd', function()
      trouble.open 'document_diagnostics'
    end, 'Document diagnostics')
    mapn('<leader>xq', function()
      trouble.open 'quickfix'
    end, 'Quickfix')
    mapn('<leader>xl', function()
      trouble.open 'loclist'
    end, 'Loclist')
    mapn('gR', function()
      trouble.open 'lsp_references'
    end, 'Lsp rferences')
  end,
}

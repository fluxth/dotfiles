local lsp = require('lsp-zero')

lsp.preset('lsp-compe')

lsp.ensure_installed({
  'tsserver',
  'pyright',
  'sumneko_lua',
  'rust_analyzer',
})

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set('n', '<leader>vd', function() vim.lsp.buf.definition() end, opts)

end)

lsp.setup()

vim.api.nvim_create_autocmd("CursorHold", {
  -- buffer = bufnr,
  callback = function()
    vim.diagnostic.open_float({
      -- bufnr = bufnr,
      scope = 'cursor',
    })
  end
})

-----------------------------------------------------------
-- Additional capabilities supported by nvim-cmp
-----------------------------------------------------------

-- See: https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion

local cmp_status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not cmp_status_ok then
  return
end

_G.Capabilities = cmp_nvim_lsp.default_capabilities()

Capabilities.textDocument.completion.completionItem.documentationFormat = { 'markdown', 'plaintext' }
Capabilities.textDocument.completion.completionItem.snippetSupport = true
Capabilities.textDocument.completion.completionItem.preselectSupport = true
Capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
Capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
Capabilities.textDocument.completion.completionItem.deprecatedSupport = true
Capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
Capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
Capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  },
}

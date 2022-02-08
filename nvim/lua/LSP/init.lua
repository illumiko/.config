local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require('LSP.lspInstaller')
require('LSP.handlers').setup()

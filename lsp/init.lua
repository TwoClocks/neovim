local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("neovim.lsp.zig").setup()
require("neovim.lsp.handlers").setup()


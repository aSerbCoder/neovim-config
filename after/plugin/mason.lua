local map = function(type, key, value)
	vim.api.nvim_buf_set_keymap(0,type,key,value,{noremap = true, silent = true});
end

local custom_attach = function()

	map('n','gD','<cmd>lua vim.lsp.buf.declaration()<CR>')
	map('n','gd','<cmd>lua vim.lsp.buf.definition()<CR>')
	map('n','K','<cmd>lua vim.lsp.buf.hover()<CR>')
	map('n','gi','<cmd>lua vim.lsp.buf.implementation()<CR>')
	map('n','gt','<cmd>lua vim.lsp.buf.type_definition()<CR>')
	map('n','<leader>af','<cmd>lua vim.lsp.buf.code_action()<CR>')
	map('n','<leader>ee','<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>')
	map('n','<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>')
end

require("mason").setup()
require('mason-lspconfig').setup()
require('mason-lspconfig').setup_handlers({
    function(server_name)
        require('lspconfig')[server_name].setup { on_attach = custom_attach }
    end
})

require'lspconfig'.clangd.setup{on_attach = custom_attach}
vim.g.clang_format_style = "file"
require'lspconfig'.marksman.setup{on_attach = custom_attach}

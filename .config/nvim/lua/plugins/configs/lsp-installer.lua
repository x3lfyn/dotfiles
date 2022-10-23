local lspinstaller = require'nvim-lsp-installer'

local lspconfig = require'lspconfig'

-- install servers
lspinstaller.setup {
	ensure_installed = {
		'sumneko_lua', -- lua
		'bashls', -- bash
		'zk', -- markdown
		'pylsp'
	}
}

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem.snippetSupport = true

for _, server in ipairs(lspinstaller.get_installed_servers()) do
	lspconfig[server.name].setup{
		flags = {
		  debounce_text_changes = 150,
		},
		capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
	}
end

lspconfig["sumneko_lua"].setup {
	settings = {
		Lua = {
			workspace = {
				library = {
					['/usr/share/nvim/runtime/lua'] = true,
					['/usr/share/nvim/runtime/lua/lsp'] = true,
					['/usr/share/awesome/lib'] = true
				}
			};
			diagnostics = {
				enable = true;
				globals = {
					'vim',
					'use',
					'awesome',
					'client',
					'root'
				}
			}
		}
	}
}

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"mason.nvim",
		"mason-lspconfig.nvim",
	},
	config = function()
		-- Configure diagnostic signs
		local signs = {
			{ name = "DiagnosticSignError", text = "" },
			{ name = "DiagnosticSignWarn",  text = "" },
			{ name = "DiagnosticSignHint",  text = "" },
			{ name = "DiagnosticSignInfo",  text = "" },
		}

		for _, sign in ipairs(signs) do
			vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
		end

		-- Configure diagnostics
		vim.diagnostic.config({
			virtual_text = {
				enabled = true,
				source = "if_many",
				prefix = "●",
			},
			signs = {
				active = signs,
			},
			update_in_insert = true,
			underline = true,
			severity_sort = true,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})

		-- Setup LSP handlers
		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
			border = "rounded",
		})

		vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
			border = "rounded",
		})

		-- Global LSP keymaps
		local opts = { noremap = true, silent = true }
		vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
		vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
		vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
		vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

		-- LSP attach function
		local on_attach = function(client, bufnr)
			-- Enable completion triggered by <c-x><c-o>
			vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

			-- Buffer local mappings
			local bufopts = { noremap = true, silent = true, buffer = bufnr }
			vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
			vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
			vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
			vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
			vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
			vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
			vim.keymap.set('n', '<space>wl', function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, bufopts)
			vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
			vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
			vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
			vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
			vim.keymap.set('n', '<space>f', function()
				vim.lsp.buf.format { async = true }
			end, bufopts)
		end

		-- LSP capabilities
		local capabilities = vim.lsp.protocol.make_client_capabilities()

		-- Check if cmp is available and enhance capabilities
		local cmp_lsp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
		if cmp_lsp_ok then
			capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
		end

		-- Default server configuration
		local default_config = {
			on_attach = on_attach,
			capabilities = capabilities,
		}

		-- Individual server configurations
		local servers = {
			lua_ls = {
				settings = {
					Lua = {
						runtime = {
							version = 'LuaJIT',
						},
						diagnostics = {
							globals = { 'vim' },
							enable = true,
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
						telemetry = {
							enable = false,
						},
					},
				},
			},
			ts_ls = {},
			pyright = {},
			rust_analyzer = {},
			gopls = {},
			clangd = {},
			bashls = {},
			jsonls = {},
			yamlls = {},
			html = {},
			cssls = {},
			tailwindcss = {},
		}

		-- Setup servers using vim.lsp.config
		for server, config in pairs(servers) do
			local server_config = vim.tbl_deep_extend("force", default_config, config)
			vim.lsp.config[server] = server_config
		end

		-- Force diagnostics refresh on LSP attach
		vim.api.nvim_create_autocmd('LspAttach', {
			callback = function(args)
				local client = vim.lsp.get_client_by_id(args.data.client_id)
				if client then
					-- Force diagnostics refresh
					vim.defer_fn(function()
						vim.diagnostic.show()
						vim.cmd('redrawstatus')
					end, 500)
				end
			end,
		})

		-- Auto-refresh diagnostics
		vim.api.nvim_create_autocmd({ 'DiagnosticChanged', 'BufWritePost' }, {
			callback = function()
				vim.cmd('redrawstatus')
			end,
		})

		-- Disable any lightbulb or code action signs that might appear
		-- Check if signs exist before undefining to avoid errors
		if vim.fn.sign_getdefined("LightBulbSign")[1] then
			vim.fn.sign_undefine("LightBulbSign")
		end
		if vim.fn.sign_getdefined("DiagnosticSignLightBulb")[1] then
			vim.fn.sign_undefine("DiagnosticSignLightBulb")
		end

		-- Remove any CursorHold autocmds that might show lightbulbs
		vim.api.nvim_create_autocmd('CursorHold', {
			callback = function()
				-- Clear any lightbulb signs
				vim.fn.sign_unplace("*", { name = "LightBulbSign" })
				vim.fn.sign_unplace("*", { name = "DiagnosticSignLightBulb" })
			end,
		})

		-- Override any code action sign placement
		local original_sign_place = vim.fn.sign_place
		vim.fn.sign_place = function(id, group, name, buffer, dict)
			-- Block lightbulb-related signs
			if name and (name:match("lightbulb") or name:match("LightBulb") or name:match("bulb")) then
				return
			end
			return original_sign_place(id, group, name, buffer, dict)
		end
	end,
}

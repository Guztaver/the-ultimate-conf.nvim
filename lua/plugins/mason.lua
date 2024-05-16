require("mason").setup()
require("mason-lspconfig").setup({})

require('mason-lspconfig').setup_handlers({
  function(server)
    require("lspconfig")[server].setup({})
  end,
})


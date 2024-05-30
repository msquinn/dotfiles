local chad_on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd" }

local on_attach = function(client, bufnr)
  chad_on_attach(client, bufnr)

  -- your custom on attach here

  local cmp = require "cmp"
  local cmp_select = { behavior = cmp.SelectBehavior.Insert }
  cmp.setup {
    mapping = {
      ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
      ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
      ["<C-y>"] = cmp.mapping.confirm { select = true },
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<Tab>"] = cmp.config.disable,
      ["<S-Tab>"] = cmp.config.disable
    },
  }
end

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

--
-- lspconfig.pyright.setup { blabla}

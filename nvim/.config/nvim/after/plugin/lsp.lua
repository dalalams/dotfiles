-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.ensure_installed({
	'tsserver',
	'rust_analyzer',
})

-- Fix Undefined global 'vim'
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

local cmp = require("cmp")
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select), -- go to prev
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select), -- go to next
	['<C-y>'] = cmp.mapping.confirm({ select = true }), -- accept completion
	['<C-Space>'] = cmp.mapping.complete(), -- starts completion
    ['<Tab>'] = vim.NIL,
    ['<S-Tab>'] = vim.NIL,
})

lsp.setup_nvim_cmp({
    sources = cmp.config.sources({
        { name = "cody" },
        { name = "nvim_lsp" },
    }),
    mapping = cmp_mappings
})

-- on attach happens on every single buffer that has an lsp on it
-- so the following remaps only exist for the current buffer
lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)


lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = true,
})

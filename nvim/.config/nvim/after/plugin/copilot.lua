vim.g.copilot_no_tab_map = true

vim.g.copilot_filetypes = {
    ["*"] = false,
    ["javascript"] = true,
    ["typescript"] = true,
    ["lua"] = true,
    ["rust"] = true,
    ["c"] = true,
    ["c++"] = true,
    ["go"] = true,
    ["python"] = true,
}


vim.keymap.set("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
vim.keymap.set("i", "“", '<Plug>(copilot-next)')
vim.keymap.set("i", "‘", '<Plug>(copilot-previous)')

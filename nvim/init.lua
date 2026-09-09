vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.mouse = "a"
vim.opt.termguicolors = true

vim.keymap.set("n", "<leader>w", "<cmd>write<CR>", { silent = true })

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c", "h" },
    callback = function()
        vim.bo.expandtab = true
        vim.bo.tabstop = 4
        vim.bo.shiftwidth = 4
    end,
})

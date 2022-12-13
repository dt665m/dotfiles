require("dtvim.core.opts")
require("dtvim.core.keybindings")
require("dtvim.plugins.bootstrap")
require("dtvim.lsp")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

--[[
ThePrimeagenGroup = augroup('ThePrimeagen', {})
local yank_group = augroup('HighlightYank', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({"BufEnter", "BufWinEnter", "TabEnter"}, {
    group = ThePrimeagenGroup,
    pattern = "*.rs",
    callback = function()
        require("lsp_extensions").inlay_hints{}
    end
})

]]

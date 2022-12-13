-- Custom Keybindings
-- #NOTE use ':verbose imap <{some_key}>' to check if a key is bound

local key = require("dtvim.core.utils").key

-- map `spacebar` to `Leader`
key.noremap("<space>","<nop>")
vim.g.mapleader=" "

-- Turn off search highlights with Ctrl+C twice
key.noremap("<C-c><C-c>",":nohlsearch | ccl | lcl <CR>")

-- Jump between last two buffers 
key.nnoremap("<leader><leader>","<C-^>")

-- No Up/Down Arrow Keys, Left/Right switches buffers
key.nnoremap("<up>","<nop>")
key.nnoremap("<down>","<nop>")
key.nnoremap("<left>",":bp<CR>")
key.nnoremap("<right>",":bn<CR>")
-- Maybe keep this in editing mode due to plugin usage?
-- inoremap <up> <nop>
-- inoremap <down> <nop>
-- inoremap <left> <nop>
-- inoremap <right> <nop>

-- Move by line (wrapped lines are counted.  This might be useless since nowrap is set)
key.nnoremap("j","gj")
key.nnoremap("k","gk")

---- Ctrl-C as Escape
key.nnoremap("<C-c>","<Esc>")
key.inoremap("<C-c>","<Esc>")
key.vnoremap("<C-c>","<Esc>")
key.snoremap("<C-c>","<Esc>")
key.xnoremap("<C-c>","<Esc>")
key.cnoremap("<C-c>","<Esc>")
key.onoremap("<C-c>","<Esc>")
key.lnoremap("<C-c>","<Esc>")
key.tnoremap("<C-c>","<Esc>")

-- Leader Navigation for split panes
key.nnoremap("<leader>j","<C-w><C-j>")
key.nnoremap("<leader>k","<C-w><C-k>")
key.nnoremap("<leader>h","<C-w><C-h>")
key.nnoremap("<leader>l","<C-w><C-l>")

local key = require("config.utils").key

-- No Up/Down Arrow Keys, Left/Right switches buffers
key.nnoremap("<up>", "<nop>")
key.nnoremap("<down>", "<nop>")
key.nnoremap("<left>", "<nop>")
key.nnoremap("<right>", "<nop>")
-- key.nnoremap("<left>", "<cmd>bprevious<cr>")
-- key.nnoremap("<right>", "<cmd>bnext<cr>")
key.nnoremap("<leader><space>", "<C-^>")

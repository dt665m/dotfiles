local utils = {}
local key = {}

local function bind(op, outer_opts)
  outer_opts = outer_opts or { noremap = true }
  return function(lhs, rhs, opts)
    opts = vim.tbl_extend("force", outer_opts, opts or {})
    vim.keymap.set(op, lhs, rhs, opts)
  end
end

key.bind = bind
key.map = bind("", { noremap = false })
key.mapbang = bind("!", { noremap = false })
key.nmap = bind("n", { noremap = false })
key.noremap = bind("")
key.nnoremap = bind("n")
key.vnoremap = bind("v")
key.xnoremap = bind("x")
key.inoremap = bind("i")
key.snoremap = bind("s")
key.cnoremap = bind("c")
key.onoremap = bind("o")
key.lnoremap = bind("l")
key.tnoremap = bind("t")

utils.key = key

return utils

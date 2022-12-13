local opt = vim.opt
local g = vim.g
local fn = vim.fn

-- Editor
opt.number=true            -- shows absolute number at cursor
opt.relativenumber=true    -- shows number of lines relative to cursor
opt.showmode=false         -- Turns off Vim Mode Display because lightline plugin already handles it
opt.inccommand="split"     -- show all search results in a split window
opt.wrap=false             -- long text will not wrap to next line
--opt.cmdheight=1            -- : command bottom bar height
opt.hidden=true            -- hides instead of closes buffers, important for plugins
opt.scrolloff=5            -- minimal lines above/below cursor
opt.colorcolumn="100"
opt.signcolumn="yes"       -- Always draw sign column. Prevent buffer moving when adding/deleting sign.
opt.showcmd=true           -- Show (partial) command in status line.
opt.mouse="a"              -- Enable mouse usage (all modes) in terminal
opt.termguicolors=true

-- Indentation 
opt.autoindent=true        -- enable indentation
opt.tabstop=4              -- set tab spaces
opt.softtabstop=4          -- set tab cursor movement
opt.shiftwidth=4           -- set indenting spaces
opt.expandtab=true         -- always replace tab with spaces

-- Misc
opt.timeoutlen=500         -- http://stackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line
opt.updatetime=50          -- better performance according to CoC
opt.joinspaces=false       -- https://stackoverflow.com/questions:/1578951/why-does-vim-add-spaces-when-joining-lines
opt.splitright=true
opt.splitbelow=true
opt.undofile=true
opt.undodir=os.getenv("HOME") .. "/.vimdid"
g.netrw_dirhistmax=0

-- Make diffing better: https://vimways.org/2018/the-power-of-diff/
--set diffopt+=iwhite        -- No whitespace in vimdiff
--set diffopt+=algorithm:patience
--set diffopt+=indent-heuristic

-- System Specific
if fn.executable("rg") > 0 then
    opt.grepprg="rg --no-heading --vimgrep --glob '!.git'"
    opt.grepformat="%f:%l:%c:%m"
end

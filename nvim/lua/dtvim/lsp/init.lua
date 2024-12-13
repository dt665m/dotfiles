-- Copied from nvim-lspconfig github
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local lspconfig = require("lspconfig")
local util = require("lspconfig/util")
local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    --   vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    --   vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    --   vim.keymap.set('n', '<space>wl', function()
    --       print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    --   end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

-- lspconfig.rustaceanvim.setup({
--     on_attach = function(client, bufnr)
--         -- bootstrap basics
--         on_attach(client, bufnr)
--         -- Hover actions
--         vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
--         -- Code action groups
--         vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
--     end
-- })

-- Rust Config using https://github.com/simrat39/rust-tools.nvim
local rt = require("rust-tools")
rt.setup({
    server = {
        on_attach = function(client, bufnr)
            -- bootstrap basics
            on_attach(client, bufnr)
            -- Hover actions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
        end,
    },
})

-- Golang
lspconfig.gopls.setup({
    on_attach = on_attach,
    cmd = { "gopls", "serve" },
    filetypes = { "go", "gomod" },
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
})

-- Lua Config
lspconfig.lua_ls.setup({
    on_attach = on_attach,
    settings =
    {
        Lua = {
            runtime = {
                version = 'Lua 5.3',
                path = {
                    '?.lua',
                    '?/init.lua',
                    vim.fn.expand '~/.luarocks/share/lua/5.3/?.lua',
                    vim.fn.expand '~/.luarocks/share/lua/5.3/?/init.lua',
                    '/usr/share/5.3/?.lua',
                    '/usr/share/lua/5.3/?/init.lua'
                }
            },
            diagnostics = {
                globals = { 'vim' }
            },
            workspace = {
                library = {
                    vim.fn.expand '~/.luarocks/share/lua/5.3',
                    '/usr/share/lua/5.3'
                }
            }
        }
    }
})

-- TS Config
lspconfig.tsserver.setup({
    on_attach = on_attach,
    filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
})

-- Plugin Settings. Generally, if a configuration isn't too complicated just configure it in this
-- file
--
-- #TODO
-- diagnostics for code https://rsdlt.github.io/posts/rust-nvim-ide-guide-walkthrough-development-debug/
-- figure out what omnifunc completion can do
-- lsp-format
-- git and diffs
--  - diffview.vim
--  - gitsigns
--  - neogit
--  - lazygit?
--  - original vim-fugitive
-- treesitter-context
-- crates.nvim
-- add a start screen? (alpha-nvim)
-- customize folding behavior https://www.jmaguire.tech/posts/treesitter_folding/
-- leap/hop navigation
-- snippets and completions
--  - https://rsdlt.github.io/posts/rust-nvim-ide-guide-walkthrough-development-debug/
--  - https://github.com/hrsh7th/vim-vsnip
--  - https://github.com/hrsh7th/nvim-cmp/
local function ensure_packer()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local headless = #vim.api.nvim_list_uis() == 0
-- print('is headless: ', headless)
--local packer_bootstrap = ensure_packer() and not headless
local packer_bootstrap = ensure_packer()

vim.api.nvim_create_autocmd("BufWritePost", {
    desc = "Compile Packer plugins source.",
    pattern = "bootstrap.lua",
    callback = function(args)
        vim.cmd.source(args.file)
        vim.cmd.PackerCompile()
    end,
})

return require("packer").startup({
    function(use)
        print('packer starting')
        use "wbthomason/packer.nvim"

        -- UI
        use({
            {
                "catppuccin/nvim",
                as = "catppuccin",
                config = require("dtvim.plugins.config.ui").catppuccin,
            },
            {
                "nvim-lualine/lualine.nvim",
                requires = "kyazdani42/nvim-web-devicons",
                config = require("dtvim.plugins.config.ui").lualine,
            },
            {
                "arkav/lualine-lsp-progress",
                requires = "nvim-lualine/lualine.nvim",
            },
            {
                "akinsho/bufferline.nvim",
                tag = "v3.*",
                requires = "nvim-tree/nvim-web-devicons",
                config = require("dtvim.plugins.config.ui").bufferline,
            },
            {
                "nvim-telescope/telescope.nvim",
                tag = "0.1.5",
                requires = "nvim-lua/plenary.nvim",
                config = require("dtvim.plugins.config.ui").telescope,
            },
            {
                "folke/which-key.nvim",
                config = function()
                    require("which-key").setup({
                    })
                end
            },
            {
                "lukas-reineke/indent-blankline.nvim",
                main = "ibl",
                opts = {
                    show_current_context = true,
                }
                -- config = function()
                --     require("ibl").setup {
                --         show_current_context = true,
                --         --show_current_context_start = true,
                --     }
                -- end,
            }
        })

        --      use("hrsh7th/cmp-nvim-lsp")
        --   use("hrsh7th/cmp-buffer")
        --  use("hrsh7th/nvim-cmp")

        -- LSP
        use({
            {
                "neovim/nvim-lspconfig",
            },
            {
                "williamboman/mason.nvim",
                requires = "neovim/nvim-lspconfig",
                config = function() require("mason").setup() end,
            },
            {
                "williamboman/mason-lspconfig.nvim",
                requires = {
                    { "neovim/nvim-lspconfig" },
                    { "williamboman/mason-lspconfig.nvim" },
                },
                config = function() require("mason-lspconfig").setup() end,
            },
            {
                "folke/trouble.nvim",
                requires = "kyazdani42/nvim-web-devicons",
                config = function()
                    require("trouble").setup {
                        auto_fold = true,
                    }
                    local bOpts = { silent = true, noremap = true }
                    vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", bOpts)
                    vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", bOpts)
                    vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", bOpts)
                    vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", bOpts)
                    vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", bOpts)
                    vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", bOpts)
                end
            },
            {
                --settings in lsp/init.lua
                "simrat39/rust-tools.nvim",
                requires = "neovim/nvim-lspconfig",
            },
        })

        -- Editor/Treesitter
        use({
            {
                "nvim-treesitter/nvim-treesitter",
                run = function()
                    require('nvim-treesitter.install').update({ with_sync = true })()
                end,
                config = require("dtvim.plugins.config.editor").nvim_treesitter,
            },
            {
                "nvim-treesitter/nvim-treesitter-textobjects",
                after = "nvim-treesitter",
            },
            {
                "JoosepAlviste/nvim-ts-context-commentstring",
                after = "nvim-treesitter",
            },
            -- {
            --     "IndianBoy42/tree-sitter-just",
            --     after = "nvim-treesitter",
            --     config = function()
            --         require("tree-sitter-just").setup()
            --     end,
            -- },
            {
                "numToStr/Comment.nvim",
                after = "nvim-treesitter",
                config = function()
                    require("Comment").setup()
                end,
            },
            {
                "windwp/nvim-autopairs",
                config = function()
                    require("nvim-autopairs").setup()
                end
            }
        })

        -- Automatically set up your configuration after cloning packer.nvim
        -- Put this at the end after all plugins
        if packer_bootstrap then
            print('packer syncing from bootstrap')
            require("packer").sync()
        end
    end,
    config = {
        -- package_root   = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack'),
        -- compile_path = util.join_paths(vim.fn.stdpath('data'), 'plugin', 'packer_compiled.lua'),
    }
})

-- OLD NO CONFIG METHOD
-- return require("packer").startup(function(use)
--     print('packer starting')
--     use "wbthomason/packer.nvim"
--
--     -- Automatically set up your configuration after cloning packer.nvim
--     -- Put this at the end after all plugins
--     if packer_bootstrap then
--         print('packer syncing from bootstrap')
--         require("packer").sync()
--     end
-- end)

local M = {}

function M.nvim_treesitter()
    --#NOTE disable folding for now.  Wanted Behaviour: Fold/Unfold only functions with a button
    --vim.api.nvim_set_option_value("foldmethod", "expr", {})
    --vim.api.nvim_set_option_value("foldexpr", "nvim_treesitter#foldexpr()", {})

    require("nvim-treesitter.configs").setup({
        ensure_installed = {
            "bash",
            "rust",
            "go",
            "c",
            "cpp",
            "lua",
            "python",
            "javascript",
            "typescript",
            "html",
            "css",
            "vim",
            "help",
            "gomod",
            "json",
            "yaml",
            "toml",
            "make",
            "vue",
            "tsx",
        },
        highlight = {
            enable = true,
            disable = { "vim" },
            additional_vim_regex_highlighting = false,
        },
        textobjects = {
            select = {
                enable = true,
                keymaps = {
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@class.outer",
                    ["ic"] = "@class.inner",
                },
            },
            move = {
                enable = true,
                set_jumps = true, -- whether to set jumps in the jumplist
                goto_next_start = {
                    ["]["] = "@function.outer",
                    ["]m"] = "@class.outer",
                },
                goto_next_end = {
                    ["]]"] = "@function.outer",
                    ["]M"] = "@class.outer",
                },
                goto_previous_start = {
                    ["[["] = "@function.outer",
                    ["[m"] = "@class.outer",
                },
                goto_previous_end = {
                    ["[]"] = "@function.outer",
                    ["[M"] = "@class.outer",
                },
            },
            swap = {
                enable = true,
                swap_next = { ["<leader>xp"] = "@parameter.inner" },
                swap_previous = { ["<leader>xP"] = "@parameter.inner" }
            },
        },
        rainbow = {
            enable = true,
            extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
            max_file_lines = 2000, -- Do not enable for files with more than 2000 lines, int
        },
        --		context_commentstring = { enable = true, enable_autocmd = false },
        --		matchup = { enable = true },
    })
    require("nvim-treesitter.install").prefer_git = true
    --	if use_ssh then
    --		local parsers = require("nvim-treesitter.parsers").get_parser_configs()
    --		for _, p in pairs(parsers) do
    --			p.install_info.url = p.install_info.url:gsub("https://github.com/", "git@github.com:")
    --		end
    --	end
end

return M

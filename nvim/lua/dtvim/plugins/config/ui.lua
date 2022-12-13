local M = {}

function M.catppuccin()
    require("catppuccin").setup({
        flavour = "mocha", -- Can be one of: latte, frappe, macchiato, mocha
        background = { light = "latte", dark = "mocha" },
        dim_inactive = {
            enabled = false,
            -- Dim inactive splits/windows/buffers.
            -- NOT recommended if you use old palette (a.k.a., mocha).
            shade = "dark",
            percentage = 0.15,
        },
        transparent_background = false,
        term_colors = true,
        compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
        styles = {
            comments = { "italic" },
            properties = { "italic" },
            functions = { "italic", "bold" },
            keywords = { "italic" },
            operators = { "bold" },
            conditionals = { "bold" },
            loops = { "bold" },
            booleans = { "bold", "italic" },
            numbers = {},
            types = {},
            strings = {},
            variables = {},
        },
        integrations = {
            treesitter = true,
            native_lsp = {
                enabled = true,
                virtual_text = {
                    errors = { "italic" },
                    hints = { "italic" },
                    warnings = { "italic" },
                    information = { "italic" },
                },
                underlines = {
                    errors = { "underline" },
                    hints = { "underline" },
                    warnings = { "underline" },
                    information = { "underline" },
                },
            },
            lsp_trouble = true,
            lsp_saga = true,
            gitgutter = false,
            gitsigns = true,
            telescope = true,
            nvimtree = true,
            which_key = true,
            indent_blankline = { enabled = true, colored_indent_levels = false },
            dashboard = true,
            neogit = false,
            vim_sneak = false,
            fern = false,
            barbar = false,
            markdown = true,
            lightspeed = false,
            ts_rainbow = true,
            mason = true,
            neotest = false,
            noice = false,
            hop = true,
            illuminate = true,
            cmp = true,
            dap = { enabled = true, enable_ui = true },
            notify = true,
            symbols_outline = false,
            coc_nvim = false,
            leap = false,
            neotree = { enabled = false, show_root = true, transparent_panel = false },
            telekasten = false,
            mini = false,
            aerial = false,
            vimwiki = true,
            beacon = false,
            navic = { enabled = false },
            overseer = false,
            fidget = true,
        },
        color_overrides = {
            mocha = {
                rosewater = "#F5E0DC",
                flamingo = "#F2CDCD",
                mauve = "#DDB6F2",
                pink = "#F5C2E7",
                red = "#F28FAD",
                maroon = "#E8A2AF",
                peach = "#F8BD96",
                yellow = "#FAE3B0",
                green = "#ABE9B3",
                blue = "#96CDFB",
                sky = "#89DCEB",
                teal = "#B5E8E0",
                lavender = "#C9CBFF",

                text = "#D9E0EE",
                subtext1 = "#BAC2DE",
                subtext0 = "#A6ADC8",
                overlay2 = "#C3BAC6",
                overlay1 = "#988BA2",
                overlay0 = "#6E6C7E",
                surface2 = "#6E6C7E",
                surface1 = "#575268",
                surface0 = "#302D41",

                base = "#1E1E2E",
                mantle = "#1A1826",
                crust = "#161320",
            },
        },
        highlight_overrides = {
            mocha = function(cp)
                return {
                    -- For base configs.
                    CursorLineNr = { fg = cp.green },
                    Search = { bg = cp.surface1, fg = cp.pink, style = { "bold" } },
                    IncSearch = { bg = cp.pink, fg = cp.surface1 },
                    Keyword = { fg = cp.pink },
                    Type = { fg = cp.blue },
                    Typedef = { fg = cp.yellow },

                    -- For native lsp configs.
                    DiagnosticVirtualTextError = { bg = cp.none },
                    DiagnosticVirtualTextWarn = { bg = cp.none },
                    DiagnosticVirtualTextInfo = { bg = cp.none },
                    DiagnosticVirtualTextHint = { fg = cp.rosewater, bg = cp.none },

                    DiagnosticHint = { fg = cp.rosewater },
                    LspDiagnosticsDefaultHint = { fg = cp.rosewater },
                    LspDiagnosticsHint = { fg = cp.rosewater },
                    LspDiagnosticsVirtualTextHint = { fg = cp.rosewater },
                    LspDiagnosticsUnderlineHint = { sp = cp.rosewater },

                    -- For fidget.
                    FidgetTask = { bg = cp.none, fg = cp.surface2 },
                    FidgetTitle = { fg = cp.blue, style = { "bold" } },

                    -- For treesitter.
                    ["@field"] = { fg = cp.rosewater },
                    ["@property"] = { fg = cp.yellow },

                    ["@include"] = { fg = cp.teal },
                    -- ["@operator"] = { fg = cp.sky },
                    ["@keyword.operator"] = { fg = cp.sky },
                    ["@punctuation.special"] = { fg = cp.maroon },

                    -- ["@float"] = { fg = cp.peach },
                    -- ["@number"] = { fg = cp.peach },
                    -- ["@boolean"] = { fg = cp.peach },

                    ["@constructor"] = { fg = cp.lavender },
                    -- ["@constant"] = { fg = cp.peach },
                    -- ["@conditional"] = { fg = cp.mauve },
                    -- ["@repeat"] = { fg = cp.mauve },
                    ["@exception"] = { fg = cp.peach },

                    ["@constant.builtin"] = { fg = cp.lavender },
                    -- ["@function.builtin"] = { fg = cp.peach, style = { "italic" } },
                    -- ["@type.builtin"] = { fg = cp.yellow, style = { "italic" } },
                    ["@variable.builtin"] = { fg = cp.red, style = { "italic" } },

                    -- ["@function"] = { fg = cp.blue },
                    ["@function.macro"] = { fg = cp.red, style = {} },
                    ["@parameter"] = { fg = cp.rosewater },
                    ["@keyword"] = { fg = cp.red, style = { "italic" } },
                    ["@keyword.function"] = { fg = cp.maroon },
                    ["@keyword.return"] = { fg = cp.pink, style = {} },

                    -- ["@text.note"] = { fg = cp.base, bg = cp.blue },
                    -- ["@text.warning"] = { fg = cp.base, bg = cp.yellow },
                    -- ["@text.danger"] = { fg = cp.base, bg = cp.red },
                    -- ["@constant.macro"] = { fg = cp.mauve },

                    -- ["@label"] = { fg = cp.blue },
                    ["@method"] = { style = { "italic" } },
                    ["@namespace"] = { fg = cp.rosewater, style = {} },

                    ["@punctuation.delimiter"] = { fg = cp.teal },
                    ["@punctuation.bracket"] = { fg = cp.overlay2 },
                    -- ["@string"] = { fg = cp.green },
                    -- ["@string.regex"] = { fg = cp.peach },
                    ["@type"] = { fg = cp.yellow },
                    ["@variable"] = { fg = cp.text },
                    ["@tag.attribute"] = { fg = cp.mauve, style = { "italic" } },
                    ["@tag"] = { fg = cp.peach },
                    ["@tag.delimiter"] = { fg = cp.maroon },
                    ["@text"] = { fg = cp.text },

                    -- ["@text.uri"] = { fg = cp.rosewater, style = { "italic", "underline" } },
                    -- ["@text.literal"] = { fg = cp.teal, style = { "italic" } },
                    -- ["@text.reference"] = { fg = cp.lavender, style = { "bold" } },
                    -- ["@text.title"] = { fg = cp.blue, style = { "bold" } },
                    -- ["@text.emphasis"] = { fg = cp.maroon, style = { "italic" } },
                    -- ["@text.strong"] = { fg = cp.maroon, style = { "bold" } },
                    -- ["@string.escape"] = { fg = cp.pink },

                    -- ["@property.toml"] = { fg = cp.blue },
                    -- ["@field.yaml"] = { fg = cp.blue },

                    -- ["@label.json"] = { fg = cp.blue },

                    ["@function.builtin.bash"] = { fg = cp.red, style = { "italic" } },
                    ["@parameter.bash"] = { fg = cp.yellow, style = { "italic" } },

                    ["@field.lua"] = { fg = cp.lavender },
                    ["@constructor.lua"] = { fg = cp.flamingo },

                    ["@constant.java"] = { fg = cp.teal },

                    ["@property.typescript"] = { fg = cp.lavender, style = { "italic" } },
                    -- ["@constructor.typescript"] = { fg = cp.lavender },

                    -- ["@constructor.tsx"] = { fg = cp.lavender },
                    -- ["@tag.attribute.tsx"] = { fg = cp.mauve },

                    ["@type.css"] = { fg = cp.lavender },
                    ["@property.css"] = { fg = cp.yellow, style = { "italic" } },

                    ["@property.cpp"] = { fg = cp.text },

                    -- ["@symbol"] = { fg = cp.flamingo },
                }
            end,
        },
    })
    vim.cmd.colorscheme("catppuccin")
end

function M.lualine()
    require('lualine').setup({
        options = {
            icons_enabled = true,
            theme = 'auto',
            component_separators = { left = '', right = '' },
            section_separators = { left = '', right = '' },
            disabled_filetypes = {
                statusline = {},
                winbar = {},
            },
            ignore_focus = {},
            always_divide_middle = true,
            globalstatus = false,
            refresh = {
                statusline = 1000,
                tabline = 1000,
                winbar = 1000,
            }
        },
        sections = {
            lualine_a = {},
            lualine_b = { 'branch', 'diff', 'diagnostics' },
            lualine_c = { { 'filename', path = 1 }, 'lsp_progress' },
            lualine_x = { 'encoding', 'fileformat', { 'filetype', icon_only = true } },
            lualine_y = { 'progress' },
            lualine_z = { 'location' }
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {},
            lualine_x = { 'location' },
            lualine_y = {},
            lualine_z = {}
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}
    })
end

function M.bufferline()
    -- lualine already shows the filetype icons
    require('bufferline').setup({
        options = {
            show_buffer_icons = false,
        }
    })
end

function M.telescope()
    local actions = require("telescope.actions")
    local actions_set = require("telescope.actions.set")

    -- #HACK see
    -- https://github.com/nvim-telescope/telescope.nvim/issues/559
    -- and
    -- https://github.com/nvim-telescope/telescope.nvim/issues/1277
    local fixfolds = {
        attach_mappings = function(_)
            actions_set.select:enhance({
                post = function()
                    vim.api.nvim_command([[:normal! zx"]])
                end,
            })
            return true
        end,
    }

    require("telescope").setup({
        defaults = {
            initial_mode = "insert",
            --prompt_prefix = " " .. icons.ui.Telescope .. " ",
            --selection_caret = icons.ui.ChevronRight,
            entry_prefix = " ",
            scroll_strategy = "limit",
            results_title = false,
            layout_strategy = "horizontal",
            path_display = { "absolute" },
            file_ignore_patterns = { ".git/", ".cache", "%.class", "%.pdf", "%.mkv", "%.mp4", "%.zip" },
            layout_config = {
                horizontal = {
                    preview_width = 0.5,
                },
            },
            file_previewer = require("telescope.previewers").vim_buffer_cat.new,
            grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
            qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
            file_sorter = require("telescope.sorters").get_fuzzy_file,
            generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        },
        pickers = {
            buffers = fixfolds,
            find_files = vim.tbl_extend("force", fixfolds, {
                hidden = true,
                mappings = {
                    n = {
                        ["y"] = actions.send_selected_to_qflist + actions.open_qflist,
                    },
                },
            }),
            git_files = fixfolds,
            grep_string = fixfolds,
            live_grep = vim.tbl_extend("force", fixfolds, {
                additional_args = function(_) return { "--hidden" } end,
                mappings = {
                    n = {
                        ["y"] = actions.send_selected_to_qflist + actions.open_qflist,
                    },
                },
            }),
            oldfiles = fixfolds,
        },
    })

    -- KeyMappings
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>p', builtin.find_files, {})
    vim.keymap.set('n', '<leader>s', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
end

return M

return {
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = {
  --     codelens = {
  --       enabled = true,
  --     },
  --   },
  -- },

  {
    "hrsh7th/nvim-cmp",
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local cmp = require("cmp")

      -- Do not select anythign by default, so pressing enter at the end of the line doesn't
      -- pick a completion
      opts.preselect = cmp.PreselectMode.None
      opts.completion = {
        completeopt = "menu,menuone,noinsert,noselect",
      }

      -- Super Tab
      local mapping = opts.mapping or {}
      ---@diagnostic disable-next-line: inject-field
      opts.mapping = vim.tbl_extend("force", mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
            cmp.select_next_item()
          elseif vim.snippet.active({ direction = 1 }) then
            vim.schedule(function()
              vim.snippet.jump(1)
            end)
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif vim.snippet.active({ direction = -1 }) then
            vim.schedule(function()
              vim.snippet.jump(-1)
            end)
          else
            fallback()
          end
        end, { "i", "s" }),
        -- Make CR (enter) not select the current suggestion suggestion
        -- works in tandem with PreselectMode.None
        ["<CR>"] = cmp.mapping({
          i = function(fallback)
            if cmp.visible() and cmp.get_active_entry() then
              cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
            else
              fallback()
            end
          end,
          s = cmp.mapping.confirm({ select = true }),
          c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
        }),
      })
    end,
  },

  -- LazyVim v11+ ships with blink.cmp instead of nvim-cmp.
  -- Mirror the old nvim-cmp behaviour: no preselect/auto-insert and <CR> only
  -- accepts when you've explicitly picked an item (otherwise it makes a newline).
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      opts.completion = opts.completion or {}
      opts.completion.list = vim.tbl_deep_extend("force", opts.completion.list or {}, {
        selection = {
          preselect = false,
          auto_insert = false,
        },
      })

      opts.keymap = vim.tbl_deep_extend("force", opts.keymap or {}, {
        -- remove the default "enter" preset that auto-accepts on <CR>
        preset = "default",
        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<CR>"] = {
          function(cmp)
            if cmp.is_visible() and cmp.get_selected_item() then
              return cmp.accept()
            end
          end,
          "fallback",
        },
      })
    end,
  },
}

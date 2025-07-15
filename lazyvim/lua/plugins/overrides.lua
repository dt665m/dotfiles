return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader><space>", false },
    },
  },

  {
    "mrcjkb/rustaceanvim",
    opts = function(_, opts)
      opts.server = opts.server or {}
      opts.server.settings = opts.server.settings or {}
      opts.server.settings["rust-analyzer"] = opts.server.settings["rust-analyzer"] or {}

      -- ✅ Enable proc-macros
      opts.server.settings["rust-analyzer"].procMacro = { enable = true }
      opts.server.settings["rust-analyzer"].diagnostics = {
        enable = true,
        disabled = { "unresolved-proc-macro" },
        enableExperimental = true,
      }

      -- ✅ Preserve your inlay hint config
      opts.server.settings["rust-analyzer"].inlayHints = {
        parameterHints = false,
        typeHints = false,
      }
    end,
  },

  {
    "catppuccin",
    opts = {
      background = { light = "latte", dark = "mocha" },
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
    },
  },
}

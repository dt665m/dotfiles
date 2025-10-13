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
      local ra = vim.tbl_deep_extend("force", opts.server.settings["rust-analyzer"] or {}, {
        diagnostics = {
          enable = true,
          disabled = { "unresolved-proc-macro" },
          experimental = { enable = true },
        },
        inlayHints = {
          parameterHints = { enable = false },
          typeHints = { enable = false },
        },
      })

      opts.server.settings["rust-analyzer"] = ra
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

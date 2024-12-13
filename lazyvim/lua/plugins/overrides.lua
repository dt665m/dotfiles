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
    opts = {
      server = {
        default_settings = {
          ["rust-analyzer"] = {
            inlayHints = {
              parameterHints = false,
              typeHints = false,
            },
          },
        },
      },
    },
  },

  {
    "catppuccin/nvim",
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

-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/denis/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/denis/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/denis/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/denis/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/denis/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/denis/.local/share/nvim/site/pack/packer/opt/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\ne\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\1\22show_buffer_icons\1\nsetup\15bufferline\frequire\0" },
    loaded = true,
    path = "/Users/denis/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  catppuccin = {
    config = { "\27LJ\2\n¨\16\0\1\4\0Ö\1\0Í\0015\1\3\0005\2\1\0009\3\0\0=\3\2\2=\2\4\0015\2\6\0009\3\5\0=\3\a\0029\3\b\0=\3\2\0025\3\t\0=\3\n\2=\2\v\0015\2\f\0009\3\b\0=\3\a\0029\3\5\0=\3\2\2=\2\r\0015\2\14\0009\3\b\0=\3\2\2=\2\15\0015\2\17\0009\3\16\0=\3\2\2=\2\18\0015\2\20\0009\3\19\0=\3\2\2=\2\21\0015\2\23\0009\3\22\0=\3\a\2=\2\24\0015\2\25\0009\3\22\0=\3\a\2=\2\26\0015\2\27\0009\3\22\0=\3\a\2=\2\28\0015\2\30\0009\3\29\0=\3\2\0029\3\22\0=\3\a\2=\2\31\0015\2 \0009\3\29\0=\3\2\2=\2!\0015\2\"\0009\3\29\0=\3\2\2=\2#\0015\2$\0009\3\29\0=\3\2\2=\2%\0015\2&\0009\3\29\0=\3\2\2=\2'\0015\2(\0009\3\29\0=\3)\2=\2*\0015\2+\0009\3\22\0=\3\a\0029\3,\0=\3\2\2=\2-\0015\2.\0009\3\16\0=\3\2\0025\3/\0=\3\n\2=\0020\0015\0021\0009\3\29\0=\3\2\2=\0022\0015\0023\0009\3\19\0=\3\2\2=\0024\0015\0026\0009\0035\0=\3\2\2=\0027\0015\0029\0009\0038\0=\3\2\2=\2:\0015\2<\0009\3;\0=\3\2\2=\2=\0015\2?\0009\3>\0=\3\2\2=\2@\0015\2B\0009\3A\0=\3\2\2=\2C\0015\2D\0009\3>\0=\3\2\2=\2E\0015\2G\0009\3F\0=\3\2\0025\3H\0=\3\n\2=\2I\0015\2J\0009\3F\0=\3\2\0024\3\0\0=\3\n\2=\2K\0015\2L\0009\3\29\0=\3\2\2=\2M\0015\2N\0009\3F\0=\3\2\0025\3O\0=\3\n\2=\2P\0015\2Q\0009\3;\0=\3\2\2=\2R\0015\2S\0009\3\b\0=\3\2\0024\3\0\0=\3\n\2=\2T\0015\2V\0005\3U\0=\3\n\2=\2W\0015\2X\0009\3\29\0=\3\2\0024\3\0\0=\3\n\2=\2Y\0015\2Z\0009\0035\0=\3\2\2=\2[\0015\2]\0009\3\\\0=\3\2\2=\2^\0015\2_\0009\3\19\0=\3\2\2=\2`\0015\2b\0009\3a\0=\3\2\2=\2c\0015\2e\0009\3d\0=\3\2\0025\3f\0=\3\n\2=\2g\0015\2h\0009\3A\0=\3\2\2=\2i\0015\2j\0009\3;\0=\3\2\2=\2k\0015\2l\0009\3a\0=\3\2\2=\2m\0015\2n\0009\3F\0=\3\2\0025\3o\0=\3\n\2=\2p\0015\2q\0009\3\19\0=\3\2\0025\3r\0=\3\n\2=\2s\0015\2t\0009\3>\0=\3\2\2=\2u\0015\2w\0009\3v\0=\3\2\2=\2x\0015\2y\0009\0035\0=\3\2\2=\2z\0015\2{\0009\3>\0=\3\2\0025\3|\0=\3\n\2=\2}\0015\2~\0009\3>\0=\3\2\2=\2\127\0015\2Ä\0009\3\19\0=\3\2\0025\3Å\0=\3\n\2=\2Ç\0015\2É\0009\3a\0=\3\2\2=\2Ñ\1L\1\2\0\18@property.cpp\1\0\0\18@property.css\1\2\0\0\vitalic\1\0\0\14@type.css\1\0\0\25@property.typescript\1\2\0\0\vitalic\1\0\0\19@constant.java\1\0\0\21@constructor.lua\1\0\0\rflamingo\15@field.lua\1\0\0\20@parameter.bash\1\2\0\0\vitalic\1\0\0\27@function.builtin.bash\1\2\0\0\vitalic\1\0\0\n@text\1\0\0\19@tag.delimiter\1\0\0\t@tag\1\0\0\19@tag.attribute\1\2\0\0\vitalic\1\0\0\nmauve\14@variable\1\0\0\ttext\n@type\1\0\0\25@punctuation.bracket\1\0\0\roverlay2\27@punctuation.delimiter\1\0\0\15@namespace\1\0\0\f@method\1\0\0\1\2\0\0\vitalic\20@keyword.return\1\0\0\22@keyword.function\1\0\0\r@keyword\1\2\0\0\vitalic\1\0\0\15@parameter\1\0\0\20@function.macro\1\0\0\22@variable.builtin\1\2\0\0\vitalic\1\0\0\bred\22@constant.builtin\1\0\0\15@exception\1\0\0\npeach\17@constructor\1\0\0\rlavender\25@punctuation.special\1\0\0\vmaroon\22@keyword.operator\1\0\0\bsky\r@include\1\0\0\tteal\14@property\1\0\0\v@field\1\0\0\16FidgetTitle\1\2\0\0\tbold\1\0\0\15FidgetTask\rsurface2\1\0\0 LspDiagnosticsUnderlineHint\asp\1\0\0\"LspDiagnosticsVirtualTextHint\1\0\0\23LspDiagnosticsHint\1\0\0\30LspDiagnosticsDefaultHint\1\0\0\19DiagnosticHint\1\0\0\30DiagnosticVirtualTextHint\1\0\0\14rosewater\30DiagnosticVirtualTextInfo\1\0\0\30DiagnosticVirtualTextWarn\1\0\0\31DiagnosticVirtualTextError\1\0\0\tnone\fTypedef\1\0\0\vyellow\tType\1\0\0\tblue\fKeyword\1\0\0\14IncSearch\1\0\0\vSearch\nstyle\1\2\0\0\tbold\tpink\abg\1\0\0\rsurface1\17CursorLineNr\1\0\0\afg\1\0\0\ngreenÛ\14\1\0\a\0I\0Z6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0026\3\b\0009\3\t\0039\3\n\3'\5\v\0B\3\2\2'\4\f\0&\3\4\3=\3\r\0025\3\15\0005\4\14\0=\4\16\0035\4\17\0=\4\18\0035\4\19\0=\4\20\0035\4\21\0=\4\22\0035\4\23\0=\4\24\0035\4\25\0=\4\26\0035\4\27\0=\4\28\0035\4\29\0=\4\30\0034\4\0\0=\4\31\0034\4\0\0=\4 \0034\4\0\0=\4!\0034\4\0\0=\4\"\3=\3#\0025\3$\0005\4%\0005\5'\0005\6&\0=\6(\0055\6)\0=\6*\0055\6+\0=\6,\0055\6-\0=\6.\5=\5/\0045\0051\0005\0060\0=\6(\0055\0062\0=\6*\0055\0063\0=\6,\0055\0064\0=\6.\5=\0055\4=\0046\0035\0047\0=\0048\0035\0049\0=\4:\0035\4;\0=\4<\0035\4=\0=\4>\3=\3?\0025\3A\0005\4@\0=\4B\3=\3C\0025\3E\0003\4D\0=\4B\3=\3F\2B\0\2\0016\0\b\0009\0G\0009\0H\0'\2\1\0B\0\2\1K\0\1\0\16colorscheme\bcmd\24highlight_overrides\1\0\0\0\20color_overrides\nmocha\1\0\0\1\0\25\tteal\f#B5E8E0\roverlay2\f#C3BAC6\bsky\f#89DCEB\roverlay1\f#988BA2\tblue\f#96CDFB\roverlay0\f#6E6C7E\ngreen\f#ABE9B3\ncrust\f#161320\vyellow\f#FAE3B0\vmantle\f#1A1826\npeach\f#F8BD96\tbase\f#1E1E2E\vmaroon\f#E8A2AF\rsurface0\f#302D41\bred\f#F28FAD\rsurface1\f#575268\tpink\f#F5C2E7\rsurface2\f#6E6C7E\nmauve\f#DDB6F2\rflamingo\f#F2CDCD\14rosewater\f#F5E0DC\rsubtext0\f#A6ADC8\rsubtext1\f#BAC2DE\ttext\f#D9E0EE\rlavender\f#C9CBFF\17integrations\nnavic\1\0\1\fenabled\1\fneotree\1\0\3\22transparent_panel\1\14show_root\2\fenabled\1\bdap\1\0\2\14enable_ui\2\fenabled\2\21indent_blankline\1\0\2\26colored_indent_levels\1\fenabled\2\15native_lsp\15underlines\1\2\0\0\14underline\1\2\0\0\14underline\1\2\0\0\14underline\1\0\0\1\2\0\0\14underline\17virtual_text\16information\1\2\0\0\vitalic\rwarnings\1\2\0\0\vitalic\nhints\1\2\0\0\vitalic\verrors\1\0\0\1\2\0\0\vitalic\1\0\1\fenabled\2\1\0!\tmini\1\nmason\2\15treesitter\2\vfidget\2\roverseer\1\vbeacon\1\fvimwiki\2\vaerial\1\vnotify\2\15telekasten\1\tleap\1\rcoc_nvim\1\20symbols_outline\1\bcmp\2\15illuminate\2\bhop\2\nnoice\1\fneotest\1\15ts_rainbow\2\15lightspeed\1\rmarkdown\2\vbarbar\1\tfern\1\14vim_sneak\1\vneogit\1\14dashboard\2\14telescope\2\14which_key\2\rnvimtree\2\rgitsigns\2\14gitgutter\1\rlsp_saga\2\16lsp_trouble\2\vstyles\14variables\fstrings\ntypes\fnumbers\rbooleans\1\3\0\0\tbold\vitalic\nloops\1\2\0\0\tbold\17conditionals\1\2\0\0\tbold\14operators\1\2\0\0\tbold\rkeywords\1\2\0\0\vitalic\14functions\1\3\0\0\vitalic\tbold\15properties\1\2\0\0\vitalic\rcomments\1\0\0\1\2\0\0\vitalic\17compile_path\16/catppuccin\ncache\fstdpath\afn\bvim\17dim_inactive\1\0\3\15percentage\4≥ÊÃô\3≥Êå˛\3\nshade\tdark\fenabled\1\15background\1\0\2\tdark\nmocha\nlight\nlatte\1\0\3\fflavour\nmocha\16term_colors\2\27transparent_background\1\nsetup\15catppuccin\frequire\0" },
    loaded = true,
    path = "/Users/denis/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n[\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\25show_current_context\2\nsetup\21indent_blankline\frequire\0" },
    loaded = true,
    path = "/Users/denis/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lualine-lsp-progress"] = {
    loaded = true,
    path = "/Users/denis/.local/share/nvim/site/pack/packer/start/lualine-lsp-progress",
    url = "https://github.com/arkav/lualine-lsp-progress"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nµ\6\0\0\6\0&\0?6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\15\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0004\5\0\0=\5\t\0044\5\0\0=\5\n\4=\4\v\0034\4\0\0=\4\f\0035\4\r\0=\4\14\3=\3\16\0025\3\17\0004\4\0\0=\4\18\0035\4\19\0=\4\20\0035\4\22\0005\5\21\0>\5\1\4=\4\23\0035\4\24\0005\5\25\0>\5\3\4=\4\26\0035\4\27\0=\4\28\0035\4\29\0=\4\30\3=\3\31\0025\3 \0004\4\0\0=\4\18\0034\4\0\0=\4\20\0034\4\0\0=\4\23\0035\4!\0=\4\26\0034\4\0\0=\4\28\0034\4\0\0=\4\30\3=\3\"\0024\3\0\0=\3#\0024\3\0\0=\3\n\0024\3\0\0=\3$\0024\3\0\0=\3%\2B\0\2\1K\0\1\0\15extensions\20inactive_winbar\ftabline\22inactive_sections\1\2\0\0\rlocation\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\2\1\0\rfiletype\14icon_only\2\1\3\0\0\rencoding\15fileformat\14lualine_c\1\3\0\0\0\17lsp_progress\1\2\1\0\rfilename\tpath\3\1\14lualine_b\1\4\0\0\vbranch\tdiff\16diagnostics\14lualine_a\1\0\0\foptions\1\0\0\frefresh\1\0\3\ftabline\3Ë\a\vwinbar\3Ë\a\15statusline\3Ë\a\17ignore_focus\23disabled_filetypes\vwinbar\15statusline\1\0\0\23section_separators\1\0\2\nright\bÓÇ≤\tleft\bÓÇ∞\25component_separators\1\0\2\nright\bÓÇ≥\tleft\bÓÇ±\1\0\4\ntheme\tauto\18icons_enabled\2\17globalstatus\1\25always_divide_middle\2\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/Users/denis/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20mason-lspconfig\frequire\0" },
    loaded = true,
    path = "/Users/denis/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    config = { "\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nmason\frequire\0" },
    loaded = true,
    path = "/Users/denis/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/Users/denis/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/denis/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    after = { "nvim-treesitter-textobjects", "nvim-ts-context-commentstring", "Comment.nvim" },
    config = { "\27LJ\2\n√\a\0\0\6\0$\0*6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0005\4\a\0=\4\b\3=\3\t\0025\3\r\0005\4\n\0005\5\v\0=\5\f\4=\4\14\0035\4\15\0005\5\16\0=\5\17\0045\5\18\0=\5\19\0045\5\20\0=\5\21\0045\5\22\0=\5\23\4=\4\24\0035\4\25\0005\5\26\0=\5\27\0045\5\28\0=\5\29\4=\4\30\3=\3\31\0025\3 \0=\3!\2B\0\2\0016\0\0\0'\2\"\0B\0\2\2+\1\2\0=\1#\0K\0\1\0\15prefer_git\28nvim-treesitter.install\frainbow\1\0\3\venable\2\19max_file_lines\3–\15\18extended_mode\2\16textobjects\tswap\18swap_previous\1\0\1\15<leader>xP\21@parameter.inner\14swap_next\1\0\1\15<leader>xp\21@parameter.inner\1\0\1\venable\2\tmove\22goto_previous_end\1\0\2\a[]\20@function.outer\a[M\17@class.outer\24goto_previous_start\1\0\2\a[m\17@class.outer\a[[\20@function.outer\18goto_next_end\1\0\2\a]]\20@function.outer\a]M\17@class.outer\20goto_next_start\1\0\2\a]m\17@class.outer\a][\20@function.outer\1\0\2\venable\2\14set_jumps\2\vselect\1\0\0\fkeymaps\1\0\4\aif\20@function.inner\aic\17@class.inner\aaf\20@function.outer\aac\17@class.outer\1\0\1\venable\2\14highlight\fdisable\1\2\0\0\bvim\1\0\2\venable\2&additional_vim_regex_highlighting\1\21ensure_installed\1\0\0\1\21\0\0\tbash\trust\ago\6c\bcpp\blua\vpython\15javascript\15typescript\thtml\bcss\bvim\thelp\ngomod\tjson\tyaml\ttoml\tmake\bvue\btsx\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    only_config = true,
    path = "/Users/denis/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/denis/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-ts-context-commentstring"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/denis/.local/share/nvim/site/pack/packer/opt/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/denis/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/denis/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/denis/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["rust-tools.nvim"] = {
    loaded = true,
    path = "/Users/denis/.local/share/nvim/site/pack/packer/start/rust-tools.nvim",
    url = "https://github.com/simrat39/rust-tools.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nA\0\0\3\0\4\0\0066\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\1K\0\1\0\17:normal! zx\"\17nvim_command\bapi\bvimM\1\1\6\1\5\0\v-\1\0\0009\1\0\1\18\3\1\0009\1\1\0015\4\3\0003\5\2\0=\5\4\4B\1\3\1+\1\2\0002\0\0ÄL\1\2\0\1¿\tpost\1\0\0\0\fenhance\vselect\28\0\1\2\0\1\0\0025\1\0\0L\1\2\0\1\2\0\0\r--hiddenº\n\1\0\16\0@\0Ä\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0025\2\4\0003\3\3\0=\3\5\0026\3\0\0'\5\6\0B\3\2\0029\3\a\0035\5\30\0005\6\b\0005\a\t\0=\a\n\0065\a\v\0=\a\f\0065\a\14\0005\b\r\0=\b\15\a=\a\16\0066\a\0\0'\t\17\0B\a\2\0029\a\18\a9\a\19\a=\a\20\0066\a\0\0'\t\17\0B\a\2\0029\a\21\a9\a\19\a=\a\22\0066\a\0\0'\t\17\0B\a\2\0029\a\23\a9\a\19\a=\a\24\0066\a\0\0'\t\25\0B\a\2\0029\a\26\a=\a\27\0066\a\0\0'\t\25\0B\a\2\0029\a\28\a=\a\29\6=\6\31\0055\6 \0=\2!\0066\a\"\0009\a#\a'\t$\0\18\n\2\0005\v%\0005\f*\0005\r(\0009\14&\0009\15'\0 \14\15\14=\14)\r=\r+\f=\f,\vB\a\4\2=\a-\6=\2.\6=\2/\0066\a\"\0009\a#\a'\t$\0\18\n\2\0005\v1\0003\f0\0=\f2\v5\f4\0005\r3\0009\14&\0009\15'\0 \14\15\14=\14)\r=\r+\f=\f,\vB\a\4\2=\a5\6=\0026\6=\0067\5B\3\2\0016\3\0\0'\0058\0B\3\2\0026\4\"\0009\0049\0049\4:\4'\6+\0'\a;\0009\b-\0034\t\0\0B\4\5\0016\4\"\0009\0049\0049\4:\4'\6+\0'\a<\0009\b5\0034\t\0\0B\4\5\0016\4\"\0009\0049\0049\4:\4'\6+\0'\a=\0009\b!\0034\t\0\0B\4\5\0016\4\"\0009\0049\0049\4:\4'\6+\0'\a>\0009\b?\0034\t\0\0B\4\5\0012\0\0ÄK\0\1\0\14help_tags\15<leader>fh\15<leader>fb\14<leader>s\14<leader>p\bset\vkeymap\22telescope.builtin\fpickers\roldfiles\14live_grep\1\0\0\1\0\0\20additional_args\1\0\0\0\16grep_string\14git_files\15find_files\rmappings\6n\1\0\0\6y\1\0\0\16open_qflist\28send_selected_to_qflist\1\0\1\vhidden\2\nforce\15tbl_extend\bvim\fbuffers\1\0\0\rdefaults\1\0\0\19generic_sorter\29get_generic_fuzzy_sorter\16file_sorter\19get_fuzzy_file\22telescope.sorters\21qflist_previewer\22vim_buffer_qflist\19grep_previewer\23vim_buffer_vimgrep\19file_previewer\bnew\19vim_buffer_cat\25telescope.previewers\18layout_config\15horizontal\1\0\0\1\0\1\18preview_width\4\0ÄÄÄˇ\3\25file_ignore_patterns\1\b\0\0\n.git/\v.cache\f%.class\n%.pdf\n%.mkv\n%.mp4\n%.zip\17path_display\1\2\0\0\rabsolute\1\0\5\17initial_mode\vinsert\20layout_strategy\15horizontal\18results_title\1\20scroll_strategy\nlimit\17entry_prefix\6 \nsetup\14telescope\20attach_mappings\1\0\0\0\26telescope.actions.set\22telescope.actions\frequire\0" },
    loaded = true,
    path = "/Users/denis/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\nø\4\0\0\a\0\21\00086\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0015\0\4\0006\1\5\0009\1\6\0019\1\a\1'\3\b\0'\4\t\0'\5\n\0\18\6\0\0B\1\5\0016\1\5\0009\1\6\0019\1\a\1'\3\b\0'\4\v\0'\5\f\0\18\6\0\0B\1\5\0016\1\5\0009\1\6\0019\1\a\1'\3\b\0'\4\r\0'\5\14\0\18\6\0\0B\1\5\0016\1\5\0009\1\6\0019\1\a\1'\3\b\0'\4\15\0'\5\16\0\18\6\0\0B\1\5\0016\1\5\0009\1\6\0019\1\a\1'\3\b\0'\4\17\0'\5\18\0\18\6\0\0B\1\5\0016\1\5\0009\1\6\0019\1\a\1'\3\b\0'\4\19\0'\5\20\0\18\6\0\0B\1\5\1K\0\1\0*<cmd>TroubleToggle lsp_references<cr>\agR$<cmd>TroubleToggle quickfix<cr>\15<leader>xq#<cmd>TroubleToggle loclist<cr>\15<leader>xl0<cmd>TroubleToggle document_diagnostics<cr>\15<leader>xd1<cmd>TroubleToggle workspace_diagnostics<cr>\15<leader>xw\27<cmd>TroubleToggle<cr>\15<leader>xx\6n\bset\vkeymap\bvim\1\0\2\vsilent\2\fnoremap\2\1\0\1\14auto_fold\2\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/Users/denis/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/Users/denis/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\nø\4\0\0\a\0\21\00086\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0015\0\4\0006\1\5\0009\1\6\0019\1\a\1'\3\b\0'\4\t\0'\5\n\0\18\6\0\0B\1\5\0016\1\5\0009\1\6\0019\1\a\1'\3\b\0'\4\v\0'\5\f\0\18\6\0\0B\1\5\0016\1\5\0009\1\6\0019\1\a\1'\3\b\0'\4\r\0'\5\14\0\18\6\0\0B\1\5\0016\1\5\0009\1\6\0019\1\a\1'\3\b\0'\4\15\0'\5\16\0\18\6\0\0B\1\5\0016\1\5\0009\1\6\0019\1\a\1'\3\b\0'\4\17\0'\5\18\0\18\6\0\0B\1\5\0016\1\5\0009\1\6\0019\1\a\1'\3\b\0'\4\19\0'\5\20\0\18\6\0\0B\1\5\1K\0\1\0*<cmd>TroubleToggle lsp_references<cr>\agR$<cmd>TroubleToggle quickfix<cr>\15<leader>xq#<cmd>TroubleToggle loclist<cr>\15<leader>xl0<cmd>TroubleToggle document_diagnostics<cr>\15<leader>xd1<cmd>TroubleToggle workspace_diagnostics<cr>\15<leader>xw\27<cmd>TroubleToggle<cr>\15<leader>xx\6n\bset\vkeymap\bvim\1\0\2\vsilent\2\fnoremap\2\1\0\1\14auto_fold\2\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\nµ\6\0\0\6\0&\0?6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\15\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0004\5\0\0=\5\t\0044\5\0\0=\5\n\4=\4\v\0034\4\0\0=\4\f\0035\4\r\0=\4\14\3=\3\16\0025\3\17\0004\4\0\0=\4\18\0035\4\19\0=\4\20\0035\4\22\0005\5\21\0>\5\1\4=\4\23\0035\4\24\0005\5\25\0>\5\3\4=\4\26\0035\4\27\0=\4\28\0035\4\29\0=\4\30\3=\3\31\0025\3 \0004\4\0\0=\4\18\0034\4\0\0=\4\20\0034\4\0\0=\4\23\0035\4!\0=\4\26\0034\4\0\0=\4\28\0034\4\0\0=\4\30\3=\3\"\0024\3\0\0=\3#\0024\3\0\0=\3\n\0024\3\0\0=\3$\0024\3\0\0=\3%\2B\0\2\1K\0\1\0\15extensions\20inactive_winbar\ftabline\22inactive_sections\1\2\0\0\rlocation\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\2\1\0\rfiletype\14icon_only\2\1\3\0\0\rencoding\15fileformat\14lualine_c\1\3\0\0\0\17lsp_progress\1\2\1\0\rfilename\tpath\3\1\14lualine_b\1\4\0\0\vbranch\tdiff\16diagnostics\14lualine_a\1\0\0\foptions\1\0\0\frefresh\1\0\3\ftabline\3Ë\a\vwinbar\3Ë\a\15statusline\3Ë\a\17ignore_focus\23disabled_filetypes\vwinbar\15statusline\1\0\0\23section_separators\1\0\2\nright\bÓÇ≤\tleft\bÓÇ∞\25component_separators\1\0\2\nright\bÓÇ≥\tleft\bÓÇ±\1\0\4\ntheme\tauto\18icons_enabled\2\17globalstatus\1\25always_divide_middle\2\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\n[\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\25show_current_context\2\nsetup\21indent_blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: mason-lspconfig.nvim
time([[Config for mason-lspconfig.nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20mason-lspconfig\frequire\0", "config", "mason-lspconfig.nvim")
time([[Config for mason-lspconfig.nvim]], false)
-- Config for: catppuccin
time([[Config for catppuccin]], true)
try_loadstring("\27LJ\2\n¨\16\0\1\4\0Ö\1\0Í\0015\1\3\0005\2\1\0009\3\0\0=\3\2\2=\2\4\0015\2\6\0009\3\5\0=\3\a\0029\3\b\0=\3\2\0025\3\t\0=\3\n\2=\2\v\0015\2\f\0009\3\b\0=\3\a\0029\3\5\0=\3\2\2=\2\r\0015\2\14\0009\3\b\0=\3\2\2=\2\15\0015\2\17\0009\3\16\0=\3\2\2=\2\18\0015\2\20\0009\3\19\0=\3\2\2=\2\21\0015\2\23\0009\3\22\0=\3\a\2=\2\24\0015\2\25\0009\3\22\0=\3\a\2=\2\26\0015\2\27\0009\3\22\0=\3\a\2=\2\28\0015\2\30\0009\3\29\0=\3\2\0029\3\22\0=\3\a\2=\2\31\0015\2 \0009\3\29\0=\3\2\2=\2!\0015\2\"\0009\3\29\0=\3\2\2=\2#\0015\2$\0009\3\29\0=\3\2\2=\2%\0015\2&\0009\3\29\0=\3\2\2=\2'\0015\2(\0009\3\29\0=\3)\2=\2*\0015\2+\0009\3\22\0=\3\a\0029\3,\0=\3\2\2=\2-\0015\2.\0009\3\16\0=\3\2\0025\3/\0=\3\n\2=\0020\0015\0021\0009\3\29\0=\3\2\2=\0022\0015\0023\0009\3\19\0=\3\2\2=\0024\0015\0026\0009\0035\0=\3\2\2=\0027\0015\0029\0009\0038\0=\3\2\2=\2:\0015\2<\0009\3;\0=\3\2\2=\2=\0015\2?\0009\3>\0=\3\2\2=\2@\0015\2B\0009\3A\0=\3\2\2=\2C\0015\2D\0009\3>\0=\3\2\2=\2E\0015\2G\0009\3F\0=\3\2\0025\3H\0=\3\n\2=\2I\0015\2J\0009\3F\0=\3\2\0024\3\0\0=\3\n\2=\2K\0015\2L\0009\3\29\0=\3\2\2=\2M\0015\2N\0009\3F\0=\3\2\0025\3O\0=\3\n\2=\2P\0015\2Q\0009\3;\0=\3\2\2=\2R\0015\2S\0009\3\b\0=\3\2\0024\3\0\0=\3\n\2=\2T\0015\2V\0005\3U\0=\3\n\2=\2W\0015\2X\0009\3\29\0=\3\2\0024\3\0\0=\3\n\2=\2Y\0015\2Z\0009\0035\0=\3\2\2=\2[\0015\2]\0009\3\\\0=\3\2\2=\2^\0015\2_\0009\3\19\0=\3\2\2=\2`\0015\2b\0009\3a\0=\3\2\2=\2c\0015\2e\0009\3d\0=\3\2\0025\3f\0=\3\n\2=\2g\0015\2h\0009\3A\0=\3\2\2=\2i\0015\2j\0009\3;\0=\3\2\2=\2k\0015\2l\0009\3a\0=\3\2\2=\2m\0015\2n\0009\3F\0=\3\2\0025\3o\0=\3\n\2=\2p\0015\2q\0009\3\19\0=\3\2\0025\3r\0=\3\n\2=\2s\0015\2t\0009\3>\0=\3\2\2=\2u\0015\2w\0009\3v\0=\3\2\2=\2x\0015\2y\0009\0035\0=\3\2\2=\2z\0015\2{\0009\3>\0=\3\2\0025\3|\0=\3\n\2=\2}\0015\2~\0009\3>\0=\3\2\2=\2\127\0015\2Ä\0009\3\19\0=\3\2\0025\3Å\0=\3\n\2=\2Ç\0015\2É\0009\3a\0=\3\2\2=\2Ñ\1L\1\2\0\18@property.cpp\1\0\0\18@property.css\1\2\0\0\vitalic\1\0\0\14@type.css\1\0\0\25@property.typescript\1\2\0\0\vitalic\1\0\0\19@constant.java\1\0\0\21@constructor.lua\1\0\0\rflamingo\15@field.lua\1\0\0\20@parameter.bash\1\2\0\0\vitalic\1\0\0\27@function.builtin.bash\1\2\0\0\vitalic\1\0\0\n@text\1\0\0\19@tag.delimiter\1\0\0\t@tag\1\0\0\19@tag.attribute\1\2\0\0\vitalic\1\0\0\nmauve\14@variable\1\0\0\ttext\n@type\1\0\0\25@punctuation.bracket\1\0\0\roverlay2\27@punctuation.delimiter\1\0\0\15@namespace\1\0\0\f@method\1\0\0\1\2\0\0\vitalic\20@keyword.return\1\0\0\22@keyword.function\1\0\0\r@keyword\1\2\0\0\vitalic\1\0\0\15@parameter\1\0\0\20@function.macro\1\0\0\22@variable.builtin\1\2\0\0\vitalic\1\0\0\bred\22@constant.builtin\1\0\0\15@exception\1\0\0\npeach\17@constructor\1\0\0\rlavender\25@punctuation.special\1\0\0\vmaroon\22@keyword.operator\1\0\0\bsky\r@include\1\0\0\tteal\14@property\1\0\0\v@field\1\0\0\16FidgetTitle\1\2\0\0\tbold\1\0\0\15FidgetTask\rsurface2\1\0\0 LspDiagnosticsUnderlineHint\asp\1\0\0\"LspDiagnosticsVirtualTextHint\1\0\0\23LspDiagnosticsHint\1\0\0\30LspDiagnosticsDefaultHint\1\0\0\19DiagnosticHint\1\0\0\30DiagnosticVirtualTextHint\1\0\0\14rosewater\30DiagnosticVirtualTextInfo\1\0\0\30DiagnosticVirtualTextWarn\1\0\0\31DiagnosticVirtualTextError\1\0\0\tnone\fTypedef\1\0\0\vyellow\tType\1\0\0\tblue\fKeyword\1\0\0\14IncSearch\1\0\0\vSearch\nstyle\1\2\0\0\tbold\tpink\abg\1\0\0\rsurface1\17CursorLineNr\1\0\0\afg\1\0\0\ngreenÛ\14\1\0\a\0I\0Z6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0026\3\b\0009\3\t\0039\3\n\3'\5\v\0B\3\2\2'\4\f\0&\3\4\3=\3\r\0025\3\15\0005\4\14\0=\4\16\0035\4\17\0=\4\18\0035\4\19\0=\4\20\0035\4\21\0=\4\22\0035\4\23\0=\4\24\0035\4\25\0=\4\26\0035\4\27\0=\4\28\0035\4\29\0=\4\30\0034\4\0\0=\4\31\0034\4\0\0=\4 \0034\4\0\0=\4!\0034\4\0\0=\4\"\3=\3#\0025\3$\0005\4%\0005\5'\0005\6&\0=\6(\0055\6)\0=\6*\0055\6+\0=\6,\0055\6-\0=\6.\5=\5/\0045\0051\0005\0060\0=\6(\0055\0062\0=\6*\0055\0063\0=\6,\0055\0064\0=\6.\5=\0055\4=\0046\0035\0047\0=\0048\0035\0049\0=\4:\0035\4;\0=\4<\0035\4=\0=\4>\3=\3?\0025\3A\0005\4@\0=\4B\3=\3C\0025\3E\0003\4D\0=\4B\3=\3F\2B\0\2\0016\0\b\0009\0G\0009\0H\0'\2\1\0B\0\2\1K\0\1\0\16colorscheme\bcmd\24highlight_overrides\1\0\0\0\20color_overrides\nmocha\1\0\0\1\0\25\tteal\f#B5E8E0\roverlay2\f#C3BAC6\bsky\f#89DCEB\roverlay1\f#988BA2\tblue\f#96CDFB\roverlay0\f#6E6C7E\ngreen\f#ABE9B3\ncrust\f#161320\vyellow\f#FAE3B0\vmantle\f#1A1826\npeach\f#F8BD96\tbase\f#1E1E2E\vmaroon\f#E8A2AF\rsurface0\f#302D41\bred\f#F28FAD\rsurface1\f#575268\tpink\f#F5C2E7\rsurface2\f#6E6C7E\nmauve\f#DDB6F2\rflamingo\f#F2CDCD\14rosewater\f#F5E0DC\rsubtext0\f#A6ADC8\rsubtext1\f#BAC2DE\ttext\f#D9E0EE\rlavender\f#C9CBFF\17integrations\nnavic\1\0\1\fenabled\1\fneotree\1\0\3\22transparent_panel\1\14show_root\2\fenabled\1\bdap\1\0\2\14enable_ui\2\fenabled\2\21indent_blankline\1\0\2\26colored_indent_levels\1\fenabled\2\15native_lsp\15underlines\1\2\0\0\14underline\1\2\0\0\14underline\1\2\0\0\14underline\1\0\0\1\2\0\0\14underline\17virtual_text\16information\1\2\0\0\vitalic\rwarnings\1\2\0\0\vitalic\nhints\1\2\0\0\vitalic\verrors\1\0\0\1\2\0\0\vitalic\1\0\1\fenabled\2\1\0!\tmini\1\nmason\2\15treesitter\2\vfidget\2\roverseer\1\vbeacon\1\fvimwiki\2\vaerial\1\vnotify\2\15telekasten\1\tleap\1\rcoc_nvim\1\20symbols_outline\1\bcmp\2\15illuminate\2\bhop\2\nnoice\1\fneotest\1\15ts_rainbow\2\15lightspeed\1\rmarkdown\2\vbarbar\1\tfern\1\14vim_sneak\1\vneogit\1\14dashboard\2\14telescope\2\14which_key\2\rnvimtree\2\rgitsigns\2\14gitgutter\1\rlsp_saga\2\16lsp_trouble\2\vstyles\14variables\fstrings\ntypes\fnumbers\rbooleans\1\3\0\0\tbold\vitalic\nloops\1\2\0\0\tbold\17conditionals\1\2\0\0\tbold\14operators\1\2\0\0\tbold\rkeywords\1\2\0\0\vitalic\14functions\1\3\0\0\vitalic\tbold\15properties\1\2\0\0\vitalic\rcomments\1\0\0\1\2\0\0\vitalic\17compile_path\16/catppuccin\ncache\fstdpath\afn\bvim\17dim_inactive\1\0\3\15percentage\4≥ÊÃô\3≥Êå˛\3\nshade\tdark\fenabled\1\15background\1\0\2\tdark\nmocha\nlight\nlatte\1\0\3\fflavour\nmocha\16term_colors\2\27transparent_background\1\nsetup\15catppuccin\frequire\0", "config", "catppuccin")
time([[Config for catppuccin]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
try_loadstring("\27LJ\2\ne\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\1\22show_buffer_icons\1\nsetup\15bufferline\frequire\0", "config", "bufferline.nvim")
time([[Config for bufferline.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nA\0\0\3\0\4\0\0066\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\1K\0\1\0\17:normal! zx\"\17nvim_command\bapi\bvimM\1\1\6\1\5\0\v-\1\0\0009\1\0\1\18\3\1\0009\1\1\0015\4\3\0003\5\2\0=\5\4\4B\1\3\1+\1\2\0002\0\0ÄL\1\2\0\1¿\tpost\1\0\0\0\fenhance\vselect\28\0\1\2\0\1\0\0025\1\0\0L\1\2\0\1\2\0\0\r--hiddenº\n\1\0\16\0@\0Ä\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0025\2\4\0003\3\3\0=\3\5\0026\3\0\0'\5\6\0B\3\2\0029\3\a\0035\5\30\0005\6\b\0005\a\t\0=\a\n\0065\a\v\0=\a\f\0065\a\14\0005\b\r\0=\b\15\a=\a\16\0066\a\0\0'\t\17\0B\a\2\0029\a\18\a9\a\19\a=\a\20\0066\a\0\0'\t\17\0B\a\2\0029\a\21\a9\a\19\a=\a\22\0066\a\0\0'\t\17\0B\a\2\0029\a\23\a9\a\19\a=\a\24\0066\a\0\0'\t\25\0B\a\2\0029\a\26\a=\a\27\0066\a\0\0'\t\25\0B\a\2\0029\a\28\a=\a\29\6=\6\31\0055\6 \0=\2!\0066\a\"\0009\a#\a'\t$\0\18\n\2\0005\v%\0005\f*\0005\r(\0009\14&\0009\15'\0 \14\15\14=\14)\r=\r+\f=\f,\vB\a\4\2=\a-\6=\2.\6=\2/\0066\a\"\0009\a#\a'\t$\0\18\n\2\0005\v1\0003\f0\0=\f2\v5\f4\0005\r3\0009\14&\0009\15'\0 \14\15\14=\14)\r=\r+\f=\f,\vB\a\4\2=\a5\6=\0026\6=\0067\5B\3\2\0016\3\0\0'\0058\0B\3\2\0026\4\"\0009\0049\0049\4:\4'\6+\0'\a;\0009\b-\0034\t\0\0B\4\5\0016\4\"\0009\0049\0049\4:\4'\6+\0'\a<\0009\b5\0034\t\0\0B\4\5\0016\4\"\0009\0049\0049\4:\4'\6+\0'\a=\0009\b!\0034\t\0\0B\4\5\0016\4\"\0009\0049\0049\4:\4'\6+\0'\a>\0009\b?\0034\t\0\0B\4\5\0012\0\0ÄK\0\1\0\14help_tags\15<leader>fh\15<leader>fb\14<leader>s\14<leader>p\bset\vkeymap\22telescope.builtin\fpickers\roldfiles\14live_grep\1\0\0\1\0\0\20additional_args\1\0\0\0\16grep_string\14git_files\15find_files\rmappings\6n\1\0\0\6y\1\0\0\16open_qflist\28send_selected_to_qflist\1\0\1\vhidden\2\nforce\15tbl_extend\bvim\fbuffers\1\0\0\rdefaults\1\0\0\19generic_sorter\29get_generic_fuzzy_sorter\16file_sorter\19get_fuzzy_file\22telescope.sorters\21qflist_previewer\22vim_buffer_qflist\19grep_previewer\23vim_buffer_vimgrep\19file_previewer\bnew\19vim_buffer_cat\25telescope.previewers\18layout_config\15horizontal\1\0\0\1\0\1\18preview_width\4\0ÄÄÄˇ\3\25file_ignore_patterns\1\b\0\0\n.git/\v.cache\f%.class\n%.pdf\n%.mkv\n%.mp4\n%.zip\17path_display\1\2\0\0\rabsolute\1\0\5\17initial_mode\vinsert\20layout_strategy\15horizontal\18results_title\1\20scroll_strategy\nlimit\17entry_prefix\6 \nsetup\14telescope\20attach_mappings\1\0\0\0\26telescope.actions.set\22telescope.actions\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nmason\frequire\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n√\a\0\0\6\0$\0*6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0005\4\a\0=\4\b\3=\3\t\0025\3\r\0005\4\n\0005\5\v\0=\5\f\4=\4\14\0035\4\15\0005\5\16\0=\5\17\0045\5\18\0=\5\19\0045\5\20\0=\5\21\0045\5\22\0=\5\23\4=\4\24\0035\4\25\0005\5\26\0=\5\27\0045\5\28\0=\5\29\4=\4\30\3=\3\31\0025\3 \0=\3!\2B\0\2\0016\0\0\0'\2\"\0B\0\2\2+\1\2\0=\1#\0K\0\1\0\15prefer_git\28nvim-treesitter.install\frainbow\1\0\3\venable\2\19max_file_lines\3–\15\18extended_mode\2\16textobjects\tswap\18swap_previous\1\0\1\15<leader>xP\21@parameter.inner\14swap_next\1\0\1\15<leader>xp\21@parameter.inner\1\0\1\venable\2\tmove\22goto_previous_end\1\0\2\a[]\20@function.outer\a[M\17@class.outer\24goto_previous_start\1\0\2\a[m\17@class.outer\a[[\20@function.outer\18goto_next_end\1\0\2\a]]\20@function.outer\a]M\17@class.outer\20goto_next_start\1\0\2\a]m\17@class.outer\a][\20@function.outer\1\0\2\venable\2\14set_jumps\2\vselect\1\0\0\fkeymaps\1\0\4\aif\20@function.inner\aic\17@class.inner\aaf\20@function.outer\aac\17@class.outer\1\0\1\venable\2\14highlight\fdisable\1\2\0\0\bvim\1\0\2\venable\2&additional_vim_regex_highlighting\1\21ensure_installed\1\0\0\1\21\0\0\tbash\trust\ago\6c\bcpp\blua\vpython\15javascript\15typescript\thtml\bcss\bvim\thelp\ngomod\tjson\tyaml\ttoml\tmake\bvue\btsx\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd Comment.nvim ]]

-- Config for: Comment.nvim
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")

vim.cmd [[ packadd nvim-ts-context-commentstring ]]
vim.cmd [[ packadd nvim-treesitter-textobjects ]]
time([[Sequenced loading]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end

-- leader
vim.g.mapleader = " "

-- default indentation settings
vim.o.softtabstop = -1 -- when -1 it will match shiftwidth
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- line numbers
vim.o.number = true
vim.o.relativenumber = true

-- prevents jittery on/off of signcolumn
vim.o.signcolumn = "yes"

-- default splits
vim.o.splitright = true
vim.o.splitbelow = true

-- other
vim.o.mouse = "a"
vim.o.showmode = false
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.inccommand = "split"
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.confirm = true

vim.diagnostic.config({
  virtual_text = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚 ",
      [vim.diagnostic.severity.WARN] = "󰀪 ",
      [vim.diagnostic.severity.INFO] = "󰋽 ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
    },
  },
})

local telescope_hook = function(ev)
  local name, kind = ev.data.spec.name, ev.data.kind
  if name == "telescope-fzf-native.nvim" and (kind == "install" or kind == "update") then
    vim.system({ "make" }, { cwd = ev.data.path }):wait()
  end
end
vim.api.nvim_create_autocmd("PackChanged", { callback = telescope_hook })

local luasnip_hook = function(ev)
  local name, kind = ev.data.spec.name, ev.data.kind
  if name == "luasnip" and (kind == "install" or kind == "update") then
    vim.system({ "make", "install_jsregexp" }, { cwd = ev.data.path }):wait()
  end
end
vim.api.nvim_create_autocmd("PackChanged", { callback = luasnip_hook })

vim.pack.add({
  "https://github.com/lewis6991/gitsigns.nvim",
  "https://github.com/wakatime/vim-wakatime",
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/j-hui/fidget.nvim",
  "https://github.com/folke/tokyonight.nvim",
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
  "https://github.com/nvim-telescope/telescope-ui-select.nvim",
  "https://github.com/nvim-telescope/telescope.nvim",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/mason-org/mason-lspconfig.nvim",
  "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
  "https://github.com/stevearc/conform.nvim",
  "https://github.com/folke/lazydev.nvim",
  {
    src = "https://github.com/saghen/blink.cmp",
    version = vim.version.range("1.*"),
  },
  "https://github.com/L3MON4D3/LuaSnip",
  "https://github.com/folke/which-key.nvim",
  "https://github.com/folke/todo-comments.nvim",
  "https://github.com/lukas-reineke/indent-blankline.nvim",
  "https://github.com/echasnovski/mini.nvim",
  "https://github.com/windwp/nvim-autopairs",
  "https://github.com/nvim-neo-tree/neo-tree.nvim",
  "https://github.com/MunifTanjim/nui.nvim",
  "https://github.com/rafamadriz/friendly-snippets",
  -- TODO: setup treesitter using one of the following:
  -- "https://github.com/romus204/tree-sitter-manager.nvim",
  -- "https://github.com/arborist-ts/arborist.nvim",
  -- "https://github.com/reybits/ts-forge.nvim"
  -- TODO: setup markdown editing using one of the following:
  -- "http://github.com/MeanderingProgrammer/render-markdown.nvim",
  -- "https://github.com/OXY2DEV/markview.nvim/tree/main#-installation",
  -- "https://github.com/iamcco/markdown-preview.nvim",
  -- "https://github.com/toppair/peek.nvim",
})

require("fidget").setup()

require("nvim-web-devicons").setup()

require("tokyonight").setup({
  transparent = true,
})

vim.cmd.colorscheme("tokyonight")

require("todo-comments").setup()

require("which-key").setup(
  --- @module "which-key"
  --- @type wk.Opts
  {
    icons = { mappings = true },
    spec = {
      { "<leader>f", group = "[F]ind" },
      { "<leader>c", group = "[C]onform (Format)" },
    },
  }
)

require("ibl").setup()

require("mini.ai").setup({ n_lines = 500 })
require("mini.surround").setup()
require("mini.statusline").setup({ use_icons = true })
local hp = require("mini.hipatterns")
hp.setup({ highlighters = { hex_color = hp.gen_highlighter.hex_color() } })
require("mini.tabline").setup()

require("nvim-autopairs").setup()

require("neo-tree").setup({
  filesystem = {
    window = {
      mappings = {
        ["\\"] = "close_window",
      },
    },
    filtered_items = {
      visible = true,
    },
  },
})

vim.keymap.set("n", "\\", ":Neotree reveal<CR>")

vim.keymap.set("n", "<esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "[Q]uickfix" })

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "[Y]ank to clipboard" })

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

local lastplace = vim.api.nvim_create_augroup("LastPlace", {})
vim.api.nvim_clear_autocmds({ group = lastplace })
vim.api.nvim_create_autocmd("BufReadPost", {
  group = lastplace,
  pattern = { "*" },
  desc = "remember last cursor place",
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

require("telescope").setup({
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown(),
    },
  },
})

require("telescope").load_extension("fzf")
require("telescope").load_extension("ui-select")

local tsb = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", tsb.find_files, { desc = "[F]iles" })
vim.keymap.set("n", "<leader>fg", tsb.live_grep, { desc = "[G]rep" })
vim.keymap.set("n", "<leader>fb", tsb.buffers, { desc = "[B]uffers" })
vim.keymap.set("n", "<leader>fh", tsb.help_tags, { desc = "[H]elp" })

require("mason").setup()
require("mason-lspconfig").setup({ ensure_installed = {} })
require("mason-tool-installer").setup({
  ensure_installed = {
    "lua_ls",
    "stylua",
    "pyright",
    "ruff",
    "rust_analyzer",
    "bashls",
    "beautysh",
    "clangd",
  },
})

vim.lsp.config("bashls", { filetypes = { "sh", "bash", "zsh" } })

-- Attempts to format only changed lines, but falls back to formatting the entire file.
-- https://github.com/stevearc/conform.nvim/issues/92
local function conform_format_on_save_callback()
  local filetypes_to_format_entire_file = { "lua", "rust" }
  if vim.tbl_contains(filetypes_to_format_entire_file, vim.bo.filetype) then
    require("conform").format()
    return
  end

  local hunks = require("gitsigns").get_hunks()

  -- format untracked files
  if hunks == nil then
    require("conform").format()
    return
  end

  -- format each hunk, starting from bottom of file
  for i = #hunks, 1, -1 do
    local hunk = hunks[i]
    if hunk ~= nil and hunk.type ~= "delete" then
      local first_row = hunk.added.start
      local last_row = first_row + hunk.added.count
      local last_col = vim.api.nvim_buf_get_lines(0, last_row - 2, last_row - 1, true)[1]:len()
      local range = { start = { first_row, 0 }, ["end"] = { last_row - 1, last_col } }
      local opts = vim.tbl_deep_extend("keep", { range = range }, require("conform").default_format_opts)
      require("conform").format(opts)
    end
  end
end

require("conform").setup({
  default_format_opts = {
    lsp_format = "fallback",
  },
  formatters_by_ft = {
    lua = { "stylua" },
    bash = { "beautysh" },
    sh = { "beautysh" },
    zsh = { "beautysh" },
    python = { "ruff" },
  },
  format_on_save = conform_format_on_save_callback,
})

vim.keymap.set("n", "<leader>cf", require("conform").format, { desc = "Format [F]ile" })
vim.keymap.set("n", "<leader>cm", conform_format_on_save_callback, { desc = "Format [M]odifications" })

require("lazydev").setup({
  library = {
    -- Load luvit types when the `vim.uv` word is found
    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
  },
})

require("luasnip.loaders.from_vscode").lazy_load()

require("blink.cmp").setup(
  --- @module 'blink.cmp'
  --- @type blink.cmp.Config
  {
    keymap = { preset = "default" },
    appearance = { nerd_font_variant = "normal" },
    completion = {
      documentation = { auto_show = false, auto_show_delay_ms = 500 },
    },
    sources = {
      default = { "lsp", "path", "snippets", "lazydev" },
      providers = {
        lazydev = {
          module = "lazydev.integrations.blink",
          score_offset = 100,
        },
      },
    },
    snippets = { preset = "luasnip" },
    fuzzy = { implementation = "prefer_rust_with_warning" },
    signature = { enabled = true },
  }
)

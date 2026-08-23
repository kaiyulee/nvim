return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    explorer = {
      enabled = true,
      replace_netrw = true,
    },
    indent = { enabled = true },
    input = { enabled = true },
    dashboard = {
      enabled = true,
      preset = {
        header = [[
  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
        ]],
      },
      sections = {
        { section = "header" },
        { section = "keys", gap = 1, padding = 1 },
        {
          pane = 2,
          icon = " ",
          title = "Recent Files",
          section = "recent_files",
          limit = 5,
          padding = 1,
        },
        {
          pane = 2,
          icon = " ",
          title = "Git Branches",
          section = "terminal",
          enabled = function() return vim.fn.isdirectory(".git") == 1 end,
          cmd = "git --no-pager branch --sort=-committerdate | head -10",
          height = 5,
          padding = 1,
          ttl = 120,
        },
        { section = "startup" },
      },
    },
    lazygit = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    dim = {
      enabled = true,
      animate = {
        enabled = true,
        easing = "outQuad",
        duration = {
          step = 20,
          total = 300,
        },
      },
      scope = {
        min_size = 5,
        max_size = 20,
        siblings = true,
      },
    },
    quickfile = { enabled = true },
    statuscolumn = { enabled = true },
    terminal = { enabled = true },
    words = {
      enabled = true,
      debounce = 200,
      notify_jump = false,
      notify_end = true,
      foldopen = true,
      jumplist = true,
      modes = { "n", "i", "c" },
    },
    win = { enabled = true },
  },
  keys = {
    { "<leader>ee", function() Snacks.explorer() end, desc = "Toggle file explorer" },
    { "<leader>ef", function() Snacks.explorer.reveal() end, desc = "Explorer current file" },
    { "<leader>lg", function() Snacks.lazygit() end, desc = "LazyGit" },
    { "<leader>sm", function() Snacks.win.toggle() end, desc = "Toggle window maximize" },
    { "<C-\\>",      function() Snacks.terminal() end, desc = "Toggle terminal" },
    { "<leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
    { "<leader>S",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
    { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
    { "<leader>gb", function() Snacks.git.blame_line() end, desc = "Git Blame Line" },
    { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse" },
    { "<leader>gg", function() Snacks.lazygit() end, desc = "LazyGit (cwd)" },
    { "]]",         function() Snacks.words.jump(vim.v.count1) end, desc = "Next LSP reference" },
    { "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev LSP reference" },
  },
}

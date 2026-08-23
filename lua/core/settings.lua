local opt = vim.opt
local g = vim.g

g.mapleader = " "

opt.laststatus = 3 -- global statusline
opt.showmode = false

opt.clipboard = "unnamedplus"
opt.cursorline = true

-- Indenting
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

opt.fillchars = {
    eob = " "
}
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"


opt.relativenumber = true
opt.number = true
opt.numberwidth = 2
opt.ruler = false

-- disable nvim intro
opt.shortmess:append "sI"

-- Auto dark/light mode on macOS via FocusGained + timer fallback
if vim.fn.has("macunix") == 1 then
  local function set_bg()
    local mode = vim.fn.system({ "defaults", "read", "-g", "AppleInterfaceStyle" }):gsub("%s+", "")
    vim.o.background = mode == "Dark" and "dark" or "light"
  end
  vim.api.nvim_create_autocmd("FocusGained", { callback = set_bg })
  set_bg() -- set on startup
end

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true


opt.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"

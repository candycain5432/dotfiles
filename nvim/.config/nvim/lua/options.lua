-- Editor options
-- Location: ~/.config/nvim/lua/options.lua

require "nvchad.options"

local o = vim.o

o.relativenumber = true  -- line numbers count outward from the cursor, like the screenshot
o.cursorlineopt  = "both" -- highlight the current line and its number
o.scrolloff      = 8     -- keep 8 lines visible above/below the cursor
o.wrap           = false -- don't wrap long lines

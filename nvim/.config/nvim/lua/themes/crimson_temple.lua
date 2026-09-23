-- NvChad base46 theme: Crimson Temple
-- Location: ~/.config/nvim/lua/themes/crimson_temple.lua
-- base_30 colors the UI (statusline, tabs, menus); base_16 colors the code.

local M = {}

M.base_30 = {
  white         = "#d8d4ce", -- main text
  darker_black  = "#0d0d0e", -- file tree background
  black         = "#131314", -- editor background
  black2        = "#1a1b1d",
  one_bg        = "#1d2224", -- surface
  one_bg2       = "#262c2e",
  one_bg3       = "#2c3335", -- overlay
  grey          = "#3a4244",
  grey_fg       = "#4a5255",
  grey_fg2      = "#5a6265",
  light_grey    = "#8a8681", -- muted text
  red           = "#e9445e", -- the sun
  baby_pink     = "#f06a80",
  pink          = "#c45c7c",
  line          = "#2c3335", -- split lines
  green         = "#9aab8f", -- sage
  vibrant_green = "#b3c2a8",
  nord_blue     = "#9cb0c1",
  blue          = "#7f95a8", -- slate from the mist
  seablue       = "#8fb0ad",
  yellow        = "#d6a36a", -- ochre
  sun           = "#e4bd8c",
  purple        = "#d77f9a",
  dark_purple   = "#b11d43",
  teal          = "#8fb0ad",
  orange        = "#e08a6a",
  cyan          = "#aac7c4",
  statusline_bg = "#161718",
  lightbg       = "#2c3335",
  pmenu_bg      = "#e9445e", -- selected item in completion menus
  folder_bg     = "#8a8681",
}

M.base_16 = {
  base00 = "#131314", -- background
  base01 = "#1d2224",
  base02 = "#2c3335", -- selection
  base03 = "#4a5255",
  base04 = "#8a8681",
  base05 = "#d8d4ce", -- default text
  base06 = "#e6e2dc",
  base07 = "#f0ece6",
  base08 = "#c9c4bd", -- variables (kept calm so red stays special)
  base09 = "#c45c7c", -- numbers, constants (rose)
  base0A = "#7f95a8", -- classes, types (slate)
  base0B = "#d6a36a", -- strings (ochre)
  base0C = "#8fb0ad", -- escapes, regex (teal)
  base0D = "#9aab8f", -- functions (sage)
  base0E = "#e9445e", -- keywords (crimson)
  base0F = "#b11d43", -- misc / deprecated
}

-- Extra touches on top of the generated highlights
M.polish_hl = {
  defaults = {
    Comment      = { fg = "#8a8681", italic = true },
    CursorLineNr = { fg = "#e9445e", bold = true },  -- current line number in crimson
  },
  treesitter = {
    ["@comment"] = { fg = "#8a8681", italic = true },
  },
}

M.type = "dark"

M = require("base46").override_theme(M, "crimson_temple")

return M

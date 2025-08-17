-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "onedark",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

-- M.nvdash = { load_on_startup = true }
M.ui = {
  transparency = false,
  
  tabufline = {
    enabled = true,
    lazyload = false,
  },
  
  statusline = {
    enabled = true,
    separator_style = "default",
  },
}

M.term = {
  float = {
    relative = "editor",
    row = 0.05,
    col = 0.07,
    width = 0.85,
    height = 0.8,
    border = "single",
  },
}

return M

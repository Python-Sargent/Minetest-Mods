-- command block
-- by Samuel Sargent

-- This mod supplies a block like the minecraft:command_block
-- that can run several minetest cmd blocks, activate with
-- the run button or use the redstone mod.

local modpath = minetest.get_modpath("chess")

chess = {}

dofile(modpath.."/light.lua")
dofile(modpath.."/dark.lua")
dofile(modpath.."/ai.lua")

-- command block
-- by Samuel Sargent

-- This mod supplies a version of the minecraft electrical_age
-- including wire, rubber, apliances, and electrical logic gates.

local modpath = minetest.get_modpath("eln")

eln = {}

local S
if minetest.global_exists("intllib") then
	if intllib.make_gettext_pair then
		S = intllib.make_gettext_pair()
	else
		S = intllib.Getter()
	end
else
	S = function(s) return s end
end
eln.intllib = S

dofile(modpath.."/nodes.lua")
dofile(modpath.."/items.lua")
dofile(modpath.."/ores.lua")
dofile(modpath.."/nodes_macerator.lua")

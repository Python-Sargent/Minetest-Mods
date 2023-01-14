-- Andvacing Technology mod for Minetest version 0.4.17 or above.
-- Creator: Samuel Sargent. licensed under TODO GPL 2+ TODO

local modpath = minetest.get_modpath(minetest.get_current_modname())

advantech = {}
advantech.at1 = {}
advantech.at2 = {}
advantech.at3 = {}
advantech.at4 = {}
advantech.at5 = {}

advantech.crafts = {}
advantech.crafts.milling = {}
advantech.crafts.melting = {}
advantech.crafts.grinding = {}
advantech.register_craft = function(recipe)
	if recipe ~= nil then
		if recipe.type == "milling" then
			print("ACTION: [Advantech] registering craft '" .. tostring(recipe.input) .. "' type milling")
			advantech.crafts.milling[tostring(recipe.input)] = recipe
		elseif recipe.type == "melting" then
			print("ACTION: [Advantech] registering craft '" .. tostring(recipe.input) .. "' type melting")
			advantech.crafts.melting[tostring(recipe.input)] = recipe
		elseif recipe.type == "grinding" then
			print("ACTION: [Advantech] registering craft '" .. tostring(recipe.input) .. "' type grinding")
			advantech.crafts.grinding[tostring(recipe.input)] = recipe
		else
			print("ERROR: [Advantech] failed To register craft")
			print("ERROR: [Advantech] no such craft type as '" .. tostring(recipe.type) .. "'")
			return
		end
	else
		print("ERROR: [Advantech] failed to register craft (no recipe)")
		return
	end
end

function advantech.get_craft_result(input)
	if input ~= nil then
		if input.method == "milling" then
			local craft = advantech.crafts.milling[input.items[input.width]]
			if craft ~= nil then
				return craft, craft.replacements[input.items[input.width]]
			else
				print("ERROR: [Advantech] failed function 'get_craft_result' (no recipe named '" .. tostring(input.items[input.width]) .."')")
			end
		end
		if input.method == "melting" then
			local craft = advantech.crafts.melting[input.items[input.width]]
			if craft ~= nil then
				return craft, craft.replacements[input.items[input.width]]
			else
				print("ERROR: [Advantech] failed function 'get_craft_result' (no recipe named '" .. tostring(input.items[input.width]) .."')")
			end
		end
		if input.method == "grinding" then
			local craft = advantech.crafts.grinding[input.items[input.width]]
			if craft ~= nil then
				return craft, craft.replacements[input.items[input.width]]
			else
				print("ERROR: [Advantech] failed function 'get_craft_result' (no recipe named '" .. tostring(input.items[input.width]) .."')")
			end
		end
	else
		print("ERROR: [Advantech] failed function 'get_craft_result' (no input)")
		return
	end
end

dofile(modpath.."/at1.lua")
dofile(modpath.."/at2.lua")
dofile(modpath.."/at3.lua")
dofile(modpath.."/at4.lua")
dofile(modpath.."/at5.lua")

-- mod-wide items and nodes
 --ores
  --aluminum, bauxite
minetest.register_node("advantech:bauxite", {
	description = "Bauxite",
	tiles = {"default_stone.png^advantech_mineral_bauxite.png"},
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("advantech:aluminum_block", {
	description = "Aluminum Block",
	tiles = {"advantech_aluminum_block.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_metal_defaults(),
})

minetest.register_craftitem("advantech:raw_aluminum", {
	description = "Raw Aluminum",
	inventory_image = "advantech_aluminum_raw.png"
})

minetest.register_craftitem("advantech:aluminum", {
	description = "Aluminum",
	inventory_image = "advantech_aluminum.png"
})
  --zinc, sphalerite

minetest.register_node("advantech:sphalerite", {
	description = "Sphalerite",
	tiles = {"default_stone.png^advantech_mineral_sphalerite.png"},
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("advantech:zinc_block", {
	description = "Zinc Block",
	tiles = {"advantech_zinc_block.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_metal_defaults(),
})

minetest.register_craftitem("advantech:raw_zinc", {
	description = "Raw Zinc",
	inventory_image = "advantech_zinc_raw.png"
})

minetest.register_craftitem("advantech:zinc", {
	description = "Zinc",
	inventory_image = "advantech_zinc.png"
})

-- ore registeration

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "advantech:sphalerite",
	wherein        = "default:stone",
	clust_scarcity = 10 * 10 * 10,
	clust_num_ores = 12,
	clust_size     = 5,
	y_min          = -31000,
	y_max          = -75,
})

minetest.register_ore({
	ore_type       = "sheet",
	ore            = "advantech:bauxite",
	wherein        = "default:stone",
	clust_scarcity = 10 * 10 * 10,
	clust_num_ores = 12,
	clust_size     = 12,
	y_min          = -31000,
	y_max          = -50,
})

-- items



--AGE: AGE_NAME         TIMEFRAME       POWER_TYPE          POWER_SPECIFICS
--Age 1: Stone Age      (past)          coal/water          burning coal, waterwheel
--Age 2: Bronze Age     (past)          steam               simple steam engines
--Age 3: Iron Age       (past)          steam/fuel          advanced steam, early fossil fuel
--Age 4: Gold Age       (present)       nautral/nuclear     nautral (wind, hydro, geothermal (lava)), early nuclear (fusion)
--Age 5: Uranium Age    (future)        nuclear/quantum     advanced nuclear (fission), quantum power


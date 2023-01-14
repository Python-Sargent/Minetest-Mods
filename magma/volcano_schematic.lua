
local M = {name = "magma:magma", prob = 255}
local B = {name = "magma:basalt", prob = 255}
local A = {name = "magma:ash", prob = 200}
local b = {name = "magma:basalt_stone", prob = 255}
local P = {name = "magma:pumice", prob = 255}
local O = {name = "magma:obsidian", prob = 255}
local L = {name = "default:lava_source", prob = 255, force_place=true}
local PV = {name = "magma:pumice_vent", prob = 255, force_place=true}
local BV = {name = "magma:basalt_vent", prob = 255, force_place=true}
local OV = {name = "magma:obsidian_vent", prob = 255, force_place=true}
local D = {name = "default:stone_with_diamond", prob = 180, force_place=true}
local _ = {name = "air", prob = 10}

volcano_schematic = minetest.register_schematic({
	size = {x = 12, y = 8, z = 13},
	data = {
		_, _, B, B, B, B, B, B, B, _, _, _,
		_, _, B, P, B, P, P, P, B, _, _, _,		
		_, _, P, _, P, _, _, _, P, _, _, _,
		_, _, A, _, A, _, _, _, A, _, _, _,
		_, _, _, _, _, _, _, _, _, _, _, _,
		_, _, _, _, _, _, _, _, _, _, _, _,
		_, _, _, _, _, _, _, _, _, _, _, _,
		_, _, _, _, _, _, _, _, _, _, _, _,


		_, B, B, B, B, B, B, B, B, B, B, B,
		_, B, P, B, B, B, P, B, P, B, P, B,
		_, P, _, P, P, P, _, P, _, P, _, P,
		_, A, M, P, P, A, _, A, _, A, M, A,
		_, _, M, A, A, _, _, _, _, _, _, _,
		_, _, _, _, _, _, _, _, _, _, _, _,
		_, _, _, _, _, _, _, _, _, _, _, _,
		_, _, _, _, _, _, _, _, _, _, _, _,


		_, B, B, B, B, B, B, B, B, B, _, _,
		_, B, P, B, B, B, B, B, P, B, _, _,		
		_, P, _, M, B, P, P, P, _, P, _, _,
		_, A, _, _, B, P, A, A, _, A, _, _,
		_, _, M, _, P, A, _, _, M, _, _, _,
		_, _, _, _, A, _, _, _, _, _, _, _,
		_, _, _, _, _, _, _, _, _, _, _, _,
		_, _, _, _, _, _, _, _, _, _, _, _,


		_, B, B, B, B, B, B, B, B, B, _, _,
		_, B, B, B, B, B, B, B, B, B, _, _,
		_, P, P, B, b, B, P, P, P, P, _, _,
		_, A, P, B, b, B, P, P, _, P, _, _,
		_, _, P, _, B, P, A, P, M, A, _, _,
		_, _, A, _, P, A, A, _, _, _, _, _,
		_, _, _, M, P, _, _, _, _, _, _, _,
		_, _, _, _, A, _, _, _, _, _, _, _,


		_, B, B, B, B, B, B, B, B, B, _, _,
		_, B, B, B, B, B, B, B, B, B, _, _,	
		_, P, B, b, b, b, B, P, P, P, _, _,
		_, P, B, b, b, b, B, P, _, P, _, _,
		_, A, P, B, B, B, P, _, _, A, _, _,
		_, _, P, _, B, P, P, M, M, _, _, _,
		_, _, A, _, _, P, A, _, _, _, _, _,
		_, _, _, M, M, A, _, _, _, _, _, _,


		_, B, B, B, B, B, B, B, B, B, B, _,
		_, B, B, B, B, B, B, B, B, B, B, _,
		_, P, B, b, b, O, b, b, B, P, P, _,
		_, P, B, b, b, O, b, b, B, P, A, _,
		_, A, P, B, B, O, B, B, _, P, _, _,
		_, _, A, P, B, O, B, _, _, A, _, _,
		_, _, _, A, P, L, P, _, M, _, _, _,
		_, _, _, _, M, L, M, M, _, _, _, _,


		B, B, B, B, B, B, B, B, B, B, B, B,
		B, B, B, B, B, O, B, B, B, B, B, B,
		P, B, b, b, O, D, O, b, b, B, P, P,
		P, B, b, b, O, _, O, b, b, B, P, A,
		A, P, B, B, O, _, O, B, B, P, A, _,
		_, A, P, _, O, _, O, _, P, A, _, _,
		_, _, A, _, L, L, L, _, P, _, _, _,
		_, _, _, M, L, L, L, M, A, _, _, _,


		_, B, B, B, B, B, B, B, B, B, B, _,
		_, B, B, B, B, B, B, B, B, B, B, _,
		_, P, B, b, b, O, b, b, B, P, P, _,
		_, P, B, b, b, O, b, b, B, P, A, _,
		_, A, P, B, B, O, B, B, _, P, _, _,
		_, _, A, P, B, O, B, _, _, A, _, _,
		_, _, _, A, P, L, P, _, M, _, _, _,
		_, _, _, _, M, L, M, M, _, _, _, _,


		_, B, B, B, B, B, B, B, B, B, _, _,
		_, B, B, B, B, B, B, B, B, B, _, _,	
		_, P, B, b, b, b, B, P, P, P, _, _,
		_, P, B, b, b, b, B, P, _, P, _, _,
		_, A, P, B, B, B, P, _, _, A, _, _,
		_, _, P, _, B, P, P, M, M, _, _, _,
		_, _, A, _, _, P, A, _, _, _, _, _,
		_, _, _, M, M, A, _, _, _, _, _, _,


		_, B, B, B, B, B, B, B, B, B, _, _,
		_, B, B, B, B, B, B, B, B, B, _, _,
		_, P, P, B, b, B, P, P, P, P, _, _,
		_, A, P, B, b, B, P, P, _, P, _, _,
		_, _, P, _, B, P, A, P, M, A, _, _,
		_, _, A, _, P, A, A, _, _, _, _, _,
		_, _, _, M, P, _, _, _, _, _, _, _,
		_, _, _, _, A, _, _, _, _, _, _, _,


		_, B, B, B, B, B, B, B, B, B, _, _,
		_, B, P, B, B, B, B, B, P, B, _, _,		
		_, P, _, M, B, P, P, P, _, P, _, _,
		_, A, _, _, B, P, A, A, _, A, _, _,
		_, _, M, _, P, A, _, _, M, _, _, _,
		_, _, _, _, A, _, _, _, _, _, _, _,
		_, _, _, _, _, _, _, _, _, _, _, _,
		_, _, _, _, _, _, _, _, _, _, _, _,


		_, B, B, B, B, B, B, B, B, B, B, B,
		_, B, P, B, B, B, P, B, P, B, P, B,
		_, P, _, P, P, P, _, P, _, P, _, P,
		_, A, M, P, P, A, _, A, _, A, M, A,
		_, _, M, A, A, _, _, _, _, _, _, _,
		_, _, _, _, _, _, _, _, _, _, _, _,
		_, _, _, _, _, _, _, _, _, _, _, _,
		_, _, _, _, _, _, _, _, _, _, _, _,


		_, _, B, B, B, B, B, B, B, _, _, _,
		_, _, B, P, B, P, P, P, B, _, _, _,		
		_, _, P, _, P, _, _, _, P, _, _, _,
		_, _, A, _, A, _, _, _, A, _, _, _,
		_, _, _, _, _, _, _, _, _, _, _, _,
		_, _, _, _, _, _, _, _, _, _, _, _,
		_, _, _, _, _, _, _, _, _, _, _, _,
		_, _, _, _, _, _, _, _, _, _, _, _,

	},
	yslice_prob = {
		{ypos = 2, prob = 127},
	},
})

bubbler_schematic = minetest.register_schematic({
	size = {x = 5, y = 4, z = 7},
	data = {

		_, _, P, _, _,
		_, _, A, _, _,	
		_, _, _, _, _,
		_, _, _, _, _,


		_, P, P, P, _,
		_, A, P, A, _,	
		_, _, A, _, _,
		_, _, _, _, _,


		P, P, B, P, P,
		A, P, P, P, A,	
		_, A, P, A, _,
		_, _, A, _, _,


		P, B, b, B, P,
		A, P, OV, P, A,	
		_, A, _, A, _,
		_, _, _, _, _,

		P, P, B, P, P,
		A, P, P, P, A,	
		_, A, P, A, _,
		_, _, A, _, _,


		_, P, P, P, _,
		_, A, P, A, _,	
		_, _, A, _, _,
		_, _, _, _, _,



		_, _, P, _, _,
		_, _, A, _, _,	
		_, _, _, _, _,
		_, _, _, _, _,


	},
	yslice_prob = {
		{ypos = 2, prob = 127},
	},
})

vent_schematic = minetest.register_schematic({
	size = {x = 5, y = 3, z = 3},
	data = {


		_, _, P, _, _,
		_, _, A, _, _,		
		_, _, _, _, _,


		_, P, BV, P, _,
		_, A, _, A, _,		
		_, _, _, _, _,


		_, _, P, _, _,
		_, _, A, _, _,		
		_, _, _, _, _,


	},
	yslice_prob = {
		{ypos = 2, prob = 127},
	},
})

vent = minetest.register_schematic({
	size = {x = 1, y = 1, z = 1},
	data = {
		PV,
	},
	yslice_prob = {
		{ypos = 2, prob = 127},
	},
})

minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"default:dirt_with_grass", "default:dry_dirt_with_grass", "default:dirt_with_coniferous_litter",
		    "default:sand", "default:silver_sand", "default:stone", "default:desert_stone"},
	sidelen = 64,
	fill_ratio = 0.0001,
	--biomes = {"Oceanside", "Hills", "Plains", "Desert",},
	y_min = -100,
	y_max = 31000,
	--spawn_by = "default:water",
	--num_spawn_by = 1,
	--flags = "",
	decoration = "magma:volcano",
	name = "magma:volcano",
	--height = 0,
	--param2 = 0,
	--param2_max = 0,
	place_offset_y = 0,
	place_offset_x = -6,
	place_offset_z = -7,
	schematic = vent,
	--replacements = {["oldname"] = "convert_to", ...},
	--flags = "place_center_x, place_center_y, place_center_z",
	rotation = "random",
})

minetest.register_node("magma:obsidian_vent", {
	description = "Obsidian Vent",
	drawtype = "normal",
	tiles = {"magma_obsidian_vent.png", "magma_obsidian.png"},
	paramtype = "light",
	light_source = 3,
	groups = {cracky=1},
})

minetest.register_abm({
	label = "obsidian_vent",
	nodenames = {"magma:obsidian_vent"},
	time = 10,
	chance = 5,
	action = function(pos)
		minetest.add_particlespawner({
			amount = 300,
			time = 4,
			minpos = pos,
			maxpos = pos,
			minvel = {x = -5, y = 5, z = -5},
			maxvel = {x = 5, y = 10, z = 5},
			minacc = {x = -5, y = 5, z = -5},
			mixacc = {x = 5, y = 10, z = 5},
			minexptime = 4,
			maxexptime = 10,
			minsize = 7.0,
			maxsize = 10.0,
			collisiondetection = false,
			texture = "magma_lava_spew.png",
			vertical = true,
		})
		pos.x = pos.x - 5
		pos.z = pos.z - 6
		minetest.place_schematic(pos, volcano_schematic)
	end
})

minetest.register_node("magma:basalt_vent", {
	description = "Basalt Vent",
	drawtype = "normal",
	tiles = {"magma_basalt_vent.png", "magma_basalt.png"},
	paramtype = "light",
	light_source = 3,
	groups = {cracky=1},
})

minetest.register_abm({
	label = "basalt_vent",
	nodenames = {"magma:basalt_vent"},
	time = 10,
	chance = 5,
	action = function(pos)
		minetest.add_particlespawner({
			amount = 250,
			time = 3,
			minpos = pos,
			maxpos = pos,
			minvel = {x = -5, y = 5, z = -5},
			maxvel = {x = 5, y = 10, z = 5},
			minacc = {x = -5, y = 5, z = -5},
			mixacc = {x = 5, y = 10, z = 5},
			minexptime = 3,
			maxexptime = 8,
			minsize = 5.0,
			maxsize = 7.0,
			collisiondetection = false,
			texture = "magma_lava_spew.png",
			vertical = true,
		})
		pos.x = pos.x - 2
		pos.z = pos.z - 3
		minetest.place_schematic(pos, bubbler_schematic)
	end
})

minetest.register_node("magma:pumice_vent", {
	description = "Pumice Vent",
	drawtype = "normal",
	tiles = {"magma_pumice_vent.png", "magma_pumice.png"},
	paramtype = "light",
	light_source = 3,
	groups = {cracky=1},
})

minetest.register_abm({
	label = "pumice_vent",
	nodenames = {"magma:pumice_vent"},
	time = 10,
	chance = 5,
	action = function(pos)
		minetest.add_particlespawner({
			amount = 200,
			time = 2,
			minpos = pos,
			maxpos = pos,
			minvel = {x = -5, y = 5, z = -5},
			maxvel = {x = 5, y = 10, z = 5},
			minacc = {x = -5, y = 5, z = -5},
			mixacc = {x = 5, y = 10, z = 5},
			minexptime = 2,
			maxexptime = 6,
			minsize = 2.0,
			maxsize = 5.0,
			collisiondetection = false,
			texture = "magma_lava_spew.png",
			vertical = true,
		})
		pos.x = pos.x - 2
		pos.z = pos.z - 1
		minetest.place_schematic(pos, vent_schematic)
	end
})


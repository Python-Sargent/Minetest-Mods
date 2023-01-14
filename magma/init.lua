magma = {}

modpath = minetest.get_modpath("magma")

minetest.register_node("magma:magma", {
	description = "Magma",
	drawtype = "normal",
	tiles = {"magma_magma.png"},
	paramtype = "light",
	light_source = 7,
	groups = {cracky=3},
})

minetest.register_node("magma:basalt", {
	description = "Basalt",
	drawtype = "normal",
	tiles = {"magma_basalt.png"},
	paramtype = "light",
	groups = {cracky=2},
})

minetest.register_node("magma:basalt_stone", {
	description = "Basalt Stone",
	drawtype = "normal",
	tiles = {"magma_basalt_stone.png"},
	paramtype = "light",
	groups = {cracky=2},
})

minetest.register_node("magma:obsidian", {
	description = "Obsidian",
	drawtype = "normal",
	tiles = {"magma_obsidian.png"},
	paramtype = "light",
	light_source = 7,
	groups = {cracky=1},
})

minetest.register_node("magma:ash", {
	description = "Ash",
	drawtype = "nodebox",
	tiles = {"magma_ash.png"},
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.25, 0.5},
		},
	},
	groups = {crumbly=3, falling_node=1},
})

minetest.register_node("magma:pumice", {
	description = "Pumice",
	drawtype = "normal",
	tiles = {"magma_pumice.png"},
	paramtype = "light",
	groups = {cracky=3},
})

dofile(modpath.."/volcano_schematic.lua")

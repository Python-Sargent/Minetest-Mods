-- Metals for Minetest >= 0.4.17

local modpath = minetest.get_modpath(minetest.get_current_modname())

metals = {}

-- Titanium darkred crystal

minetest.register_node("metals:stone_with_titanium", {
	description = "Titanium Ore",
	tiles = {"default_stone.png^metals_mineral_titanium.png"},
	groups = {cracky = 3},
	drop = 'metals:titanium_lump',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("metals:titanium_block", {
	description = "Titanium Block",
	tiles = {"metals_titanium_block.png"},
	is_ground_content = false,
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craftitem("metals:titanium_lump", { --mine titanium ore to get titanium lump
	description = "Titanium Lump",
	inventory_image = "metals_titanium_lump.png"
})

minetest.register_craftitem("metals:titanium_ingot", { --cook titanium lump to get titanium ingot
	description = "Titanium Ingot",
	inventory_image = "metals_titanium_ingot.png"
})

minetest.register_craft({
	type = "cooking",
	output = "metals:titanium_ingot",
	recipe = "metals:titanium_lump",
	cooktime = 8,
})

-- Tungsten black-gold dull

minetest.register_node("metals:stone_with_tungsten", {
	description = "Tungsten Ore",
	tiles = {"default_stone.png^metals_mineral_tungsten.png"},
	groups = {cracky = 3},
	drop = 'metals:tungsten_lump',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("metals:tungsten_block", {
	description = "Tungsten Block",
	tiles = {"metals_tungsten_block.png"},
	is_ground_content = false,
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craftitem("metals:tungsten_lump", { --mine tungsten ore to get tungsten lump
	description = "Tungsten Lump",
	inventory_image = "metals_tungsten_lump.png"
})

minetest.register_craftitem("metals:tungsten_ingot", { --cook tungsten lump to get tungsten ingot
	description = "Tungsten Ingot",
	inventory_image = "metals_tungsten_ingot.png"
})

minetest.register_craft({
	type = "cooking",
	output = "metals:tungsten_ingot",
	recipe = "metals:tungsten_lump",
	cooktime = 7,
})

-- Aluminum bauxite [redish-silver, dull]

minetest.register_node("metals:stone_with_aluminum", {
	description = "Aluminum Ore",
	tiles = {"default_stone.png^metals_mineral_aluminum.png"},
	groups = {cracky = 3},
	drop = 'metals:aluminum_lump',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("metals:aluminum_block", {
	description = "Aluminum Block",
	tiles = {"metals_aluminum_block.png"},
	is_ground_content = false,
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craftitem("metals:aluminum_lump", { --mine aluminum ore to get aluminum lump
	description = "Aluminum Lump",
	inventory_image = "metals_aluminum_lump.png"
})

minetest.register_craftitem("metals:aluminum_ingot", { --cook aluminum lump to get aluminum ingot
	description = "Aluminum Ingot",
	inventory_image = "metals_aluminum_ingot.png"
})

minetest.register_craft({
	type = "cooking",
	output = "metals:aluminum_ingot",
	recipe = "metals:aluminum_lump",
	cooktime = 6,
})

-- platinum silvery-white pinkish

minetest.register_node("metals:stone_with_platinum", {
	description = "Platinum Ore",
	tiles = {"default_stone.png^metals_mineral_platinum.png"},
	groups = {cracky = 3},
	drop = 'metals:platinum_lump',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("metals:platinum_block", {
	description = "Platinum Block",
	tiles = {"metals_platinum_block.png"},
	is_ground_content = false,
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craftitem("metals:platinum_lump", { --mine platinum ore to get platinum lump
	description = "Platinum Lump",
	inventory_image = "metals_platinum_lump.png"
})

minetest.register_craftitem("metals:platinum_ingot", { --cook platinum lump to get platinum ingot
	description = "Platinum Ingot",
	inventory_image = "metals_platinum_ingot.png"
})

minetest.register_craft({
	type = "cooking",
	output = "metals:platinum_ingot",
	recipe = "metals:platinum_lump",
	cooktime = 8,
})

-- iridium dull reflective dirty tinge

minetest.register_node("metals:stone_with_iridium", {
	description = "Iridium Ore",
	tiles = {"default_stone.png^metals_mineral_iridium.png"},
	groups = {cracky = 3},
	drop = 'metals:iridium_lump',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("metals:iridium_block", {
	description = "Iridium Block",
	tiles = {"metals_iridium_block.png"},
	is_ground_content = false,
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craftitem("metals:iridium_lump", { --mine iridium ore to get iridium lump
	description = "Iridium Lump",
	inventory_image = "metals_iridium_lump.png"
})

minetest.register_craftitem("metals:iridium_ingot", { --cook iridium lump to get iridium ingot
	description = "Iridium Ingot",
	inventory_image = "metals_iridium_ingot.png"
})

minetest.register_craft({
	type = "cooking",
	output = "metals:iridium_ingot",
	recipe = "metals:iridium_lump",
	cooktime = 8,
})

-- osmium bluish-white reflective

minetest.register_node("metals:stone_with_osmium", {
	description = "Osmium Ore",
	tiles = {"default_stone.png^metals_mineral_osmium.png"},
	groups = {cracky = 3},
	drop = 'metals:osmium_lump',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("metals:osmium_block", {
	description = "Osmium Block",
	tiles = {"metals_osmium_block.png"},
	is_ground_content = false,
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craftitem("metals:osmium_lump", { --mine osmium ore to get osmium lump
	description = "Osmium Lump",
	inventory_image = "metals_osmium_lump.png"
})

minetest.register_craftitem("metals:osmium_ingot", { --cook osmium lump to get osmium ingot
	description = "Osmium Ingot",
	inventory_image = "metals_osmium_ingot.png"
})

minetest.register_craft({
	type = "cooking",
	output = "metals:osmium_ingot",
	recipe = "metals:osmium_lump",
	cooktime = 5,
})

-- zinc   white/tan

minetest.register_node("metals:stone_with_zinc", {
	description = "Zinc Ore",
	tiles = {"default_stone.png^metals_mineral_zinc.png"},
	groups = {cracky = 3},
	drop = 'metals:zinc_lump',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("metals:zinc_block", {
	description = "Zinc Block",
	tiles = {"metals_zinc_block.png"},
	is_ground_content = false,
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craftitem("metals:zinc_lump", { --mine zinc ore to get zinc lump
	description = "Zinc Lump",
	inventory_image = "metals_zinc_lump.png"
})

minetest.register_craftitem("metals:zinc_ingot", { --cook zinc lump to get zinc ingot
	description = "Zinc Ingot",
	inventory_image = "metals_zinc_ingot.png"
})

minetest.register_craft({
	type = "cooking",
	output = "metals:zinc_ingot",
	recipe = "metals:zinc_lump",
	cooktime = 3,
})

--iron (default)
-- tin (default)
-- gold (default)
-- silver (moreores) silvery

minetest.register_node("metals:stone_with_silver", {
	description = "Silver Ore",
	tiles = {"default_stone.png^metals_mineral_silver.png"},
	groups = {cracky = 3},
	drop = 'metals:silver_lump',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("metals:silver_block", {
	description = "Silver Block",
	tiles = {"metals_silver_block.png"},
	is_ground_content = false,
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craftitem("metals:silver_lump", { --mine silver ore to get silver lump
	description = "Silver Lump",
	inventory_image = "metals_silver_lump.png"
})

minetest.register_craftitem("metals:silver_ingot", { --cook silver lump to get silver ingot
	description = "Silver Ingot",
	inventory_image = "metals_silver_ingot.png"
})

minetest.register_craft({
	type = "cooking",
	output = "metals:silver_ingot",
	recipe = "metals:silver_lump",
	cooktime = 4,
})

--copper (default, metals)
-- mercury dark-reflective greenish-layered [cinnabar]

minetest.register_node("metals:stone_with_mercury", {
	description = "Mercury Ore",
	tiles = {"default_stone.png^metals_mineral_mercury.png"},
	groups = {cracky = 3},
	drop = 'metals:mercury_lump',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("metals:mercury_block", {
	description = "Mercury Block",
	tiles = {"metals_mercury_block.png"},
	is_ground_content = false,
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craftitem("metals:mercury_lump", { --mine mercury ore to get mercury lump
	description = "Mercury Lump",
	inventory_image = "metals_mercury_lump.png"
})

minetest.register_craftitem("metals:mercury_ingot", { --cook mercury lump to get mercury ingot
	description = "Mercury Ingot",
	inventory_image = "metals_mercury_ingot.png"
})

minetest.register_craft({
	type = "cooking",
	output = "metals:mercury_ingot",
	recipe = "metals:mercury_lump",
	cooktime = 1,
})

-- lead (metals) dull reflective tan spots

minetest.register_node("metals:stone_with_lead", {
	description = "Lead Ore",
	tiles = {"default_stone.png^metals_mineral_lead.png"},
	groups = {cracky = 3},
	drop = 'metals:lead_lump',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("metals:lead_block", {
	description = "Lead Block",
	tiles = {"metals_lead_block.png"},
	is_ground_content = false,
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craftitem("metals:lead_lump", { --mine lead ore to get lead lump
	description = "Lead Lump",
	inventory_image = "metals_lead_lump.png"
})

minetest.register_craftitem("metals:lead_ingot", { --cook lead lump to get lead ingot
	description = "Lead Ingot",
	inventory_image = "metals_lead_ingot.png"
})

minetest.register_craft({
	type = "cooking",
	output = "metals:lead_ingot",
	recipe = "metals:lead_lump",
	cooktime = 2,
})

-- chromium purplish-grey

minetest.register_node("metals:stone_with_chromium", {
	description = "Chromium Ore",
	tiles = {"default_stone.png^metals_mineral_chromium.png"},
	groups = {cracky = 3},
	drop = 'metals:chromium_lump',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("metals:chromium_block", {
	description = "Chromium Block",
	tiles = {"metals_chromium_block.png"},
	is_ground_content = false,
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craftitem("metals:chromium_lump", { --mine chromium ore to get chromium lump
	description = "Chromium Lump",
	inventory_image = "metals_chromium_lump.png"
})

minetest.register_craftitem("metals:chromium_ingot", { --cook chromium lump to get chromium ingot
	description = "Chromium Ingot",
	inventory_image = "metals_chromium_ingot.png"
})

minetest.register_craft({
	type = "cooking",
	output = "metals:chromium_ingot",
	recipe = "metals:chromium_lump",
	cooktime = 7,
})

-- register ores

--titanium

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "metals:stone_with_titanium",
	wherein        = "default:stone",
	clust_scarcity = 10 * 10 * 10,
	clust_num_ores = 10,
	clust_size     = 2,
	y_min          = -31000,
	y_max          = -775,
})

-- tungsten

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "metals:stone_with_tungsten",
	wherein        = "default:stone",
	clust_scarcity = 10 * 10 * 10,
	clust_num_ores = 12,
	clust_size     = 2,
	y_min          = -31000,
	y_max          = -775,
})

-- aluminum

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "metals:stone_with_aluminum",
	wherein        = "default:stone",
	clust_scarcity = 9 * 9 * 9,
	clust_num_ores = 12,
	clust_size     = 3,
	y_min          = -31000,
	y_max          = -325,
})

-- platinum

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "metals:stone_with_platinum",
	wherein        = "default:stone",
	clust_scarcity = 12 * 12 * 12,
	clust_num_ores = 12,
	clust_size     = 2,
	y_min          = -31000,
	y_max          = -750,
})

-- iridium

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "metals:stone_with_iridium",
	wherein        = "default:stone",
	clust_scarcity = 10 * 10 * 10,
	clust_num_ores = 12,
	clust_size     = 3,
	y_min          = -31000,
	y_max          = -700,
})

-- osmium

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "metals:stone_with_osmium",
	wherein        = "default:stone",
	clust_scarcity = 10 * 10 * 10,
	clust_num_ores = 12,
	clust_size     = 2,
	y_min          = -31000,
	y_max          = -680,
})

-- zinc

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "metals:stone_with_zinc",
	wherein        = "default:stone",
	clust_scarcity = 9 * 9 * 9,
	clust_num_ores = 12,
	clust_size     = 5,
	y_min          = -31000,
	y_max          = -150,
})

-- silver

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "metals:stone_with_silver",
	wherein        = "default:stone",
	clust_scarcity = 10 * 10 * 10,
	clust_num_ores = 12,
	clust_size     = 3,
	y_min          = -31000,
	y_max          = -535,
})

-- mercury

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "metals:stone_with_mercury",
	wherein        = "default:stone",
	clust_scarcity = 11 * 11 * 11,
	clust_num_ores = 10,
	clust_size     = 1,
	y_min          = -31000,
	y_max          = -10,
})

-- lead

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "metals:stone_with_lead",
	wherein        = "default:stone",
	clust_scarcity = 10 * 10 * 10,
	clust_num_ores = 15,
	clust_size     = 3,
	y_min          = -31000,
	y_max          = -75,
})

-- chromium

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "metals:stone_with_tungsten",
	wherein        = "default:stone",
	clust_scarcity = 12 * 12 * 12,
	clust_num_ores = 12,
	clust_size     = 2,
	y_min          = -31000,
	y_max          = -425,
})

-- tools

metals.register_pickaxe_type = function(def)
	minetest.register_tool("metals:" .. def.mat .. "pickaxe", {
		description = def.dmat.." Pickaxe",
		inventory_image = def.imagename or "metals_"..def.mat.."_pick.png",
		tool_capabilities = {
			full_punch_interval = 1.0,
			max_drop_level = 1,
			groupcaps={
				cracky = {times={[1]=2.4, [2]=1.2, [3]=0.60}, uses=20, maxlevel=3},
			},
			damage_groups = {fleshy=4},
		},
		groups = {pickaxe=1},
		sound = {breaks = "default_tool_breaks"},
	})
	minetest.register_craft({
		output = "metals:" .. def.mat .. "pickaxe",
		recipe = {
			{def.matname, def.matname, def.matname},
			{"", "default:stick", ""},
			{"", "default:stick", ""},
		}	
	})
end

metals.register_shovel_type = function(def)
	minetest.register_tool("metals:" .. def.mat .. "shovel", {
		description = def.dmat.." Shovel",
		inventory_image = def.imagename or "metals_"..def.mat.."_shovel.png",
		tool_capabilities = {
			full_punch_interval = 1.0,
			max_drop_level=3,
			groupcaps={
				crumbly = {times={[1]=1.20, [2]=0.60, [3]=0.30}, uses=20, maxlevel=3},
			},
			damage_groups = {fleshy=4},
		},
		groups = {shovel=1},
		sound = {breaks = "default_tool_breaks"}
	})
	minetest.register_craft({
		output = "metals:" .. def.mat .. "shovel",
		recipe = {
			{"", def.matname, ""},
			{"", "default:stick", ""},
			{"", "default:stick", ""},
		}	
	})
end


metals.register_axe_type = function(def)
	minetest.register_tool("metals:" .. def.mat .. "axe", {
		description = def.dmat.." Axe",
		inventory_image = def.imagename or "metals_"..def.mat.."_axe.png",
		tool_capabilities = {
			full_punch_interval = 0.9,
			max_drop_level=1,
			groupcaps={
				choppy={times={[1]=2.20, [2]=1.00, [3]=0.60}, uses=20, maxlevel=3},
			},
			damage_groups = {fleshy=6},
		},
		sound = {breaks = "default_tool_breaks"},
		groups = {axe = 1},
	})
	minetest.register_craft({
		output = "metals:" .. def.mat .. "axe",
		recipe = {
			{def.matname, def.matname, ""},
			{def.matname, "default:stick", ""},
			{"", "default:stick", ""},
		}	
	})
end

metals.register_sword_type = function(def)
	minetest.register_tool("metals:" .. def.mat .. "sword", {
		description = def.dmat.." Sword",
		inventory_image = def.imagename or "metals_"..def.mat.."_sword.png",
		tool_capabilities = {
			full_punch_interval = 0.7,
			max_drop_level=1,
			groupcaps={
				snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=30, maxlevel=3},
			},
			damage_groups = {fleshy=7},
		},
		sound = {breaks = "default_tool_breaks"},
		groups = {sword = 1},
	})
	minetest.register_craft({
		output = "metals:" .. def.mat .. "sword",
		recipe = {
			{"", def.matname, ""},
			{"", def.matname, ""},
			{"", "default:stick", ""},
		}	
	})
end

metals.register_tool_type = function(def)
	metals.register_pickaxe_type(def)
	metals.register_shovel_type(def)
	metals.register_axe_type(def)
	metals.register_sword_type(def)
end

tungsten_def = {
	mat = "tungsten",
	dmat = "Tungsten",
	matname = "metals:tungsten_ingot",
}
metals.register_tool_type(tungsten_def)

titanium_def = {
	mat = "titanium",
	dmat = "Titanium",
	matname = "metals:titanium_ingot",
}
metals.register_tool_type(titanium_def)

chromium_def = {
	mat = "chromium",
	dmat = "Chromium",
	matname = "metals:chromium_ingot",
}
metals.register_tool_type(chromium_def)

osmium_def = {
	mat = "osmium",
	dmat = "Osmium",
	matname = "metals:osmium_ingot",
}
metals.register_tool_type(osmium_def)

iridium_def = {
	mat = "iridium",
	dmat = "Iridium",
	matname = "metals:iridium_ingot",
}
metals.register_tool_type(iridium_def)

platinum_def = {
	mat = "platinum",
	dmat = "Platinum",
	matname = "metals:platinum_ingot",
}
metals.register_tool_type(platinum_def)

aluminum_def = {
	mat = "aluminum",
	dmat = "Aluminum",
	matname = "metals:aluminum_ingot",
}
metals.register_tool_type(aluminum_def)

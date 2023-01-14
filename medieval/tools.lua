--       --
-- TOOLS --
--       --
-- battleaxe
local function register_battleaxe(def)
	minetest.register_tool("medieval:battleaxe_"..def.name, {
		description = def.dname.." Battleaxe",
		inventory_image = "medieval_"..def.name.."_battleaxe.png",
		tool_capabilities = {
			full_punch_interval = 6.0,
			max_drop_level=1,
			groupcaps={
				choppy={times=def.times},
			},
			damage_groups = {fleshy=def.level},
		},
		sound = {breaks = "default_tool_breaks"},
		groups = {battlaxe = 1},
	})
	minetest.register_craft({
		output = "medieval:battleaxe_"..def.name,
		recipe = {
			{def.matname, def.matname, def.matname},
			{def.matname, "default:stick", def.matname},
			{"", "default:stick", ""},
		}	
	})
end

stone_def = {
	matname = "group:stone",
	name = "stone",
	dname = "Stone",
	level = 5,
	times = {}
}
register_battleaxe(stone_def)

bronze_def = {
	matname = "default:bronze_ingot",
	name = "bronze",
	dname = "Bronze",
	level = 6,
	times = {}
}
register_battleaxe(bronze_def)

steel_def = {
	matname = "default:steel_ingot",
	name = "steel",
	dname = "Steel",
	level = 7,
	times = {}
}
register_battleaxe(steel_def)

mese_def = {
	matname = "default:mese_crystal",
	name = "mese",
	dname = "Mese",
	level = 8,
	times = {}
}
register_battleaxe(mese_def)

diamond_def = {
	matname = "default:diamond",
	name = "diamond",
	dname = "Diamond",
	level = 9,
	times = {}
}
register_battleaxe(diamond_def)

-- lances

local function register_lance(def)
	minetest.register_tool("medieval:lance_"..def.name, {
		description = def.dname.." Lance",
		inventory_image = "medieval_"..def.name.."_lance.png",
		tool_capabilities = {
			full_punch_interval = 5.0,
			max_drop_level=1,
			groupcaps={
				stabby={times=def.times},
			},
			damage_groups = {fleshy=def.level},
		},
		sound = {breaks = "default_tool_breaks"},
		groups = {lance = 1},
	})
	minetest.register_craft({
		output = "medieval:lance_"..def.name,
		recipe = {
			{"", "", def.matname},
			{"", def.matname, ""},
			{"default:stick", "", ""},
		}	
	})
end

stone_def = {
	matname = "group:stone",
	name = "stone",
	dname = "Stone",
	level = 3,
	times = {}
}
register_lance(stone_def)

bronze_def = {
	matname = "default:bronze_ingot",
	name = "bronze",
	dname = "Bronze",
	level = 5,
	times = {}
}
register_lance(bronze_def)

steel_def = {
	matname = "default:steel_ingot",
	name = "steel",
	dname = "Steel",
	level = 6,
	times = {}
}
register_lance(steel_def)

mese_def = {
	matname = "default:mese_crystal",
	name = "mese",
	dname = "Mese",
	level = 7,
	times = {}
}
register_lance(mese_def)

diamond_def = {
	matname = "default:diamond",
	name = "diamond",
	dname = "Diamond",
	level = 8,
	times = {}
}
register_lance(diamond_def)

--longsword

local function register_longsword(def)
	minetest.register_tool("medieval:longsword_"..def.name, {
		description = def.dname.." Longsword",
		inventory_image = "medieval_"..def.name.."_longsword.png",
		tool_capabilities = {
			full_punch_interval = 4.0,
			max_drop_level=1,
			groupcaps={
				stabby={times=def.times},
			},
			damage_groups = {fleshy=def.level},
		},
		sound = {breaks = "default_tool_breaks"},
		groups = {lance = 1},
	})
	minetest.register_craft({
		output = "medieval:longsword_"..def.name,
		recipe = {
			{"", "", def.matname},
			{"", def.matname, ""},
			{"default:stick", "", ""},
		}	
	})
end

stone_def = {
	matname = "group:stone",
	name = "stone",
	dname = "Stone",
	level = 4,
	times = {}
}
register_longsword(stone_def)

bronze_def = {
	matname = "default:bronze_ingot",
	name = "bronze",
	dname = "Bronze",
	level = 5,
	times = {}
}
register_longsword(bronze_def)

steel_def = {
	matname = "default:steel_ingot",
	name = "steel",
	dname = "Steel",
	level = 6,
	times = {}
}
register_longsword(steel_def)

mese_def = {
	matname = "default:mese_crystal",
	name = "mese",
	dname = "Mese",
	level = 7,
	times = {}
}
register_longsword(mese_def)

diamond_def = {
	matname = "default:diamond",
	name = "diamond",
	dname = "Diamond",
	level = 8,
	times = {}
}
register_longsword(diamond_def)

--broadsword

local function register_broadsword(def)
	minetest.register_tool("medieval:broadsword_"..def.name, {
		description = def.dname.." Broadsword",
		inventory_image = "medieval_"..def.name.."_broadsword.png",
		tool_capabilities = {
			full_punch_interval = 4.0,
			max_drop_level=1,
			groupcaps={
				fleshy={times=def.times},
			},
			damage_groups = {fleshy=def.level},
		},
		sound = {breaks = "default_tool_breaks"},
		groups = {lance = 1},
	})
	minetest.register_craft({
		output = "medieval:broadsword_"..def.name,
		recipe = {
			{"", "", def.matname},
			{"", def.matname, ""},
			{"default:stick", "", ""},
		}	
	})
end

stone_def = {
	matname = "group:stone",
	name = "stone",
	dname = "Stone",
	level = 4,
	times = {}
}
register_broadsword(stone_def)

bronze_def = {
	matname = "default:bronze_ingot",
	name = "bronze",
	dname = "Bronze",
	level = 5,
	times = {}
}
register_broadsword(bronze_def)

steel_def = {
	matname = "default:steel_ingot",
	name = "steel",
	dname = "Steel",
	level = 6,
	times = {}
}
register_broadsword(steel_def)

mese_def = {
	matname = "default:mese_crystal",
	name = "mese",
	dname = "Mese",
	level = 7,
	times = {}
}
register_broadsword(mese_def)

diamond_def = {
	matname = "default:diamond",
	name = "diamond",
	dname = "Diamond",
	level = 8,
	times = {}
}
register_broadsword(diamond_def)

-- other tools and weapons

minetest.register_tool("medieval:scythe", {
	description = "Scythe",
	inventory_image = "medieval_scythe.png",
	tool_capabilities = {
		full_punch_interval = 4.0,
		max_drop_level=1,
		groupcaps={
			snappy={times={}},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {scythe = 1},
})
minetest.register_craft({
	output = "medieval:scythe",
	recipe = {
		{"default:steel_ingot", "default:steel_ingot", ""},
		{"", "default:steel_ingot", ""},
		{"", "default:stick", ""},
	}	
})

minetest.register_tool("medieval:burning_brand", {
	description = "Burning Brand",
	inventory_image = "medieval_burning_brand.png",
	tool_capabilities = {
		full_punch_interval = 2.0,
		max_drop_level=1,
		groupcaps={
			flammable={times={}},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {burning = 1},
})
minetest.register_tool("medieval:quenched_brand", {
	description = "Quenched Brand",
	inventory_image = "medieval_quenched_brand.png",
	tool_capabilities = {
		full_punch_interval = 2.0,
		max_drop_level=1,
		groupcaps={
			flammable={times={}},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {burning = 1},
})
minetest.register_craft({
	output = "medieval:quenched_brand",
	recipe = {
		{"", "default:coal_lump", ""},
		{"", "default:stick", ""},
		{"", "default:stick", ""},
	}	
})

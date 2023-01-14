mls = {}

minetest.register_node("mls:toxic_source", {
	description = "Toxic Liquid Source",
	drawtype = "liquid",
	tiles = {
		{
			name = "mls_toxic_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
	},
	special_tiles = {
		-- New-style water source material (mostly unused)
		{
			name = "mls_toxic_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
			backface_culling = false,
		},
	},
	alpha = 160,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "mls:toxic_source",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "mls:toxic_flowing",
	liquid_alternative_source = "mls:toxic_source",
	liquid_viscosity = 1,
	damage_per_second = 2,
	post_effect_color = {a = 150, r = 50, g = 110, b = 50},
	groups = {water = 3, liquid = 3, puts_out_fire = 1, cools_lava = 1},
	sounds = default.node_sound_water_defaults(),
})

minetest.register_node("mls:toxic_flowing", {
	description = "Flowing Toxic Liquid",
	drawtype = "flowingliquid",
	tiles = {"mls_toxic.png"},
	special_tiles = {
		{
			name = "mls_toxic_flowing_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
		{
			name = "mls_toxic_flowing_animated.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
	},
	alpha = 160,
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "mls:toxic_flowing",
	liquid_alternative_source = "mls:toxic_source",
	liquid_viscosity = 1,
	damage_per_second = 2,
	post_effect_color = {a = 150, r = 50, g = 110, b = 50},
	groups = {water = 3, liquid = 3, puts_out_fire = 1,
		not_in_creative_inventory = 1, cools_lava = 1},
	sounds = default.node_sound_water_defaults(),
})

minetest.register_node("mls:mud_source", {
	description = "Mud Source",
	drawtype = "liquid",
	tiles = {
		{
			name = "mls_mud_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
	},
	special_tiles = {
		-- New-style water source material (mostly unused)
		{
			name = "mls_mud_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
			backface_culling = false,
		},
	},
	alpha = 230,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "mls:mud_source",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "mls:mud_flowing",
	liquid_alternative_source = "mls:mud_source",
	liquid_viscosity = 7,
	move_resistance = 7,
	post_effect_color = {a = 180, r = 35, g = 25, b = 10},
	groups = {liquid = 3, cools_lava = 1},
	sounds = default.node_sound_water_defaults(),
})

minetest.register_node("mls:mud_flowing", {
	description = "Flowing Mud",
	drawtype = "flowingliquid",
	tiles = {"mls_mud.png"},
	special_tiles = {
		{
			name = "mls_mud_flowing_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
		{
			name = "mls_mud_flowing_animated.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
	},
	alpha = 230,
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "mls:mud_flowing",
	liquid_alternative_source = "mls:mud_source",
	liquid_viscosity = 7,
	move_resistance = 7,
	post_effect_color = {a = 180, r = 35, g = 25, b = 10},
	groups = {liquid = 3, not_in_creative_inventory = 1, cools_lava = 1},
	sounds = default.node_sound_water_defaults(),
})

minetest.register_node("mls:milk_source", {
	description = "Milk Source",
	drawtype = "liquid",
	tiles = {
		{
			name = "mls_milk_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.9,
			},
		},
	},
	special_tiles = {
		-- New-style water source material (mostly unused)
		{
			name = "mls_milk_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.9,
			},
			backface_culling = false,
		},
	},
	alpha = 210,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "mls:milk_source",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "mls:milk_flowing",
	liquid_alternative_source = "mls:milk_source",
	liquid_viscosity = 1,
	damage_per_second = -1,
	post_effect_color = {a = 180, r = 240, g = 240, b = 240},
	groups = {liquid = 3, cools_lava = 1},
	sounds = default.node_sound_water_defaults(),
})

minetest.register_node("mls:milk_flowing", {
	description = "Flowing Milk",
	drawtype = "flowingliquid",
	tiles = {"mls_milk.png"},
	special_tiles = {
		{
			name = "mls_milk_flowing_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
		{
			name = "mls_milk_flowing_animated.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
	},
	alpha = 210,
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "mls:milk_flowing",
	liquid_alternative_source = "mls:milk_source",
	liquid_viscosity = 1,
	damage_per_second = -1,
	post_effect_color = {a = 180, r = 240, g = 240, b = 240},
	groups = {liquid = 3, not_in_creative_inventory = 1, cools_lava = 1},
	sounds = default.node_sound_water_defaults(),
})

--bucket.register_bucket(toxic)
--bucket.register_bucket(mud)
--bucket.register_bucket(milk)
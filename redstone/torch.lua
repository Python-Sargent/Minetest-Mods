
minetest.register_node("redstone:redstone_torch", {
	description = "Redstone Torch",
	drawtype = "mesh",
	mesh = "redstone_torch_floor.obj",
	inventory_image = "redstone_torch_on_floor.png",
	wield_image = "redstone_torch.png",
	tiles = {{
		    name = "redstone_torch_on_floor_animated.png",
		    animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 3.3}
	}},
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	liquids_pointable = false,
	light_source = 6,
	groups = {choppy=2, dig_immediate=3, flammable=1, attached_node=1, redstone_torch=1},
	drop = "redstone:redstone_torch",
	selection_box = {
		type = "wallmounted",
		wall_bottom = {-1/8, -1/2, -1/8, 1/8, 2/16, 1/8},
	},
	sounds = default.node_sound_wood_defaults(),
	on_place = function(itemstack, placer, pointed_thing)
		local under = pointed_thing.under
		local node = minetest.get_node(under)
		local def = minetest.registered_nodes[node.name]
		if def and def.on_rightclick and
			not (placer and placer:is_player() and
			placer:get_player_control().sneak) then
			return def.on_rightclick(under, node, placer, itemstack,
				pointed_thing) or itemstack
		end

		local above = pointed_thing.above
		local wdir = minetest.dir_to_wallmounted(vector.subtract(under, above))
		local fakestack = itemstack
		if wdir == 0 then
			fakestack:set_name("redstone:redstone_torch_ceiling")
		elseif wdir == 1 then
			fakestack:set_name("redstone:redstone_torch")
		else
			fakestack:set_name("redstone:redstone_torch_wall")
		end

		itemstack = minetest.item_place(fakestack, placer, pointed_thing, wdir)
		itemstack:set_name("redstone:redstone_torch")

		return itemstack
	end
})

minetest.register_node("redstone:redstone_torch_wall", {
	drawtype = "mesh",
	mesh = "redstone_torch_wall.obj",
	tiles = {{
		    name = "redstone_torch_on_floor_animated.png",
		    animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 3.3}
	}},
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	light_source = 12,
	groups = {choppy=2, dig_immediate=3, flammable=1, not_in_creative_inventory=1, attached_node=1, redstone_torch=1},
	drop = "redstone:redstone_torch",
	selection_box = {
		type = "wallmounted",
		wall_side = {-1/2, -1/2, -1/8, -1/8, 1/8, 1/8},
	},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("redstone:redstone_torch_ceiling", {
	drawtype = "mesh",
	mesh = "redstone_torch_ceiling.obj",
	tiles = {{
		    name = "redstone_torch_on_floor_animated.png",
		    animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 3.3}
	}},
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	light_source = 12,
	groups = {choppy=2, dig_immediate=3, flammable=1, not_in_creative_inventory=1, attached_node=1, redstone_torch=1},
	drop = "redstone:redstone_torch",
	selection_box = {
		type = "wallmounted",
		wall_top = {-1/8, -1/16, -5/16, 1/8, 1/2, 1/8},
	},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_lbm({
	name = "redstone:3dredstone_torch",
	nodenames = {"redstone:redstone_torch", "redstone_torches:floor", "redstone_torches:wall"},
	action = function(pos, node)
		if node.param2 == 0 then
			minetest.set_node(pos, {name = "redstone:redstone_torch_ceiling",
				param2 = node.param2})
		elseif node.param2 == 1 then
			minetest.set_node(pos, {name = "redstone:redstone_torch",
				param2 = node.param2})
		else
			minetest.set_node(pos, {name = "redstone:redstone_torch_wall",
				param2 = node.param2})
		end
	end
})

minetest.register_craft( {
	output = "redstone:redstone_torch 2",
	recipe = {
		{ "", "redstone:redstone_dust", "" },
		{ "", "default:stick", "" },
	},
})

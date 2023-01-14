minetest.register_node("eln:wire", {
	description = "Wire",
	paramtype = "light",
	drawtype = "nodebox",
	walkable = false,
	climbable = false,
	sunlight_propagates = true,
	groups = {cracky=3},
	tiles = {
		"eln_wire.png"
	},
	node_box = {
		type = "connected",
		fixed = {-0.125, -0.5, -0.125, 0.125, -0.4375, 0.125}, --centerpiece
		connect_front = {-0.0625, -0.5, -0.5, 0.0625, -0.4375, 0},
		connect_left = {-0.5, -0.5, -0.0625, 0, -0.4375, 0.0625}, --left
		connect_back = {-0.0625, -0.5, 0, 0.0625, -0.4375, 0.5},
		connect_right = {0, -0.5, -0.0625, 0.5, -0.4375, 0.0625} --right
	},
	connects_to = {"eln:wire", "eln:battery", "eln:light", "eln:light_lit", "eln:switch", "eln:switch_on"},
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_int("vlt", 0)
		meta:set_int("rst", 1)
		meta:set_int("crt", 0 / 1)
		meta:set_string("pwt", "wire")
		meta:set_string("prp", "")
		meta:set_int("mxc", 25) --explodes_at = 25; these only change for diffferent wire
		meta:set_int("sfl", 20) --soft_limit = 20
		local timer = minetest.get_node_timer(pos)
		timer:start(0.1)
	end,
	on_timer = function(pos)
		local pos1 = {x = pos.x + 1, y = pos.y, z = pos.z}
		local pos2 = {x = pos.x - 1, y = pos.y, z = pos.z}
		local pos3 = {x = pos.x, y = pos.y, z = pos.z + 1}
		local pos4 = {x = pos.x, y = pos.y, z = pos.z - 1}
		local positions = {pos1, pos2, pos3, pos4}
		local poslen = #positions
		local highest_bidder = 0
		local valid_source = false
		for posit=1, poslen do
			local meta = minetest.get_meta(positions[posit]) --get meta of nodes around node by faces
			local power_type = meta:get_string("pwt") --power type
			if power_type == "source" then --if power_type == "source" then
				local metap = minetest.get_meta(pos)
				local meta = minetest.get_meta(positions[posit])
				metap:set_string("prp", minetest.serialize(positions[posit])) -- store the position of power-source
				valid_source = true
				local advlt = meta:get_int("vlt")
				if advlt > highest_bidder then
					highest_bidder = advlt
				end
				break
			elseif power_type == "wire" then
				local meta = minetest.get_meta(positions[posit])
				local serf = meta:get_string("prp")
				if serf ~= nil and type(serf) == "string" then
					local src_ref = minetest.deserialize(serf)
					if src_ref ~= nil and type(src_ref) == "table" then
						local smeta = minetest.get_meta(src_ref)
						local powertype = smeta:get_string("pwt")
						if powertype == "source" then
							valid_source = true
							local advlt = smeta:get_int("vlt")
							if advlt > highest_bidder then
								highest_bidder = advlt
							end
							local metap = minetest.get_meta(pos)
							metap:set_string("prp", minetest.serialize(src_ref)) -- store the position of power-source
						end
					end
					break
				end
			else
				local meta = minetest.get_meta(pos)
				meta:set_int("vlt", 0)
				meta:set_int("rst", 1)
				meta:set_int("crt", 0) --reset all variebles to 0 (off)
				meta:set_string("prp", "")
			end
		end
		local meta = minetest.get_meta(pos)
		if valid_source then  --if highest source number is greater than 1
			meta:set_int("vlt", highest_bidder)
			local vlt = meta:get_int("vlt")
			local rst = meta:get_int("rst")
			local crt = vlt / rst
			meta:set_int("crt", crt)
		else --no valid source
			meta:set_int("vlt", 0)
			meta:set_int("crt", 0)
		end
		return true
	end
})

minetest.register_node("eln:battery", {
	description = "Adjustable Battery",
	paramtype = "light",
	drawtype = "nodebox",
	walkable = true,
	climbable = false,
	sunlight_propagates = true,
	groups = {cracky=3},
	tiles = {
		"eln_battery.png"
	},
	node_box = {
		type = "connected",
		fixed = {{-0.3125, -0.5, -0.3125, 0.3125, -0.375, 0.3125}, {-0.3125, -0.5, 0.0625, -0.125, 0, 0.3125}, {0, -0.5, 0.0625, 0.3125, 0, 0.3125}, {-0.3125, -0.5, -0.3125, 0.3125, -0.125, 0}, {0.125, -0.5, -0.3125, 0.3125, -0.0625, 0},},
		connect_front = {-0.0625, -0.5, -0.5, 0.0625, -0.4375, 0},
		connect_left = {-0.5, -0.5, -0.0625, 0, -0.4375, 0.0625},
		connect_back = {-0.0625, -0.5, 0, 0.0625, -0.4375, 0.5},
		connect_right = {0, -0.5, -0.0625, 0.5, -0.4375, 0.0625}
	},
	connects_to = {"eln:wire", "eln:battery", "eln:light", "eln:light_lit", "eln:switch", "eln:switch_on"},
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", [[
			size[5, 5]
			position[0.5, 0.5]
			anchor[0.5, 0.5]
			label[1, 1; Voltage: ]
			field[1, 3; Volts;0.0;vlts]
			field_close_on_enter[vlts; false]
			button_exit[2, 4; 2, 2;ext;Continue]
		]])
		meta:set_int("vlt", 10)
		meta:set_int("fed", 20)
		meta:set_string("pwt", "source")
	end,
	on_rightclick = function()
		minetest.chat_send_all("Setting Voltage...")
	end,
	on_recieve_fields = function(pos, fields)
		minetest.chat_send_all("Recieved Fields...")
		local meta = minetest.get_meta(pos)
		meta:set_int("vlt", fields.vlts)
		meta:set_int("fed", 25)
		meta:set_string("pwt", "source")
		minetest.chat_send_all("Battery Voltage Set To " .. meta:get_int("vlt"))
	end
})

minetest.register_node("eln:light", {
	description = "Electrical Light",
	paramtype = "light",
	drawtype = "nodebox",
	walkable = true,
	climbable = false,
	sunlight_propagates = true,
	groups = {cracky=3},
	tiles = {
		"eln_light_unlit.png",
		"eln_light_unlit.png",
		"eln_light_unlit.png",
		"eln_light_unlit.png",
		"eln_light_unlit.png",
		"eln_light_unlit.png"
	},
	node_box = {
		type = "connected",
		fixed = {{-0.1875, -0.5, -0.1875, 0.1875, -0.4375, 0.1875}, {-0.0625, -0.5, -0.0625, 0.0625, -0.3125, 0.0625}, {-0.125, -0.3125, -0.125, 0.125, 0, 0.125}, },
		connect_front = {-0.0625, -0.5, -0.5, 0.0625, -0.4375, 0},
		connect_left = {-0.5, -0.5, -0.0625, 0, -0.4375, 0.0625}, --left
		connect_back = {-0.0625, -0.5, 0, 0.0625, -0.4375, 0.5},
		connect_right = {0, -0.5, -0.0625, 0.5, -0.4375, 0.0625}
	},
	connects_to = {"eln:wire", "eln:battery", "eln:switch", "eln:switch_on"},
	on_construct = function(pos)
		local timer = minetest.get_node_timer(pos)
		timer:start(0.1)
	end,
	on_timer = function(pos)
		pos1 = {x = pos.x + 1, y = pos.y, z = pos.z}
		pos2 = {x = pos.x - 1, y = pos.y, z = pos.z}
		pos3 = {x = pos.x, y = pos.y, z = pos.z + 1}
		pos4 = {x = pos.x, y = pos.y, z = pos.z - 1}
		positions = {pos1, pos2, pos3, pos4}
		poslen = #positions
		local highest_bidder = 0
		for posit=1, poslen do
			local meta = minetest.get_meta(positions[posit])
			local advlt = meta:get_int("vlt")
			if advlt > highest_bidder then
				highest_bidder = advlt
			end
		end
		if highest_bidder ~= nil and highest_bidder >= 5 then
			minetest.set_node(pos, {name = "eln:light_lit"})
		end
		return true
	end
})

minetest.register_node("eln:light_lit", {
	description = "Electrical Light (you hacker you!)",
	paramtype = "light",
	drawtype = "nodebox",
	walkable = true,
	climbable = false,
	sunlight_propagates = true,
	light_source = 14,
	groups = {cracky=3, not_in_creative_inventory=1},
	tiles = {
		"eln_light_lit.png",
		"eln_light_lit.png",
		"eln_light_lit.png",
		"eln_light_lit.png",
		"eln_light_lit.png",
		"eln_light_lit.png"
	},
	node_box = {
		type = "connected",
		fixed = {
			{-0.1875, -0.5, -0.1875, 0.1875, -0.4375, 0.1875}, -- NodeBox11
			{-0.0625, -0.5, -0.0625, 0.0625, -0.3125, 0.0625}, -- NodeBox12
			{-0.125, -0.3125, -0.125, 0.125, 0, 0.125}, -- NodeBox13
		},
		connect_front = {-0.0625, -0.5, -0.5, 0.0625, -0.4375, 0},
		connect_left = {-0.5, -0.5, -0.0625, 0, -0.4375, 0.0625}, --left
		connect_back = {-0.0625, -0.5, 0, 0.0625, -0.4375, 0.5},
		connect_right = {0, -0.5, -0.0625, 0.5, -0.4375, 0.0625}
	},
	connects_to = {"eln:wire", "eln:battery", "eln:switch", "eln:switch_on"},
	on_construct = function(pos)
		local timer = minetest.get_node_timer(pos)
		timer:start(0.1)
	end,
	on_timer = function(pos)
		pos1 = {x = pos.x + 1, y = pos.y, z = pos.z}
		pos2 = {x = pos.x - 1, y = pos.y, z = pos.z}
		pos3 = {x = pos.x, y = pos.y, z = pos.z + 1}
		pos4 = {x = pos.x, y = pos.y, z = pos.z - 1}
		positions = {pos1, pos2, pos3, pos4}
		poslen = #positions
		local highest_bidder = 0
		for posit=1, poslen do
			local meta = minetest.get_meta(positions[posit])
			local advlt = meta:get_int("vlt")
			if advlt > highest_bidder then
				highest_bidder = advlt
			end
		end
		if highest_bidder ~= nil and highest_bidder < 5 then
			minetest.set_node(pos, {name = "eln:light"})
		end
		return true
	end
})

minetest.register_node("eln:switch", {
	description = "Power Switch",
	paramtype = "light",
	drawtype = "nodebox",
	walkable = true,
	climbable = false,
	sunlight_propagates = true,
	groups = {cracky=3},
	tiles = {
		"eln_switch_on.png"
	},
	node_box = {
		type = "connected",
		fixed = {
			{-0.375, -0.5, -0.375, 0.375, -0.4375, 0.375}, -- base
			{-0.125, -0.5, -0.25, 0.125, -0.1875, 0}, -- switch_off
		},
		connect_front = {-0.0625, -0.5, -0.5, 0.0625, -0.4375, 0},
		connect_left = {-0.5, -0.5, -0.0625, 0, -0.4375, 0.0625}, --left
		connect_back = {-0.0625, -0.5, 0, 0.0625, -0.4375, 0.5},
		connect_right = {0, -0.5, -0.0625, 0.5, -0.4375, 0.0625}
	},
	connects_to = {"eln:wire", "eln:battery", "eln:light", "eln:light_lit", "eln:switch", "eln:switch_on"},
	on_rightclick = function(pos)
		minetest.set_node(pos, {name = "eln:switch_on"})
	end,
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_int("vlt", 0)
		meta:set_int("rst", 1)
		meta:set_int("crt", 0 / 1)
		meta:set_int("fed", 0)
	end
})

minetest.register_node("eln:switch_on", {
	description = "Power Switch (you hacker you!)",
	paramtype = "light",
	drawtype = "nodebox",
	walkable = true,
	climbable = false,
	sunlight_propagates = true,
	groups = {cracky=3, not_in_creative_inventory=1},
	tiles = {
		"eln_switch_on.png"
	},
	node_box = {
		type = "connected",
		fixed = {
			{-0.375, -0.5, -0.375, 0.375, -0.4375, 0.375}, -- base
			{-0.125, -0.5, 0, 0.125, -0.1875, 0.25}, -- switch_on
		},
		connect_front = {-0.0625, -0.5, -0.5, 0.0625, -0.4375, 0},
		connect_left = {-0.5, -0.5, -0.0625, 0, -0.4375, 0.0625}, --left
		connect_back = {-0.0625, -0.5, 0, 0.0625, -0.4375, 0.5},
		connect_right = {0, -0.5, -0.0625, 0.5, -0.4375, 0.0625}
	},
	connects_to = {"eln:wire", "eln:battery", "eln:light", "eln:light_lit", "eln:switch", "eln:switch_on"},
	on_rightclick = function(pos)
		minetest.set_node(pos, {name = "eln:switch"})
	end,
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_int("vlt", 0)
		meta:set_int("rst", 1)
		meta:set_int("crt", 0 / 1)
		meta:set_int("fed", 0)
		meta:set_string("pwt", "wire")
		local timer = minetest.get_node_timer(pos)
		timer:start(0.1)
	end,
	on_timer = function(pos)
		local pos1 = {x = pos.x + 1, y = pos.y, z = pos.z}
		local pos2 = {x = pos.x - 1, y = pos.y, z = pos.z}
		local pos3 = {x = pos.x, y = pos.y, z = pos.z + 1}
		local pos4 = {x = pos.x, y = pos.y, z = pos.z - 1}
		local positions = {pos1, pos2, pos3, pos4}
		local poslen = #positions
		local highest_bidder = 0
		local valid_source = false
		for posit=1, poslen do
			local meta = minetest.get_meta(positions[posit]) --get meta of nodes around node by faces
			local power_type = meta:get_string("pwt") --power type
			if power_type == "source" then --if power_type == "source" then
				local metap = minetest.get_meta(pos)
				local meta = minetest.get_meta(positions[posit])
				metap:set_string("prp", minetest.serialize(positions[posit])) -- store the position of power-source
				valid_source = true
				local advlt = meta:get_int("vlt")
				if advlt > highest_bidder then
					highest_bidder = advlt
				end
				break
			elseif power_type == "wire" then
				minetest.chat_send_all("found wire close by (checking)")
				local meta = minetest.get_meta(positions[posit]) --TODO if has valid power source
				local serf = meta:get_string("prp")
				if serf ~= nil and type(serf) == "string" then
					local src_ref = minetest.deserialize(serf)
					minetest.chat_send_all("found wire close by with src (checking)")
					if src_ref ~= nil and type(src_ref) == "table" then
						minetest.chat_send_all("found wire close by with good pos (checking)")
						local smeta = minetest.get_meta(src_ref)
						local powertype = smeta:get_string("pwt")
						if powertype == "source" then
							valid_source = true
							local advlt = smeta:get_int("vlt")
							if advlt > highest_bidder then
								highest_bidder = advlt
							end
							local metap = minetest.get_meta(pos)
							metap:set_string("prp", minetest.serialize(src_ref)) -- store the position of power-source
							minetest.chat_send_all("found legitamite source (setting)")
						end
					end
					break
				end
			else
				minetest.chat_send_all("No feed on wire " .. pos.x .. pos.y .. pos.z .. " (resetting)")
				local meta = minetest.get_meta(pos)
				meta:set_int("vlt", 0)
				meta:set_int("rst", 1)
				meta:set_int("crt", 0) --reset all variebles to 0 (off)
				meta:set_string("prp", "")
			end
		end
		local meta = minetest.get_meta(pos)
		if valid_source then  --if highest source number is greater than 1
			meta:set_int("vlt", highest_bidder)
			local vlt = meta:get_int("vlt")
			local rst = meta:get_int("rst")
			local crt = vlt / rst
			meta:set_int("crt", crt)
		else --no valid source
			meta:set_int("vlt", 0)
			meta:set_int("crt", 0)
		end
		return true
	end
})

minetest.register_node("eln:rubber_block", {
	description = "Rubber Block",
	paramtype = "light",
	tiles = {"eln_rubber_block.png"},
	walkable = true,
	climbable = false,
	sunlight_propagates = true,
	groups = {cracky=3, bouncy=1,},
})

minetest.register_node("eln:copper_block", {
	description = "Copper Block",
	paramtype = "light",
	tiles = {"eln_copper_block.png"},
	walkable = true,
	climbable = false,
	sunlight_propagates = true,
	groups = {cracky=3},
})

minetest.register_node("eln:collector", {
	description = "Resin Collector",
	paramtype = "light",
	tiles = {"eln_collector.png"},
	walkable = true,
	climbable = false,
	sunlight_propagates = true,
	groups = {cracky=3},
	paramtype2 = "wallmounted",
	drawtype = "nodebox",
	node_box = {
		type = "wallmounted",
		wall_bottom = {-0.25, -0.5, -0.33, 0.25, -0.125, 0.33},
		wall_side= {-0.5, -0.25, -0.33, -0.125, 0.25, 0.33},
		wall_top = {-0.25, 0.125, -0.33, 0.25, 0.5, 0.33}
	},
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(5, 10))
		local meta = minetest.get_meta(pos)
		meta:set_int("rlv", 0)
	end,
	on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
		if not (clicker and clicker:is_player()) then
			return -- right-clicked by a non-player
		end
		local meta = minetest.get_meta(pos)
		local reslev = meta:get_int("rlv")
		minetest.chat_send_all("Resin Level: " .. reslev)
		if reslev > 8 then
			local inv = clicker:get_inventory()
			inv:add_item("main", ItemStack({ name = "eln:resin", count = reslev }))
			if inv:contains_item("main", "eln:resin") then
				minetest.chat_send_all("resin in inventory")
			else
				minetest.chat_send_all("give failed")
			end
			meta:set_int("rlv", 0)
		end
	end,
	on_timer = function(pos)
		local meta = minetest.get_meta(pos)
		if math.random(1, 2) == 1 then
			local reslev = meta:get_int("rlv")
			meta:set_int("rlv", reslev + 1)
		end
		return true
	end
})

minetest.register_node("eln:auto_miner", {
	description = "Auto Miner",
	paramtype = "light",
	drawtype = "mesh",
	mesh = "eln_auto_miner.obj",
	walkable = true,
	climbable = false,
	sunlight_propagates = true,
	groups = {cracky=3},
	tiles = {
		"eln_auto_miner_side.png",
		"eln_auto_miner_dead.png",
		"eln_auto_miner_back.png",
		"eln_auto_miner_top.png",
		"eln_auto_miner_top.png",
		"eln_auto_miner_back.png"
	},
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", [[
			size[8, 8]
			anchor[0.5, 0.5]
			position[0.5, 0.5]
		]]) --TODO make inventory with slots for pipe and drill
	end
})

minetest.register_node("eln:stone_with_copper", {
	description = "Copper Ore",
	tiles = {"default_stone.png^default_mineral_copper.png"},
	groups = {cracky = 3},
	drop = 'eln:copper_lump',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("eln:stone_with_tungsten", {
	description = "Tungsten Ore",
	tiles = {"default_stone.png^default_mineral_tungsten.png"},
	groups = {cracky = 3},
	drop = 'eln:tungsten_lump',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("eln:stone_with_lead", {
	description = "Lead Ore",
	tiles = {"default_stone.png^default_mineral_lead.png"},
	groups = {cracky = 3},
	drop = 'eln:lead_lump',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("eln:stone_with_titanium", {
	description = "Titanium Ore",
	tiles = {"default_stone.png^default_mineral_titanium.png"},
	groups = {cracky = 3},
	drop = 'eln:titanium_lump',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_alias("moreores:copper_lump", "eln:copper_lump")
minetest.register_alias("moreores:copper_ingot", "eln:copper_ingot")
minetest.register_alias("moreores:copper_block", "eln:copper_block")
minetest.register_alias("group:wood", "eln:planks")

--[[
minetest.register_node("eln:collect0r", {
	description = "Resin Collecter",
	paramtype = "light",
	paramtype2 = "wallmounted",
	drawtype = "mesh",
	mesh = "collector.obj",
	walkable = true,
	climbable = false,
	sunlight_propagates = true,
	light_source = 14,
	groups = {cracky=3, not_in_creative_inventory=1},
	tiles = {
		"eln_collector.png",
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
			fakestack:set_name("eln:collector_ceiling")
		elseif wdir == 1 then
			fakestack:set_name("eln:collector")
		else
			fakestack:set_name("eln:collector_wall")
		end

		itemstack = minetest.item_place(fakestack, placer, pointed_thing, wdir)
		itemstack:set_name("eln:collector")

		return itemstack
	end
})

minetest.register_node("eln:collector_wall", {
	drawtype = "mesh",
	mesh = "collector.obj",
	tiles = {"eln_collector.png"},
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	light_source = 12,
	groups = {choppy=2, dig_immediate=3, flammable=1, not_in_creative_inventory=1, attached_node=1, redstone_torch=1},
	drop = "eln:collector",
	sounds = default.node_sound_wood_defaults()
})

minetest.register_lbm({
	name = "eln:3dcollector",
	nodenames = {"eln:collector", "eln_collectors:wall"},
	action = function(pos, node)
		if node.param2 ~= 1 then
			minetest.set_node(pos, {name = "redstone:redstone_torch_wall",
				param2 = node.param2})
		end
	end
})

]]--

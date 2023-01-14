-- items

--minetest.register_craftitem("redstone:steel_wire", {
--	description = "Spool of steel wire",
--	inventory_image = "redstone_steel_wire.png"
--})

--[[
minetest.register_craftitem("redstone:redstone_dust", {
	description = "Redstone Dust",
	inventory_image = "redstone_dust.png"
})
]]--

-- nodes

minetest.register_node("redstone:lever", {
	description = "Lever",
	drawtype = "mesh",
	mesh = "lever_floor.obj",
	tiles = {"lever.png"},
	walkable = true,
	climbable = false,
	sunlight_propagates = true,
	signal_source = false,
	paramtype = "light",
	inventory_image = "lever_inv.png",
	groups = {cracky=3},
	selection_box = rod2_sbox,
})

minetest.register_node("redstone:lever_on", {
	description = "Lever (on)",
	drawtype = "mesh",
	mesh = "lever_floor_on.obj",
	tiles = {"lever.png"},
	walkable = true,
	climbable = false,
	sunlight_propagates = true,
	signal_source = false,
	paramtype = "light",
	inventory_image = "lever_inv.png",
	groups = {cracky=3},
	selection_box = rod2_sbox,
})

minetest.register_node("redstone:redstone_dust", {
	description = "Redstone Dust",
	drawtype = "mesh",
	mesh = "redstone_dust2.obj",
	tiles = {"redstone_dust.png"},
	inventory_image = "redstone_dust_inv.png",
	walkable = false,
	climbable = false,
	sunlight_propagates = true,
	paramtype = "light",
	groups = {cracky=3},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.4, 0.5}
	},
})

minetest.register_node("redstone:redstone_dust_on", {
	description = "Redstone Dust On (you hacker you!)",
	drawtype = "mesh",
	mesh = "redstone_dust2.obj",
	tiles = {"redstone_dust_lit.png"},
	inventory_image = "redstone_dust_inv.png",
	walkable = false,
	climbable = false,
	sunlight_propagates = true,
	paramtype = "light",
	groups = {cracky=3, not_in_creative_inventory=1},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.4, 0.5}
	},
})

-- see 'topic 6692'

minetest.register_node("redstone:redstone_lamp_unlit", {
	description = "Redstone Lamp",
	tiles = {"redstone_lamp_unlit.png"},
	is_ground_content = false,
	signal_source = false,
	groups = {cracky=1, level=2},
	sounds = default.node_sound_glass_defaults(),
	after_place_node = function(posi)
		local timer = minetest.get_node_timer(posi)
		timer:start(1)
	end,
	on_timer = function(pos)
		if not pos == nil then
			minetest.chat_send_all("YesPos")
		else
			minetest.chat_send_all("NoPos")
		end
		minetest.chat_send_all("Hello there, I'm a redstone lamp!")
		local node_pos = minetest.find_node_near(pos, 1, { "redstone:redstone_dust_on" })
		if node_pos then
			minetest.chat_send_all("Hello there, I'm a lit redstone lamp!")
			minetest.swap_node({pos}, { name = "redstone:redstone_lamp_lit" })
		else
			local node_pos = minetest.find_node_near(pos, 1, { "redstone:redstone_torch" })
			if node_pos then
				minetest.swap_node({pos}, { name = "redstone:redstone_lamp_lit" })
				minetest.chat_send_all("Hello there, I'm a lit redstone lamp!")
			else
				local node_pos = minetest.find_node_near(pos, 1, { "redstone:redstone_block" })
				if node_pos then
					minetest.swap_node({pos}, { name = "redstone:redstone_lamp_lit" })
					minetest.chat_send_all("Hello there, I'm a lit redstone lamp!")
				else
					minetest.swap_node({pos}, { name = "redstone:redstone_lamp_unlit" })
					minetest.chat_send_all("Hello there, I'm a redstone lamp!")
				end
			end
		end
		return true
	end
})

minetest.register_node("redstone:redstone_lamp_lit", {
	description = "Redstone Lamp",
	tiles = { "redstone_lamp_lit.png" },
	is_ground_content = false,
	signal_source = false,
	light_source = 16,
	groups = {cracky=1, level=2, not_in_creative_iventory=1},
	sounds = default.node_sound_glass_defaults()
})

minetest.register_node("redstone:redstone_block", {
	description = "Redstone Block",
	tiles = { "redstone_block.png" },
	is_ground_content = false,
	signal_source = true,
	groups = {cracky=1, level=2},
	sounds = default.node_sound_metal_defaults()
})

-- crafts

minetest.register_craft( {
	output = "redstone:lever 2",
	recipe = {
		{ "", "default:stick", "" },
		{ "", "default:stick", "" },
		{ "", "default:stone", "" },
	},
})

minetest.register_craft( {
	output = "redstone:redstone_block",
	recipe = {
		{ "redstone:redstone_dust", "redstone:redstone_dust", "redstone:redstone_dust" },
		{ "redstone:redstone_dust", "redstone:redstone_dust", "redstone:redstone_dust" },
		{ "redstone:redstone_dust", "redstone:redstone_dust", "redstone:redstone_dust" },
	},
})

minetest.register_craft( {
	output = "redstone:redstone_lamp",
	recipe = {
		{ "default:glass", "default:glass", "default:glass" },
		{ "default:glass", "redstone:redstone_dust", "default:glass" },
		{ "default:glass", "default:glass", "default:glass" },
	},
})

minetest.register_craft( {
	output = "redstone:redstone_dust 9",
	recipe = {
		{ "", "redstone:redstone_block", "" },
	},
})

-- minetest.get_node(pos)
--[[
function redstone.register(name, def)
	local function redstone_lamp_light(pos)
		--change node to redstone_lamp_lit
		minetest.set_node(pos, "redstone:redstone_lamp_lit")
	end
	local function redstone_lamp_unlight(pos)
		--change node to redstone_lamp_lit
		minetest.set_node(pos, "redstone:redstone_lamp_unlit")
	end
	local function redstone_lamp.get(pos)
		local node_name = minetest.get_node(pos.x, pos.y + 1, pos.z).name
		-- If a 'lit redstone' node
		if node_name:find("redstone:") then
			if node_name == "redstone:redstone_torch" or node_name == "redstone:redstone_dust_on" or node_name == "redstone:lever_on" then
				--do something
				redstone_lamp.light()
			else
				--set lamp to unlit
				redstone_lamp.unlight
			end
		end
	end
	redstone_lamp()
end
]]--
-- aliases

--minetest.register_alias("homedecor:copper_wire",           "redstone:copper_wire")
--minetest.register_alias("technic:fine_copper_wire",        "redstone:copper_wire")
--minetest.register_alias("technic:fine_silver_wire",        "redstone:silver_wire")
--minetest.register_alias("technic:fine_gold_wire",          "redstonegold_wire")

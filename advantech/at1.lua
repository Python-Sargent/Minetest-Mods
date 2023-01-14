--items

advantech.at1.register_hammer = function(def)
	minetest.register_tool("advantech:" .. def.mat .. "_hammer", {
		description = def.dmat.." Hammer",
		inventory_image = def.imagename or "at1_"..def.mat.."_hammer.png",
		tool_capabilities = {
			full_punch_interval = 1.1,
			max_drop_level=1,
			groupcaps={
				cracky={times = def.times},
			},
			damage_groups = {fleshy=4},
		},
		sound = {breaks = "default_tool_breaks"},
		groups = {hammer = 1},
	})
	minetest.register_craft({
		output = "advantech:" .. def.mat .. "_hammer",
		recipe = {
			{def.matname, "default:stick", def.matname},
			{def.matname, "default:stick", def.matname},
			{"", "default:stick", ""},
		}	
	})
end

wood_def = {
	mat = "wood",
	dmat = "Wood",
	matname = "group:wood",
	times = {[3]=1.60},
}
advantech.at1.register_hammer(wood_def)

stone_def = {
	mat = "stone",
	dmat = "Stone",
	matname = "group:cobble",
	times = {[2]=2.0, [3]=1.00},
}
advantech.at1.register_hammer(stone_def)

steel_def = {
	mat = "steel",
	dmat = "Steel",
	matname = "default:steel_ingot",
	times = {[1]=4.00, [2]=1.60, [3]=0.80},
}
advantech.at1.register_hammer(steel_def)

bronze_def = {
	mat = "bronze",
	dmat = "Bronze",
	matname = "default:bronze_ingot",
	times = {[1]=4.50, [2]=1.80, [3]=0.90},
}
advantech.at1.register_hammer(bronze_def)

mese_def = {
	mat = "mese",
	dmat = "Mese",
	matname = "default:mese_cyrstal",
	times = {[1]=2.4, [2]=1.2, [3]=0.60},
}
advantech.at1.register_hammer(mese_def)

diamond_def = {
	mat = "diamond",
	dmat = "Diamond",
	matname = "default:diamond",
	times = {[1]=2.0, [2]=1.0, [3]=0.50},
}
advantech.at1.register_hammer(diamond_def)


minetest.register_craftitem("advantech:at1_bearing", {
	description = "AT1 Bearing",
	inventory_image = "at1_bearing.png"
})

minetest.register_craftitem("advantech:graphite", {
	description = "Graphite",
	inventory_image = "advantech_graphite.png"
})

-- crafts

minetest.clear_craft({output = "default:steel_ingot"})

minetest.register_craft({
	output = 'advantech:at1_water_wheel',
	recipe = {
		{'', 'group:wood', ''},
		{'group:wood', 'advantech:at1_bearing', 'group:wood'},
		{'', 'group:wood', ''},
	}
})

minetest.register_craft({
	output = 'advantech:at1_bearing 4',
	recipe = {
		{'', 'group:wood', ''},
		{'group:wood', 'advantech:graphite', 'group:wood'},
		{'', 'group:wood', ''},
	}
})

minetest.register_craft({
	output = 'advantech:at1_bearing 4',
	recipe = {
		{'', 'group:wood', ''},
		{'group:wood', 'advantech:graphite', 'group:wood'},
		{'', 'group:wood', ''},
	}
})

minetest.register_craft({
	output = 'advantech:graphite 2',
	recipe = {
		{'default:flint', 'advantech:wood_hammer',}
	},
	replacements = {{'advantech:wood_hammer', 'advantech:wood_hammer'}}
})

minetest.register_craft({
	output = 'advantech:graphite 2',
	recipe = {
		{'default:flint', 'advantech:stone_hammer',}
	},
	replacements = {{'advantech:stone_hammer', 'advantech:stone_hammer'}}
})

minetest.register_craft({
	output = 'advantech:graphite 2',
	recipe = {
		{'default:flint', 'advantech:steel_hammer',}
	},
	replacements = {{'advantech:steel_hammer', 'advantech:steel_hammer'}}
})

minetest.register_craft({
	output = 'advantech:graphite 2',
	recipe = {
		{'default:flint', 'advantech:mese_hammer',}
	},
	replacements = {{'advantech:mese_hammer', 'advantech:mese_hammer'}}
})

minetest.register_craft({
	output = 'advantech:graphite 2',
	recipe = {
		{'default:flint', 'advantech:diamond_hammer',}
	},
	replacements = {{'advantech:diamond_hammer', 'advantech:diamond_hammer'}}
})

minetest.register_craft({
	output = 'advantech:at1_axle_bearing 2',
	recipe = {
		{'default:stone_brick', 'default:stone_brick', 'default:stone_brick'},
		{'default:stone_brick', 'advantech:at1_bearing', 'default:stone_brick'},
		{'default:stone_brick', 'default:stone_brick', 'default:stone_brick'}
	}
})

minetest.register_craft({
	output = 'advantech:at1_axle 6',
	recipe = {
		{'default:steel', 'default:steel', 'default:steel'},
		{'advantech:at1_bearing', 'default:steel', 'advantech:at1_bearing'},
		{'default:steel', 'default:steel', 'default:steel'}
	}
})

minetest.register_craft({
	type = "cooking",
	cooktime = 20,
	output = "default:iron_ingot",
	recipe = "default:iron_lump"
})

advantech.register_craft({
	type = "melting",
	melttime = 20,
	output = "default:steel_ingot",
	recipe = "default:iron_lump"
})

advantech.register_craft({
	type = "melting",
	melttime = 15,
	output = "default:copper_ingot",
	recipe = "default:copper_lump"
})

advantech.register_craft({
	type = "melting",
	melttime = 15,
	output = "default:gold_ingot",
	recipe = "default:gold_lump"
})

advantech.register_craft({
	type = "melting",
	melttime = 20,
	output = "default:steel_ingot",
	recipe = "default:iron_lump"
})

advantech.register_craft({
	type = "milling",
	output = 'farming:flour',
	milltime = 15,
	recipe = 'farming:wheat'
})

advantech.register_craft({
	type = "milling",
	output = 'advantech:graphite',
	milltime = 15,
	recipe = 'default_flint'
})

--nodes

 --water wheel

minetest.register_node("advantech:at1_water_wheel", {
	description = "AT1 Water Wheel",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {
		{name = "at1_water_wheel.png"},
		{name = "at1_water_wheel.png"},
		{name = "at1_water_wheel_axle.png"},
		{name = "at1_water_wheel_axle.png"},
		{name = "at1_water_wheel.png"},
		{name = "at1_water_wheel.png"},
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.1875, -0.1875, 0.5, 0.1875, 0.1875}, -- core
			{-0.5, -1.375, -0.0625, 0.5, 1.375, 0.0625}, -- vert_padd
			{-0.5, -0.0625, -1.375, 0.5, 0.0625, 1.375}, -- hort_padd
		}
	},
	drawtype = "nodebox",
	walkable = true,
	climbable = true,
	sunlight_propagates = true,
	groups = {choppy=2},
	on_construct = function(pos)
		local timer = minetest.get_node_timer(pos)
		timer:start(0.1)
	end,
	on_timer = function(pos)
		local upos = {x=pos.x, y=pos.y - 1, z=pos.z}
		if minetest.get_node(upos).name == "default:water_flowing" then
			local nparam2 = minetest.get_node(pos).param2
			minetest.set_node(pos, {name = "advantech:at1_water_wheel_on", param2 = nparam2})
		end
		return true
	end,
})

minetest.register_node("advantech:at1_water_wheel_on", {
	description = "AT1 Water Wheel (you hacker you!)",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {
		{name = "at1_water_wheel.png",},
		{name = "at1_water_wheel.png",},
		{name = "at1_water_wheel_axle.png",},
		{name = "at1_water_wheel_axle.png",},
		{name = "at1_water_wheel.png",},
		{name = "at1_water_wheel.png",},
	},
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.1875, -0.1875, 0.5, 0.1875, 0.1875}, -- core
			{-0.5, -1.375, -0.0625, 0.5, 1.375, 0.0625}, -- vert_padd
			{-0.5, -0.0625, -1.375, 0.5, 0.0625, 1.375}, -- hort_padd
		}
	},
	walkable = false,
	pointable = false,
	climbable = true,
	sunlight_propagates = true,
	groups = {choppy=2, not_in_creative_inventory=1},
	on_construct = function(pos)
		local timer = minetest.get_node_timer(pos)
		timer:start(0.1)
	end,
	on_timer = function(pos)
		local upos = {x=pos.x, y=pos.y - 1, z=pos.z}
		if minetest.get_node(upos).name ~= "default:water_flowing" then
			local nparam2 = minetest.get_node(pos).param2
			minetest.set_node(pos, {name = "advantech:at1_water_wheel", param2 = nparam2})
		end
		return true
	end,
})

--axle

minetest.register_node("advantech:at1_axle", {
	description = "AT1 Axle",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {
		"at1_axle.png",
	},
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.125, -0.125, 0.5, 0.125, 0.125}, -- NodeBox6
		}
	},
	walkable = true,
	climbable = false,
	sunlight_propagates = true,
	groups = {cracky=3},
	on_construct = function(pos)
		local timer = minetest.get_node_timer(pos)
		timer:start(0.1)
	end,
	on_timer = function(pos)
		local facedir = minetest.get_node(pos).param2
		if facedir == nil then
			return true
		end
		local posb
		local posf
		if facedir == 0 or facedir == 2 then
			posb = {x=pos.x - 1, y=pos.y, z=pos.z}
			posf = {x=pos.x + 1, y=pos.y, z=pos.z}
		elseif facedir == 1 or facedir == 3 then
			posb = {x=pos.x, y=pos.y, z=pos.z - 1}
			posf = {x=pos.x, y=pos.y, z=pos.z + 1}
		end
		if minetest.get_node(posb).name == "advantech:at1_axle_bearing_on" or
			minetest.get_node(posf).name == "advantech:at1_axle_bearing_on" then
			minetest.set_node(pos, {name = "advantech:at1_axle_on", param2 = facedir})
		end
		return true
	end,
})

minetest.register_node("advantech:at1_axle_on", {
	description = "AT1 Axle On (you hacker you!)",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {
		"at1_axle.png",
	},
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.125, -0.125, 0.5, 0.125, 0.125}, -- NodeBox6
		}
	},
	walkable = true,
	climbable = false,
	sunlight_propagates = true,
	groups = {cracky=1, not_in_creative_inventory=1},
	on_construct = function(pos)
		local timer = minetest.get_node_timer(pos)
		timer:start(0.1)
	end,
	on_timer = function(pos)
		local facedir = minetest.get_node(pos).param2
		if facedir == nil then
			return true
		end
		local posb
		local posf
		if facedir == 0 or facedir == 2 then
			posb = {x=pos.x - 1, y=pos.y, z=pos.z}
			posf = {x=pos.x + 1, y=pos.y, z=pos.z}
		elseif facedir == 1 or facedir == 3 then
			posb = {x=pos.x, y=pos.y, z=pos.z - 1}
			posf = {x=pos.x, y=pos.y, z=pos.z + 1}
		end
		if minetest.get_node(posb).name ~= "advantech:at1_axle_bearing_on" and
			minetest.get_node(posf).name ~= "advantech:at1_axle_bearing_on" then
			minetest.set_node(pos, {name = "advantech:at1_axle", param2 = facedir})
		end
		return true
	end,
})

--axle bearing

minetest.register_node("advantech:at1_axle_bearing", {
	description = "AT1 Axle Bearing",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {
		{name = "at1_axle_bearing.png",},
		{name = "at1_axle_bearing.png",},
		{name = "at1_axle_bearing_side_bearing.png",},
		{name = "at1_axle_bearing_side_bearing.png",},
		{name = "at1_axle_bearing.png",},
		{name = "at1_axle_bearing.png",},
	},
	drawtype = "normal",
	walkable = true,
	climbable = false,
	sunlight_propagates = true,
	groups = {cracky=2},
	on_construct = function(pos)
		local timer = minetest.get_node_timer(pos)
		timer:start(0.1)
	end,
	on_timer = function(pos)
		local facedir = minetest.get_node(pos).param2
		if facedir == nil then
			return true
		end
		local posb
		local posf
		if facedir == 0 or facedir == 2 then
			posb = {x=pos.x - 1, y=pos.y, z=pos.z}
			posf = {x=pos.x + 1, y=pos.y, z=pos.z}
		elseif facedir == 1 or facedir == 3 then
			posb = {x=pos.x, y=pos.y, z=pos.z - 1}
			posf = {x=pos.x, y=pos.y, z=pos.z + 1}
		end
		if minetest.get_node(posb).name == "advantech:at1_water_wheel_on" or 
			minetest.get_node(posf).name == "advantech:at1_water_wheel_on" then
			minetest.set_node(pos, {name = "advantech:at1_axle_bearing_on", param2 = facedir})
		end
		return true
	end,
})

minetest.register_node("advantech:at1_axle_bearing_on", {
	description = "AT1 Axle Bearing (you hacker you!)",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {
		{name = "at1_axle_bearing.png",},
		{name = "at1_axle_bearing.png",},
		{name = "at1_axle_bearing_side_bearing.png",},
		{name = "at1_axle_bearing_side_bearing.png",},
		{name = "at1_axle_bearing.png",},
		{name = "at1_axle_bearing.png",},
	},
	drawtype = "normal",
	walkable = true,
	climbable = false,
	sunlight_propagates = true,
	groups = {cracky=1, not_in_creative_inventory=1},
	on_construct = function(pos)
		local timer = minetest.get_node_timer(pos)
		timer:start(0.1)
	end,
	on_timer = function(pos)
		local facedir = minetest.get_node(pos).param2
		if facedir == nil then
			return true
		end
		local posb
		local posf
		if facedir == 0 or facedir == 2 then
			posb = {x=pos.x - 1, y=pos.y, z=pos.z}
			posf = {x=pos.x + 1, y=pos.y, z=pos.z}
		elseif facedir == 1 or facedir == 3 then
			posb = {x=pos.x, y=pos.y, z=pos.z - 1}
			posf = {x=pos.x, y=pos.y, z=pos.z + 1}
		end
		if minetest.get_node(posb).name ~= "advantech:at1_water_wheel_on" and
			minetest.get_node(posf).name ~= "advantech:at1_water_wheel_on" then
			minetest.set_node(pos, {name = "advantech:at1_axle_bearing", param2 = facedir})
		end
		return true
	end,
})

--charcoal burner bottom

--
-- Formspecs
--

local function active_formspec_b(fuel_percent)
	local formspec =
		"size[8,8.5]"..
		default.gui_bg..
		default.gui_bg_img..
		default.gui_slots..
		"list[current_name;fuel;2.75,2.5;1,1;]"..
		"image[2.75,1.5;1,1;default_furnace_fire_bg.png^[lowpart:"..
		(100-fuel_percent)..":default_furnace_fire_fg.png]"..
		"list[current_player;main;0,4.25;8,1;]"..
		"list[current_player;main;0,5.5;8,3;8]"..
		"listring[current_name;fuel]"..
		"listring[current_player;main]"..
		default.get_hotbar_bg(0, 4.25)
	return formspec
end

local inactive_formspec_b =
	"size[8,8.5]"..
	default.gui_bg..
	default.gui_bg_img..
	default.gui_slots..
	"list[current_name;fuel;2.75,2.5;1,1;]"..
	"image[2.75,1.5;1,1;default_furnace_fire_bg.png]"..
	"list[current_player;main;0,4.25;8,1;]"..
	"list[current_player;main;0,5.5;8,3;8]"..
	"listring[current_name;fuel]"..
	"listring[current_player;main]"..
	default.get_hotbar_bg(0, 4.25)

--
-- Node callback functions that are the same for active and inactive furnace
--

local function can_dig_b(pos, player)
	local meta = minetest.get_meta(pos);
	local inv = meta:get_inventory()
	return inv:is_empty("fuel")
end

local function allow_metadata_inventory_put_b(pos, listname, index, stack, player)
	if minetest.is_protected(pos, player:get_player_name()) then
		return 0
	end
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	if listname == "fuel" then
		if minetest.get_craft_result({method="fuel", width=1, items={stack}}).time ~= 0 then
			return stack:get_count()
		else
			return 0
		end
	end
end

local function allow_metadata_inventory_move_b(pos, from_list, from_index, to_list, to_index, count, player)
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	local stack = inv:get_stack(from_list, from_index)
	return allow_metadata_inventory_put(pos, to_list, to_index, stack, player)
end

local function allow_metadata_inventory_take_b(pos, listname, index, stack, player)
	if minetest.is_protected(pos, player:get_player_name()) then
		return 0
	end
	return stack:get_count()
end

local function swap_node(pos, name)
	local node = minetest.get_node(pos)
	if node.name == name then
		return
	end
	node.name = name
	minetest.swap_node(pos, node)
end

local function burner_node_timer_b(pos, elapsed)
	--
	-- Inizialize metadata
	--
	local meta = minetest.get_meta(pos)
	local fuel_time = meta:get_float("fuel_time") or 0
	local fuel_totaltime = meta:get_float("fuel_totaltime") or 0

	local inv = meta:get_inventory()
	local fuellist =  inv:get_list("fuel")

	local fuel

	local update = true
	while elapsed > 0 and update do
		update = false

		fuellist = inv:get_list("fuel")
		
		local el = math.min(elapsed, fuel_totaltime - fuel_time)
		
		-- Check if we have enough fuel to burn
		if fuel_time < fuel_totaltime then
			-- The furnace is currently active and has enough fuel
			fuel_time = fuel_time + el
		else
			-- Furnace ran out of fuel
			-- We need to get new fuel
			local afterfuel
			fuel, afterfuel = minetest.get_craft_result({method = "fuel", width = 1, items = fuellist})

			if fuel.time == 0 then
				-- No valid fuel in fuel list
				fuel_totaltime = 0
			else
				-- Take fuel from fuel list
				inv:set_stack("fuel", 1, afterfuel.items[1])
				update = true
				fuel_totaltime = fuel.time + (fuel_totaltime - fuel_time)
			end
		end
		fuel_time = 0
		elapsed = elapsed - el
	end

	if fuel and fuel_totaltime > fuel.time then
		fuel_totaltime = fuel.time
	end

	--
	-- Update formspec, infotext and node
	--
	local formspec = inactive_formspec_b

	local fuel_state = "Empty"
	local active = "inactive "
	local result = false

	if fuel_totaltime ~= 0 then
		active = "active "
		local fuel_percent = math.floor(fuel_time / fuel_totaltime * 100)
		fuel_state = fuel_percent .. "%"
		formspec = active_formspec_b(fuel_percent)
		swap_node(pos, "advantech:at1_charcoal_burner_bottom_on")
		-- make sure timer restarts automatically
		result = true
	else
		if not fuellist[1]:is_empty() then
			fuel_state = "0%"
		end
		swap_node(pos, "advantech:at1_charcoal_burner_bottom")
		-- stop timer on the inactive furnace
		minetest.get_node_timer(pos):stop()
	end

	local infotext = "Furnace " .. active .. "(Fuel: " .. fuel_state .. ")"

	--
	-- Set meta values
	--
	meta:set_float("fuel_totaltime", fuel_totaltime)
	meta:set_float("fuel_time", fuel_time)
	meta:set_string("formspec", formspec)
	meta:set_string("infotext", infotext)

	return result
end

minetest.register_node("advantech:at1_charcoal_burner_bottom", {
	description = "AT1 Charcoal Burner Bottom",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {
		{name = "at1_charcoal_burner_b_top.png",}, --top
		{name = "at1_charcoal_burner_b_side.png",}, --bottom
		{name = "at1_charcoal_burner_b_side.png",}, --front
		{name = "at1_charcoal_burner_b_side.png",}, --back
		{name = "at1_charcoal_burner_b_side.png",}, --right
		{name = "at1_charcoal_burner_b_front.png",}, --left
	},
	drawtype = "normal",
	walkable = true,
	climbable = false,
	sunlight_propagates = true,
	groups = {cracky=2,},
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),

	can_dig = can_dig_b,

	on_timer = burner_node_timer_b,

	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", inactive_formspec_b)
		local inv = meta:get_inventory()
		inv:set_size('fuel', 1)
	end,

	on_metadata_inventory_move = function(pos)
		minetest.get_node_timer(pos):start(1.0)
	end,
	on_metadata_inventory_put = function(pos)
		-- start timer function, it will sort out whether furnace can burn or not.
		minetest.get_node_timer(pos):start(1.0)
	end,
	on_blast = function(pos)
		local drops = {}
		default.get_inventory_drops(pos, "fuel", drops)
		drops[#drops+1] = "default:furnace"
		minetest.remove_node(pos)
		return drops
	end,

	allow_metadata_inventory_put = allow_metadata_inventory_put_b,
	allow_metadata_inventory_move = allow_metadata_inventory_move_b,
	allow_metadata_inventory_take = allow_metadata_inventory_take_b,
})

minetest.register_node("advantech:at1_charcoal_burner_bottom_on", {
	description = "AT1 Charcoal Burner Bottom (you hacker you!)",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {
		{name = "at1_charcoal_burner_b_top.png",}, --'top' [turned 90* to the right] (top) {texture rotated}
		{name = "at1_charcoal_burner_b_side.png",}, --'bottom' [turned 90* to the right] (bottom) {texture rotated}
		{name = "at1_charcoal_burner_b_side.png",}, --'front' [turned 90* to the right] (right) {face rotated}
		{name = "at1_charcoal_burner_b_side.png",}, --'back' [turned 90* to the right] (left) {face rotated}
		{name = "at1_charcoal_burner_b_side.png",}, --'right' [turned 90* to the right] (back) {face rotated}
		{name = "at1_charcoal_burner_b_front_on.png",}, --'left' [turned 90* to the right] (front) {face rotated}
	},
	drawtype = "normal",
	walkable = true,
	climbable = false,
	light_source = 10,
	sunlight_propagates = true,
	groups = {cracky=2, not_in_creative_inventory=1,},
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
	on_timer = burner_node_timer_b,

	can_dig = can_dig_b,

	allow_metadata_inventory_put = allow_metadata_inventory_put_b,
	allow_metadata_inventory_move = allow_metadata_inventory_move_b,
	allow_metadata_inventory_take = allow_metadata_inventory_take_b,
})

--

--
-- Formspecs
--

local function active_formspec(item_percent)
	local formspec =
		"size[8,8.5]"..
		default.gui_bg..
		default.gui_bg_img..
		default.gui_slots..
		"list[current_name;src;2.75,0.5;1,1;]"..
		"image[3.75,1.5;1,1;gui_furnace_arrow_bg.png^[lowpart:"..
		(item_percent)..":gui_furnace_arrow_fg.png^[transformR270]"..
		"list[current_name;dst;4.75,0.96;2,2;]"..
		"list[current_player;main;0,4.25;8,1;]"..
		"list[current_player;main;0,5.5;8,3;8]"..
		"listring[current_name;dst]"..
		"listring[current_player;main]"..
		"listring[current_name;src]"..
		"listring[current_player;main]"..
		default.get_hotbar_bg(0, 4.25)
	return formspec
end

local inactive_formspec =
	"size[8,8.5]"..
	default.gui_bg..
	default.gui_bg_img..
	default.gui_slots..
	"list[current_name;src;2.75,0.5;1,1;]"..
	"image[3.75,1.5;1,1;gui_furnace_arrow_bg.png^[transformR270]"..
	"list[current_name;dst;4.75,0.96;2,2;]"..
	"list[current_player;main;0,4.25;8,1;]"..
	"list[current_player;main;0,5.5;8,3;8]"..
	"listring[current_name;dst]"..
	"listring[current_player;main]"..
	"listring[current_name;src]"..
	"listring[current_player;main]"..
	default.get_hotbar_bg(0, 4.25)

--
-- Node callback functions that are the same for active and inactive furnace
--

local function can_dig(pos, player)
	local meta = minetest.get_meta(pos);
	local inv = meta:get_inventory()
	return inv:is_empty("dst") and inv:is_empty("src")
end

local function allow_metadata_inventory_put(pos, listname, index, stack, player)
	if minetest.is_protected(pos, player:get_player_name()) then
		return 0
	end
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	if listname == "src" then
		return stack:get_count()
	elseif listname == "dst" then
		return 0
	end
end

local function allow_metadata_inventory_move(pos, from_list, from_index, to_list, to_index, count, player)
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	local stack = inv:get_stack(from_list, from_index)
	return allow_metadata_inventory_put(pos, to_list, to_index, stack, player)
end

local function allow_metadata_inventory_take(pos, listname, index, stack, player)
	if minetest.is_protected(pos, player:get_player_name()) then
		return 0
	end
	return stack:get_count()
end

local function swap_node(pos, name)
	local node = minetest.get_node(pos)
	if node.name == name then
		return
	end
	node.name = name
	minetest.swap_node(pos, node)
end

local function burner_node_timer(pos, elapsed)
	--
	-- Initzialize metadata
	--
	local meta = minetest.get_meta(pos)
	local src_time = meta:get_float("src_time") or 0

	local inv = meta:get_inventory()
	local srclist

	local cookable, cooked

	local update = true
	local is_on
	if minetest.get_node({x = pos.x, y = pos.y - 1, z = pos.z}).name == "advantech:at1_charcoal_burner_bottom_on" then
			is_on = true
		else
			is_on = false
	end
	while elapsed > 0 and update do
		update = false

		srclist = inv:get_list("src")

		--
		-- Cooking
		--

		-- Check if we have cookable content
		local aftercooked
		cooked, aftercooked = advantech.get_craft_result({method = "melting", width = 1, items = srclist})
		if cooked ~= nil and cooked.time ~= 0 then
			cookable = true
		else
			print("[ERROR]Advantech: 'Cooked' is not defined")
		end

		local el = elapsed
		if cookable then -- fuel lasts long enough, adjust el to cooking duration
			el = math.min(el, cooked.time - src_time)
		end

		-- Check if burner is burning
		if is_on then -- else furnace burner is out of fuel
			-- If there is a cookable item then check if it is ready yet
			if cookable then
				src_time = src_time + el
				if src_time >= cooked.time then
					-- Place result in dst list if possible
					if inv:room_for_item("dst", cooked.item) then
						inv:add_item("dst", cooked.item)
						inv:set_stack("src", 1, aftercooked.items[1])
						src_time = src_time - cooked.time
						update = true
					end
				else
					-- Item could not be cooked: probably missing fuel
					update = true
				end
			end
		else
			swap_node(pos, "advantech:at1_charcoal_burner_top")
			-- stop timer on the inactive furnace
			minetest.get_node_timer(pos):stop()
		end

		elapsed = elapsed - el
	end
	if srclist[1]:is_empty() then
		src_time = 0
	end

	--
	-- Update formspec, infotext and node
	--
	local formspec = inactive_formspec
	local item_state
	local item_percent = 0
	local active = "inactive "
	local result = false
	if cookable then
		item_percent = math.floor(src_time / cooked.time * 100)
		if item_percent > 100 then
			item_state = "100% (output full)"
		else
			item_state = item_percent .. "%"
		end
		active = "active"
		result = true
	else
		if srclist[1]:is_empty() then
			item_state = "Empty"
		else
			item_state = "Not cookable"
		end
	end

	local infotext = "Burner " .. active .. "(Item: " .. item_state .. ")"

	--
	-- Set meta values
	--

	meta:set_float("src_time", src_time)
	meta:set_string("formspec", formspec)
	meta:set_string("infotext", infotext)

	return result
end

--
-- Node definitions
--

minetest.register_node("advantech:at1_charcoal_burner_top", {
	description = "AT1 Charcoal Burner Top",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {
		{name = "at1_charcoal_burner_b_side.png",},
		{name = "at1_charcoal_burner_b_top.png",},
		{name = "at1_charcoal_burner_b_side.png",},
		{name = "at1_charcoal_burner_b_side.png",},
		{name = "at1_charcoal_burner_b_side.png",},
		{name = "at1_charcoal_burner_t_front.png",},
	},
	drawtype = "normal",
	walkable = true,
	climbable = false,
	sunlight_propagates = true,
	groups = {cracky=2},
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
	can_dig = can_dig,

	on_timer = burner_node_timer,

	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", inactive_formspec)
		local inv = meta:get_inventory()
		inv:set_size('src', 1)
		inv:set_size('dst', 4)
	end,

	on_metadata_inventory_move = function(pos)
		minetest.get_node_timer(pos):start(1.0)
	end,
	on_metadata_inventory_put = function(pos)
		-- start timer function, it will sort out whether furnace can burn or not.
		minetest.get_node_timer(pos):start(1.0)
	end,
	on_blast = function(pos)
		local drops = {}
		default.get_inventory_drops(pos, "src", drops)
		default.get_inventory_drops(pos, "dst", drops)
		drops[#drops+1] = "advantech:at1_charcoal_burner_top"
		minetest.remove_node(pos)
		return drops
	end,

	allow_metadata_inventory_put = allow_metadata_inventory_put,
	allow_metadata_inventory_move = allow_metadata_inventory_move,
	allow_metadata_inventory_take = allow_metadata_inventory_take,
})

minetest.register_node("advantech:at1_charcoal_burner_top_on", {
	description = "AT1 Charcoal Burner Top On (you hacker you!)",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {
		{name = "at1_charcoal_burner_b_side.png",},
		{name = "at1_charcoal_burner_b_top.png",},
		{name = "at1_charcoal_burner_b_side.png",},
		{name = "at1_charcoal_burner_b_side.png",},
		{name = "at1_charcoal_burner_b_side.png",},
		{name = "at1_charcoal_burner_t_front.png",},
	},
	drawtype = "normal",
	walkable = true,
	climbable = false,
	sunlight_propagates = true,
	light_source = 8,
	groups = {cracky=2, not_in_creative_inventory=1,},
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
	on_timer = burner_node_timer,

	can_dig = can_dig,

	allow_metadata_inventory_put = allow_metadata_inventory_put,
	allow_metadata_inventory_move = allow_metadata_inventory_move,
	allow_metadata_inventory_take = allow_metadata_inventory_take,
})


--
-- Formspecs
--

local function active_formspec(item_percent)
	local formspec =
		"size[8,8.5]"..
		default.gui_bg..
		default.gui_bg_img..
		default.gui_slots..
		"list[current_name;src;2.75,0.96;1,1;]"..
		"image[3.75,1.5;1,1;gui_furnace_arrow_bg.png^[lowpart:"..
		(item_percent)..":gui_furnace_arrow_fg.png^[transformR270]"..
		"list[current_name;dst;4.75,0.96;2,2;]"..
		"list[current_player;main;0,4.25;8,1;]"..
		"list[current_player;main;0,5.5;8,3;8]"..
		"listring[current_name;dst]"..
		"listring[current_player;main]"..
		"listring[current_name;src]"..
		"listring[current_player;main]"..
		default.get_hotbar_bg(0, 4.25)
	return formspec
end

local inactive_formspec =
	"size[8,8.5]"..
	default.gui_bg..
	default.gui_bg_img..
	default.gui_slots..
	"list[current_name;src;2.75,0.96;1,1;]"..
	"image[3.75,1.5;1,1;gui_furnace_arrow_bg.png^[transformR270]"..
	"list[current_name;dst;4.75,0.96;2,2;]"..
	"list[current_player;main;0,4.25;8,1;]"..
	"list[current_player;main;0,5.5;8,3;8]"..
	"listring[current_name;dst]"..
	"listring[current_player;main]"..
	"listring[current_name;src]"..
	"listring[current_player;main]"..
	default.get_hotbar_bg(0, 4.25)

--
-- Node callback functions that are the same for active and inactive mill
--

local function can_dig(pos, player)
	local meta = minetest.get_meta(pos);
	local inv = meta:get_inventory()
	return inv:is_empty("dst") and inv:is_empty("src")
end

local function allow_metadata_inventory_put(pos, listname, index, stack, player)
	if minetest.is_protected(pos, player:get_player_name()) then
		return 0
	end
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	if listname == "src" then
		return stack:get_count()
	elseif listname == "dst" then
		return 0
	end
end

local function allow_metadata_inventory_move(pos, from_list, from_index, to_list, to_index, count, player)
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	local stack = inv:get_stack(from_list, from_index)
	return allow_metadata_inventory_put(pos, to_list, to_index, stack, player)
end

local function allow_metadata_inventory_take(pos, listname, index, stack, player)
	if minetest.is_protected(pos, player:get_player_name()) then
		return 0
	end
	return stack:get_count()
end

local function swap_node(pos, name)
	local node = minetest.get_node(pos)
	if node.name == name then
		return
	end
	node.name = name
	minetest.swap_node(pos, node)
end

local function mill_node_timer(pos, elapsed)
	--
	-- Initzialize metadata
	--
	local meta = minetest.get_meta(pos)
	local src_time = meta:get_float("src_time") or 0

	local inv = meta:get_inventory()
	local srclist

	local millable, milled
	
	local facedir = minetest.get_node(pos).param2
	if facedir == nil then
		return true
	end
	local posb
	local posf
	if facedir == 0 or facedir == 2 then
		posb = {x=pos.x - 1, y=pos.y, z=pos.z}
		posf = {x=pos.x + 1, y=pos.y, z=pos.z}
	elseif facedir == 1 or facedir == 3 then
		posb = {x=pos.x, y=pos.y, z=pos.z - 1}
		posf = {x=pos.x, y=pos.y, z=pos.z + 1}
	end
	
	local powered = false	
	
	local update = true
	while elapsed > 0 and update do
		
		if minetest.get_node(posb).name == "advantech:at1_axle_on" or minetest.get_node(posf).name == "advantech:at1_axle_on" then
			powered = true
		else
			powered = false
		end
		
		update = false

		srclist = inv:get_list("src")

		--
		-- Milling
		--

		-- Check if we have millable content
		local aftermilled
		milled, aftermilled = advantech.get_craft_result({method = "milling", width = 1, items = srclist})
		if milled ~= nil and milled.time ~= 0 then
			millable = true
		else
			print("[ERROR]Advantech: node 'at1_mill' failed: bad craft_result method")
		end
		
		local el = elapsed
		if millable then -- el = milling duration
			el = math.min(el, milled.time - src_time)
		end

		if millable and powered then
			src_time = src_time + el
			if src_time >= milled.time then
				-- Place result in dst list if possible
				if inv:room_for_item("dst", milled.item) then
					inv:add_item("dst", milled.item)
					inv:set_stack("src", 1, aftermilled.items[1])
					src_time = src_time - milled.time
					update = true
				end
			else
				-- Item could not be milled: probably not powered
				update = true
			end
		end
		elapsed = elapsed - el
	end

	if srclist[1]:is_empty() then
		src_time = 0
	end

	--
	-- Update formspec, infotext and node
	--
	local formspec = inactive_formspec
	local item_state
	local item_percent = 0
	if millable then
		formspec = active_formspec(fuel_percent, item_percent)
		swap_node(pos, "advantech:at1_mill_on")
		item_percent = math.floor(src_time / milled.time * 100)
		if item_percent > 100 then
			item_state = "100% (output full)"
		else
			item_state = item_percent .. "%"
		end
	else
		swap_node(pos, "advantech:at1_mill")
		if srclist[1]:is_empty() then
			item_state = "Empty"
		else
			item_state = "Not millable"
		end
	end

	local active = "inactive "
	local result = false

	local infotext = "Furnace " .. active .. "(Item: " .. item_state .. ")"

	--
	-- Set meta values
	--
	meta:set_float("src_time", src_time)
	meta:set_string("formspec", formspec)
	meta:set_string("infotext", infotext)

	return result
end

--
-- Node definitions
--

minetest.register_node("advantech:at1_mill", {
	description = "AT1 Grinding Mill",
	tiles = {
		"at1_mill_top.png", "at1_mill_bottom.png",
		"at1_mill_side.png", "at1_mill_side.png",
		"at1_mill_side.png", "at1_mill_side.png"
	},
	paramtype2 = "facedir",
	groups = {cracky=2},
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),

	can_dig = can_dig,

	on_timer = mill_node_timer,

	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", inactive_formspec)
		local inv = meta:get_inventory()
		inv:set_size('src', 1)
		inv:set_size('dst', 4)
	end,

	on_metadata_inventory_move = function(pos)
		minetest.get_node_timer(pos):start(1.0)
	end,
	on_metadata_inventory_put = function(pos)
		-- start timer function, it will sort out whether mill can burn or not.
		minetest.get_node_timer(pos):start(1.0)
	end,
	on_blast = function(pos)
		local drops = {}
		default.get_inventory_drops(pos, "src", drops)
		default.get_inventory_drops(pos, "dst", drops)
		drops[#drops+1] = "advantech:at1_mill"
		minetest.remove_node(pos)
		return drops
	end,

	allow_metadata_inventory_put = allow_metadata_inventory_put,
	allow_metadata_inventory_move = allow_metadata_inventory_move,
	allow_metadata_inventory_take = allow_metadata_inventory_take,
})

minetest.register_node("advantech:at1_mill_on", {
	description = "AT1 Grinding Mill",
	tiles = {
		"at1_mill_top.png", "at1_mill_bottom.png",
		"at1_mill_side.png", "at1_mill_side.png",
		"at1_mill_side.png", "at1_mill_side.png",
	},
	paramtype2 = "facedir",
	drop = "advantech:at1_mill",
	groups = {cracky=2, not_in_creative_inventory=1},
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
	on_timer = mill_node_timer,

	can_dig = can_dig,

	allow_metadata_inventory_put = allow_metadata_inventory_put,
	allow_metadata_inventory_move = allow_metadata_inventory_move,
	allow_metadata_inventory_take = allow_metadata_inventory_take,
})



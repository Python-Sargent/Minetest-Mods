minetest.register_node("teleporter:teleporter", {
	description = "Teleporter",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {
		{name = "teleporter_top.png",},
		{name = "teleporter_top.png",},
		{name = "teleporter_side.png",},
		{name = "teleporter_side.png",},
		{name = "teleporter_side.png",},
		{name = "teleporter_side.png",},
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0.4375, 0.5, 0.5, 0.5},
			{-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5},
			{0.4375, -0.5, -0.5, 0.5, 0.5, 0.5},
			{-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
		}
	},
	drawtype = "nodebox",
	walkable = true,
	climbable = false,
	sunlight_propagates = true,
	groups = {cracky=2},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0.4375, 0.5, 1.5, 0.5},
			{-0.5, -0.5, -0.5, -0.4375, 1.5, 0.5},
			{-0.5, 1.4375, -0.5, 0.5, 1.5, 0.5},
			{0.4375, -0.5, -0.5, 0.5, 1.5, 0.5},
			{-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
		}
	},
	on_construct = function(pos)
		local node = minetest.get_node(pos)
		local facedir = node.param2
		minetest.set_node({x = pos.x, y = pos.y + 1, z = pos.z}, {name="teleporter:teleporter_top", param2 = facedir})
		local meta = minetest.get_meta(pos)
		meta:set_string("infotext", "unnamed")
		meta:set_string("tname", "unnamed")
		meta:set_int("stage", 1)
		meta:set_string("formspec", "size[5,5]anchor[0.5,0.5]label[0,0;Teleporter]field[0,1;5,1;name;Teleporter Name;name]button[0,1;2,1;set;Set Name]button_exit[3,1;2,1;cancel;Cancel]")
	end,
	on_receive_fields = function(pos, formname, fields, player)
		if fields.quit and fields.name == nil or fields.cancel then
			return
		end
		local meta = minetest.get_meta(pos)
		if meta:get_int("stage") == 1 then
			if fields.name ~= nil then
				minetest.chat_send_all("setting name: " .. tostring(fields.name))
				teleporter.teleporters[tostring(fields.name)] = {pos=pos, name=tostring(fields.name)}
				meta:set_string("infotext", tostring(fields.name))
				meta:set_string("tname", tostring(fields.name))
			end
			formspec = "size[6,8]anchor[0.5,0.5]label[0,0;Teleporter]button[3,0;2,1;refresh;Refresh]scrollbar[5.7,0;0.3,8;vertical;dests;0.1]scroll_container[0, 0;4, 6;dests;vertical;0.1]"
			local i = 0
			for j, tp in pairs(teleporter.teleporters) do
				i = i + 1
				minetest.chat_send_all("list teleporter " .. tostring(tp.name))
				minetest.chat_send_all("adding teleporter: " .. tostring(tp.name) .. " to list")
				button = "button[0, " .. i .. ";5, 1;" .. tostring(tp.name) .. ";" .. tostring(tp.name) .. "]"
				formspec = formspec .. button
			end
			formspec = formspec .. "scroll_container_end[]"
			minetest.chat_send_all("finished editing formspec: \n" .. tostring(formspec))
			meta:set_string("formspec", formspec)
			meta:set_int("stage", 3)
		elseif meta:get_int("stage") == 3 then
			if fields.refresh ~= nil then
				meta:set_int("stage", 2)
			end
			-- start of questionable code
			for i, tp in pairs(teleporter.teleporters) do
				minetest.chat_send_all("checking button: " .. tostring(tp.name))
				if fields[tp.name] ~= nil then
					local closest_d = 999
					local closest_name

					for i, obj in ipairs(minetest.get_objects_inside_radius(pos, 10)) do
						-- 0.4.x compatibility:
						if obj:get_player_name() ~= nil and obj:get_player_name() ~= "" then
							local distance = vector.length(vector.subtract(obj:get_pos(), pos))
							if distance < closest_d then
								closest_d = distance
								closest_name = obj:get_player_name()
							end
						end
					end
					minetest.chat_send_all(tostring(closest_name))
					teleporter.teleport(minetest.get_player_by_name(closest_name), pos, tp.pos)
				end
			end
			meta:set_int("stage", 2)
		elseif meta:get_int("stage") == 2 then
			formspec = "size[6,8]anchor[0.5,0.5]label[0,0;Teleporter]button[3,0;2,1;refresh;Refresh]scrollbar[5.7,0;0.3,8;vertical;dests;0.1]scroll_container[0, 0;4, 6;dests;vertical;0.1]"
			local i = 0
			for j, tp in pairs(teleporter.teleporters) do
				i = i + 1
				minetest.chat_send_all("list teleporter " .. tostring(tp.name))
				minetest.chat_send_all("adding teleporter: " .. tostring(tp.name) .. " to list")
				button = "button[0, " .. i .. ";5, 1;" .. tostring(tp.name) .. ";" .. tostring(tp.name) .. "]"
				formspec = formspec .. button
			end
			formspec = formspec .. "scroll_container_end[]"
			minetest.chat_send_all("finished editing formspec: \n" .. tostring(formspec))
			meta:set_string("formspec", formspec)
			meta:set_int("stage", 3)
		else
			meta:set_int("stage", 2)
		end
	end,
	on_destruct = function(pos)
		local meta = minetest.get_meta(pos)
		local name = meta:get_string("tname")
		teleporter.teleporters[name] = nil
		minetest.set_node({x = pos.x, y = pos.y + 1, z = pos.z}, {name="air"})
	end,
})

--[[
	on_rightclick = function(pos, clicker)
		local closest_d = 999
		local closest_name

		for i, obj in ipairs(minetest.get_objects_inside_radius(pos, 10)) do
			-- 0.4.x compatibility:
			if obj:get_player_name() ~= nil and obj:get_player_name() ~= "" then
				local distance = vector.length(vector.subtract(obj:get_pos(), pos))
				if distance < closest_d then
					closest_d = distance
					closest_name = obj:get_player_name()
				end
			end
		end
		minetest.chat_send_all(tostring(closest_name))
		teleporter.teleport(minetest.get_player_by_name(closest_name), pos, {x = pos.x, y = pos.y + 5, z = pos.z})
	end,
]]--

minetest.register_node("teleporter:teleporter_top", {
	description = "Teleporter Top (you hacker you)",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {
		{name = "teleporter_top.png",},
		{name = "teleporter_top.png",},
		{name = "teleporter_side.png",},
		{name = "teleporter_side.png",},
		{name = "teleporter_side.png",},
		{name = "teleporter_side.png",},
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0.4375, 0.5, 0.5, 0.5},
			{-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5},
			{0.4375, -0.5, -0.5, 0.5, 0.5, 0.5},
			{-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5},
		}
	},
	drawtype = "nodebox",
	walkable = true,
	climbable = false,
	diggable = false,
	sunlight_propagates = true,
	groups = {cracky=2, not_in_creative_inventory=1,},
})

minetest.register_node("teleporter:teleporter_closed", {
	description = "Teleporter Closed (you hacker you!)",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {
		{name = "teleporter_top.png",},
		{name = "teleporter_top.png",},
		{name = "teleporter_side.png",},
		{name = "teleporter_side.png",},
		{name = "teleporter_side.png",},
		{name = "teleporter_side.png",},
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0.4375, 0.5, 0.5, 0.5},
			{-0.5, -0.5, -0.5, 0.5, 0.5, -0.4375},
			{-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5},
			{0.4375, -0.5, -0.5, 0.5, 0.5, 0.5},
			{-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
		}
	},
	drawtype = "nodebox",
	walkable = true,
	climbable = false,
	diggable = false,
	sunlight_propagates = true,
	groups = {cracky=2, not_in_creative_inventory=1,},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0.4375, 0.5, 1.5, 0.5},
			{-0.5, -0.5, -0.5, 0.5, 1.5, -0.4375},
			{-0.5, -0.5, -0.5, -0.4375, 1.5, 0.5},
			{0.4375, -0.5, -0.5, 0.5, 1.5, 0.5},
			{-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
		}
	},
})

minetest.register_node("teleporter:teleporter_top_closed", {
	description = "Teleporter Top Closed (you hacker you!)",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {
		{name = "teleporter_top.png",},
		{name = "teleporter_top.png",},
		{name = "teleporter_side.png",},
		{name = "teleporter_side.png",},
		{name = "teleporter_side.png",},
		{name = "teleporter_side.png",},
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0.4375, 0.5, 0.5, 0.5}, -- NodeBox1
			{-0.5, -0.5, -0.5, 0.5, 0.5, -0.4375}, -- NodeBox2
			{-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5}, -- NodeBox3
			{0.4375, -0.5, -0.5, 0.5, 0.5, 0.5}, -- NodeBox4
			{-0.5, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox5
		}
	},
	drawtype = "nodebox",
	walkable = true,
	climbable = false,
	diggable = false,
	sunlight_propagates = true,
	groups = {cracky=2, not_in_creative_inventory=1,},
})

--[[
on_receive_fields = function(pos, formname, fields, player)
		if fields.quit then
			return
		end
		local meta = minetest.get_meta(pos)
		if fields.name ~= nil and fields.save ~= nil then
			meta:set_string("infotext", fields.name)
		end
		if fields.tp ~= nil then
			teleporter.teleport(player, pos, {x = pos.x, y = pos.y + 5, z = pos.z})
		end
	end,

meta:set_string("formspec", "size[5,5]anchor[0.5,0.5]label[0,0;Teleporter]field[0,0;Dest Name;dest;name]label[3,0;" .. tostring(pos.x) .. ", " .. tostring(pos.y) .. ", " .. tostring(pos.z) .. "]button[1, 0.5;3, 1;tp;Go To Station]button[0.5, 3;1.5, 1;save;Save]button_exit[2.5,3;1.5,1;exit;Exit]")
]]--



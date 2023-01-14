-- Metals for Minetest >= 0.4.17

local modpath = minetest.get_modpath("teleporter")

teleporter = {}

function teleporter.teleport(player, from_pos, to_pos)
	if player ~= nil then
		local node = minetest.get_node(from_pos)
		local facedir = node.param2
		minetest.sound_play({name = "teleporter_door", gain = 1.0}, parameters)
		minetest.swap_node(from_pos, {name="teleporter:teleporter_closed", param2 = facedir})
		minetest.swap_node({x = from_pos.x, y = from_pos.y + 1, z = from_pos.z}, {name="teleporter:teleporter_top_closed", param2 = facedir})
		player:set_pos(from_pos)
		tp_st = minetest.sound_play({name = "teleporter_start", gain = 2.0}, parameters)
		minetest.after(8, function()
			player:set_pos(to_pos)
			minetest.sound_stop(tp_st)
			minetest.sound_play({pos = to_pos, name = "teleporter_door", gain = 1.0}, parameters)
			minetest.sound_play({pos = from_pos, name = "teleporter_door", gain = 1.0}, parameters)
			minetest.swap_node(from_pos, {name="teleporter:teleporter", param2 = facedir})
			minetest.swap_node({x = from_pos.x, y = from_pos.y + 1, z = from_pos.z}, {name="teleporter:teleporter_top", param2 = facedir})
		end)
	end
end

teleporter.teleporters = {}

-- 	["default"] = {pos = {x = 0, y = 0, z = 0}, name = "default"}
--minetest.chat_send_all("tlprtr pos.x : " .. tostring(teleporter.teleporters["default"].pos.x))

dofile(modpath .. "/teleporter.lua")
dofile(modpath .. "/base_port.lua")

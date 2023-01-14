minetest.register_node("chess:ai_pawn", {
	description = "Ai Pawn",
	paramtype = "light",
	walkable = true,
	climbable = false,
	sunlight_propagates = true,
	groups = {cracky=3},
	tiles = {
		"my_mod_ruby_block.png",
		"my_mod_ruby_block.png",
		"my_mod_ruby_block.png",
		"my_mod_ruby_block.png",
		"my_mod_ruby_block.png",
		"my_mod_ruby_block.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125, -0.5, -0.3125, 0.3125, -0.4375, 0.3125}, -- NodeBox1
			{-0.1875, -0.5, -0.1875, 0.1875, 0.25, 0.1875}, -- NodeBox2
			{-0.125, 0.1875, -0.125, 0.125, 0.375, 0.125}, -- NodeBox3
			{-0.125, 0.375, -0.125, 0.125, 0.5, 0.125}, -- NodeBox4
		}
	},
	on_construct = function(pos, placer)
		local meta = minetest.get_meta(pos)
		meta:set_string("infotext", "Owner: " .. meta:get_string("owner"))
		if placer then
			meta:set_string("infotext", "Owner: " .. placer:get_player_name())
		end
	end,
	on_rightclick = function(pos)
		local timer = minetest.get_node_timer(pos)
		timer:start(0.1)
	end,
	on_timer = function(pos)
		minetest.chat_send_all(pos.x .. pos.y .. pos.z)
		if minetest.find_node_near(pos, 10, "chess:light_ai_pawn") ~= nil then
			local maxfar = 10
			local posf = {x = pos.x, y = pos.y, z = pos.z - 1} --this is set up so that red is facing -Z (testing and schematic)
			local posfu = {x = pos.x, y = pos.y + 1, z = pos.z - 1}
			local posfd = {x = pos.x, y = pos.y - 1, z = pos.z - 1}
			local posb = {x = pos.x, y = pos.y - 1, z = pos.z}
			local poslf = {x = pos.x - 1, y = pos.y, z = pos.z - 1}
			local posrf = {x = pos.x + 1, y = pos.y, z = pos.z - 1}
			local poslfd = {x = pos.x - 1, y = pos.y - 1, z = pos.z - 1}
			local posrfd = {x = pos.x + 1, y = pos.y - 1, z = pos.z - 1}
			if minetest.get_node(posf).name == "chess:light_ai_pawn" then
				minetest.chat_send_all("Enemy at: Front (Blocked)")
			end
			if minetest.get_node(poslf).name == "chess:light_ai_pawn" then
				minetest.chat_send_all("Enemy at: Right-Side (Attacking)")
				minetest.set_node(poslf, {name = "chess:ai_pawn"})
				local timerlf = minetest.get_node_timer(poslf)
				timerlf:start(1)
				minetest.set_node(pos, {name = "air"})
				return true
			elseif minetest.get_node(posrf).name == "chess:light_ai_pawn" then
				minetest.chat_send_all("Enemy at: Left-Side (Attacking)")
				minetest.set_node(posrf, {name = "chess:ai_pawn"})
				local timerrf = minetest.get_node_timer(posrf)
				timerrf:start(1)
				minetest.set_node(pos, {name = "air"})
				return true
			else
				if minetest.get_node(poslfd).name == "chess:light_ai_pawn" then
					minetest.chat_send_all("Enemy at: Right-Side Down (Attacking)")
					minetest.set_node(poslfd, {name = "chess:ai_pawn"})
					local timerlfd = minetest.get_node_timer(poslfd)
					timerlfd:start(1)
					minetest.set_node(pos, {name = "air"})
					return true
				elseif minetest.get_node(posrfd).name == "chess:light_ai_pawn" then
					minetest.chat_send_all("Enemy at: Left-Side Down (Attacking)")
					minetest.set_node(posrfd, {name = "chess:ai_pawn"})
					local timerrfd = minetest.get_node_timer(posrfd)
					timerrfd:start(1)
					minetest.set_node(pos, {name = "air"})
					return true
				else
					if minetest.get_node(posfd).name == "chess:light_ai_pawn" then
						minetest.chat_send_all("Enemy at: Beyond (Attacking)")
						minetest.set_node(posfd, {name = "chess:ai_pawn"})
						local timerfd = minetest.get_node_timer(posfd)
						timerfd:start(1)
						minetest.set_node(pos, {name = "air"})
						return true
					elseif minetest.get_node(posb).name == "air" then
						minetest.chat_send_all("Enemy at: Beyond (Falling)")
						minetest.set_node(posb, {name = "chess:ai_pawn"})
						local timerb = minetest.get_node_timer(posb)
						timerb:start(1)
						minetest.set_node(pos, {name = "air"})
						return true
					elseif minetest.get_node(posf).name == "air" then
						minetest.chat_send_all("Enemy at: Beyond (Moving)")
						minetest.set_node(posf, {name = "chess:ai_pawn"})
						local timerf = minetest.get_node_timer(posf)
						timerf:start(1)
						minetest.set_node(pos, {name = "air"})
						return true
					elseif minetest.get_node(posfu).name == "air" then
						minetest.chat_send_all("Enemy at: Beyond (Climbing)")
						minetest.set_node(posfu, {name = "chess:ai_pawn"})
						local timerfu = minetest.get_node_timer(posfu)
						timerfu:start(1)
						minetest.set_node(pos, {name = "air"})
						return true
					end
				end
			end
			return true
		end
		return true
	end
})

minetest.register_node("chess:light_ai_pawn", {
	description = "Light Ai Pawn",
	paramtype = "light",
	walkable = true,
	climbable = false,
	sunlight_propagates = true,
	groups = {cracky=3},
	tiles = {
		"my_mod_sapphire_block.png",
		"my_mod_sapphire_block.png",
		"my_mod_sapphire_block.png",
		"my_mod_sapphire_block.png",
		"my_mod_sapphire_block.png",
		"my_mod_sapphire_block.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125, -0.5, -0.3125, 0.3125, -0.4375, 0.3125}, -- NodeBox1
			{-0.1875, -0.5, -0.1875, 0.1875, 0.25, 0.1875}, -- NodeBox2
			{-0.125, 0.1875, -0.125, 0.125, 0.375, 0.125}, -- NodeBox3
			{-0.125, 0.375, -0.125, 0.125, 0.5, 0.125}, -- NodeBox4
		}
	},
	on_construct = function(pos, placer)
		local meta = minetest.get_meta(pos)
		meta:set_string("infotext", "Owner: " .. meta:get_string("owner"))
		if placer then
			meta:set_string("infotext", "Owner: " .. placer:get_player_name())
		end
	end,
	on_rightclick = function(pos)
		local timer = minetest.get_node_timer(pos)
		timer:start(0.1)
	end,
	on_timer = function(pos)
		minetest.chat_send_all(pos.x .. pos.y .. pos.z)
		if minetest.find_node_near(pos, 10, "chess:ai_pawn") ~= nil then
			local maxfar = 10
			local posf = {x = pos.x, y = pos.y, z = pos.z + 1} --this is set up so that red is facing -Z (testing and schematic)
			local poslf = {x = pos.x - 1, y = pos.y, z = pos.z + 1}
			local posrf = {x = pos.x + 1, y = pos.y, z = pos.z + 1}
			if minetest.get_node(posf).name == "chess:ai_pawn" then
				minetest.chat_send_all("Enemy at: Front (Blocked)")
			end
			if minetest.get_node(poslf).name == "chess:ai_pawn" then
				minetest.chat_send_all("Enemy at: Side (Attacking)")
				minetest.set_node(poslf, {name = "chess:light_ai_pawn"})
				local timerlf = minetest.get_node_timer(poslf)
				timerlf:start(1)
				minetest.set_node(pos, {name = "air"})
				return true
			else
				if minetest.get_node(posrf).name == "chess:ai_pawn" then
					minetest.chat_send_all("Enemy at: Side (Attacking)")
					minetest.set_node(posrf, {name = "chess:light_ai_pawn"})
					local timerrf = minetest.get_node_timer(posrf)
					timerrf:start(1)
					minetest.set_node(pos, {name = "air"})
					return true
				else
					if minetest.get_node(posf).name == "air" then
						minetest.chat_send_all("Enemy at: Beyond (Moving)")
						minetest.set_node(posf, {name = "chess:light_ai_pawn"})
						local timerf = minetest.get_node_timer(posf)
						timerf:start(1)
						minetest.set_node(pos, {name = "air"})
						return true
					end
				end
			end
			return true
		end
		return true
	end
})

--on_receive_fields = function(pos, formname, fields, player)


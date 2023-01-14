
--[[local hud = function(player)
	local idx = player:hud_add({
	     hud_elem_type = "text",
	     position      = {x = 0.5, y = 0.5},
	     offset        = {x = 0, y = 0},
	     text          = "First HUD Element",
	     alignment     = {x = 0, y = 0},  -- center aligned
	     scale         = {x = 100, y = 100}, -- covered later
	})
end

minetest.register_node("scoreboard:scoretest", {
	description = "Test Block",
	drawtype = "normal",
	tiles = "default_diamond_block.png",
	groups = {cracky=2},
	on_rightclick = function(pos, clicker)
		hud(clicker)
		return
	end,
})]]
local player = minetest.get_player_by_name("singleplayer")
print(type(player))
minetest.chat_send_all(type(player))
print(type(player))
print(type(player))
print(type(player))
print(type(player))
print(type(player))
print(type(player))
print(type(player))
--[[local idx = player:hud_add({
     hud_elem_type = "text",
     position      = {x = 0.5, y = 0.5},
     offset        = {x = 0,   y = 0},
     text          = "Hello world!",
     alignment     = {x = 0, y = 0},  -- center aligned
     scale         = {x = 100, y = 100}, -- covered later
})]]

--[[minetest.on_joinplayer = function(player)
	local idx = player:hud_add({
		hud_elem_type = "text",
		position      = {x = 0.5, y = 0.5},
		offset        = {x = 0, y = 0},
		text          = "First HUD Element",
		alignment     = {x = 0, y = 0},  -- center aligned
		scale         = {x = 100, y = 100}, -- covered later
	})
end]]


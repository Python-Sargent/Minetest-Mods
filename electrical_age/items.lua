minetest.register_craftitem("eln:multimeter", {
	description = "Multimeter",
	inventory_image = "eln_multimeter.png",
	on_place = function(itemstack, user, pointed_thing)
		if pointed_thing ~= nil then
			local meta = minetest.get_meta({x = pointed_thing.above.x, y = pointed_thing.above.y - 1, z = pointed_thing.above.z})
			minetest.chat_send_player(user:get_player_name(), "Volts: " .. meta:get_int("vlt"))
			minetest.chat_send_player(user:get_player_name(), "Amps: " .. meta:get_int("crt"))
			minetest.chat_send_player(user:get_player_name(), "Ohms: " .. meta:get_int("rst"))
			minetest.chat_send_player(user:get_player_name(), "Power Type: " .. meta:get_string("pwt"))
			minetest.chat_send_player(user:get_player_name(), "Resin Level: " .. meta:get_int("rlv"))
		end
		return nil
	end
})

minetest.register_craftitem("eln:rubber", { --cook resin to get rubber
	description = "Rubber",
	inventory_image = "eln_rubber.png"
})

minetest.register_craftitem("eln:pipe", { --cook resin to get rubber
	description = "Mining Pipe",
	inventory_image = "eln_pipe.png"
})

minetest.register_craftitem("eln:drill", { --cook resin to get rubber
	description = "Mining Drill",
	inventory_image = "eln_drill.png"
})

minetest.register_craftitem("eln:silicon_dust", { --macerate sand to get silicon dust
	description = "Silicon Dust",
	inventory_image = "eln_silicon_dust.png"
})

minetest.register_craftitem("eln:silicon_ingot", { --cook silicon dust to get silicon ingot
	description = "Silicon Ingot",
	inventory_image = "eln_silicon_ingot.png"
})

minetest.register_craftitem("eln:coal_dust", { --macerate coal to get coal dust
	description = "Coal Dust",
	inventory_image = "eln_coal_dust.png"
})

minetest.register_craftitem("eln:steel_dust", { --macerate steel to get steel dust
	description = "Steel Dust",
	inventory_image = "eln_steel_dust.png"
})

minetest.register_craftitem("eln:copper_dust", { --macerate copper to get copper dust
	description = "Copper Dust",
	inventory_image = "eln_copper_dust.png"
})

minetest.register_craftitem("eln:copper_plate", { --plate copper to get copper plate
	description = "Copper Plate",
	inventory_image = "eln_copper_plate.png"
})

minetest.register_craftitem("eln:copper_lump", { --mine copper ore to get copper lump
	description = "Copper Lump",
	inventory_image = "eln_copper_lump.png"
})

minetest.register_craftitem("eln:copper_ingot", { --cook copper lump to get copper ingot
	description = "Copper Ingot",
	inventory_image = "eln_copper_ingot.png"
})

minetest.register_craftitem("eln:alloy_dust", { --combine coal dust, steel dust, and tungsten dust to get alloy dust
	description = "Alloy Dust",
	inventory_image = "eln_alloy_dust.png"
})

minetest.register_craftitem("eln:alloy_plate", { --plate alloy ingot to get alloy plate
	description = "Alloy Plate",
	inventory_image = "eln_alloy_plate.png"
})

minetest.register_craftitem("eln:alloy_ingot", { --cook alloy dust to get alloy ingot
	description = "Alloy Ingot",
	inventory_image = "eln_alloy_ingot.png"
})

minetest.register_craftitem("eln:tungsten_dust", { --macerate tungsten ingot to get tungsten dust
	description = "Tungsten Dust",
	inventory_image = "eln_tungsten_dust.png"
})

minetest.register_craftitem("eln:tungsten_plate", { --plate tungsten ingot to tungsten plate
	description = "Tungsten Plate",
	inventory_image = "eln_tungsten_plate.png"
})

minetest.register_craftitem("eln:tungsten_lump", { --mine tungsten ore to get tungsten lump
	description = "Tungsten Lump",
	inventory_image = "eln_tungsten_lump.png"
})

minetest.register_craftitem("eln:tungsten_ingot", { --cook tungsten lump to get tungsten ingot
	description = "Tungsten Ingot",
	inventory_image = "eln_tungsten_ingot.png"
})

minetest.register_craftitem("eln:lead_dust", { --macerate lead ingot to get lead dust
	description = "Lead Dust",
	inventory_image = "eln_lead_dust.png"
})

minetest.register_craftitem("eln:lead_plate", { --plate lead ingot to et lead plate
	description = "Lead Plate",
	inventory_image = "eln_lead_plate.png"
})

minetest.register_craftitem("eln:lead_lump", { --mine lead ore to get lead lump
	description = "Lead Lump",
	inventory_image = "eln_lead_lump.png"
})

minetest.register_craftitem("eln:lead_ingot", { --cook lead lump to get lead ingot
	description = "Lead Ingot",
	inventory_image = "eln_lead_ingot.png"
})

minetest.register_craftitem("eln:titanium_dust", { --macerate titanium to get titanium dust
	description = "Copper Dust",
	inventory_image = "eln_titanium_dust.png"
})

minetest.register_craftitem("eln:titanium_plate", { --plate titanium ingot to get titanium plate
	description = "Copper Plate",
	inventory_image = "eln_titanium_plate.png"
})

minetest.register_craftitem("eln:titanium_lump", { --mine titanium ore to get titanium lump
	description = "Copper Lump",
	inventory_image = "eln_titanium_lump.png"
})

minetest.register_craftitem("eln:titanium_ingot", { --cook titanium lump to get titanium ingot
	description = "Copper Ingot",
	inventory_image = "eln_titanium_ingot.png"
})

minetest.register_craftitem("eln:copper_strip", { --combine copper ingot, copper ingot, copper ingot,, copper ingot, copper ingot, and copper ingot to get copper strip
	description = "Copper Strip",
	inventory_image = "eln_copper_strip.png"
})

minetest.register_craftitem("eln:resin", { --use collector to get resin
	description = "Resin",
	inventory_image = "eln_resin.png"
})

minetest.register_craft( {
	output = "eln:multimeter",
	recipe = {
		{ "eln:rubbber", "default:glass", "eln:rubbber" },
		{ "eln:rubbber", "eln:copper", "eln:rubbber" },
		{ "eln:rubbber", "eln:wire", "eln:rubbber" },
	},
})

minetest.register_craft( {
	output = "eln:wire 6",
	recipe = {
		{ "", "eln:rubber", "" },
		{ "", "eln:copper_strip", "" },
	},
})

minetest.register_craft( {
	type = "cooking",
	output = "eln:rubber",
	recipe = "eln:resin",
})

minetest.register_craft( {
	type = "cooking",
	output = "eln:silicon_ingot",
	recipe = "eln:silicon_dust",
})

minetest.register_craft( {
	type = "cooking",
	output = "eln:copper_ingot",
	recipe = "eln:copper_lump",
})

minetest.register_craft( {
	type = "cooking",
	output = "eln:tungsten_ingot",
	recipe = "eln:tungsten_lump",
})

minetest.register_craft( {
	type = "cooking",
	output = "eln:lead_ingot",
	recipe = "eln:lead_lump",
})

minetest.register_craft({
	type = "fuel",
	recipe = "eln:coal_dust",
	burntime = 10,
})

minetest.register_craft( {
	output = "eln:wire 6",
	recipe = {
		{ "eln:rubber", "eln:rubber", "eln:rubber" },
		{ "eln:copper", "eln:copper", "eln:copper" },
		{ "eln:rubber", "eln:rubber", "eln:rubber" },
	},
})

minetest.register_craft( {
	output = "eln:pipe 3",
	recipe = {
		{ "", "eln:alloy_ingot", "" },
		{ "", "eln:alloy_ingot", "" },
		{ "", "eln:alloy_ingot", "" },
	},
})

minetest.register_craft( {
	output = "eln:collector",
	recipe = {
		{ "group:wood", "group:wood", "group:wood" },
		{ "", "group:wood", "group:wood" },
	},
})

minetest.register_craft( {
	output = "eln:cpper_strip 6",
	recipe = {
		{ "eln:copper", "eln:copper", "eln:copper" },
	},
})
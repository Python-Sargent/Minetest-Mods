macerator = {}

local S = eln.intllib

macerator.known_materials = {
	{"eln:tungsten_ingot", "tungsten"},
	{"eln:alloy_ingot", "alloy"},
	{"eln:copper_ingot", "copper"},
	{"default:coal_lump", "coal"},
	{"default:steel_ingot", "steel"},
	{"default:sand", "silicon"},
}

function macerator:get_output_inv(material, amount)
	local list = {}
	local pos = #list

	local material_name = "eln" .. ":" .. material .. "_dust"
	minetest.chat_send_all(material_name)
	if minetest.registered_items[material_name] then
		list[pos] = material_name .. " " .. amount
	end
	return list
end

-- Reset empty macerator after last full block has been taken out
-- (or the macerator has been placed the first time)
function macerator:reset(pos)
	local meta = minetest.get_meta(pos)
	local inv  = meta:get_inventory()

	inv:set_list("input",  {})
	meta:set_string("infotext",
			S("Macerator is empty (owned by %s)")
			:format(meta:get_string("owner") or ""))
end


-- Player has taken something out of the box or placed something inside
function macerator:update_inventory(pos, amount)
	local meta          = minetest.get_meta(pos)
	local inv           = meta:get_inventory()

	local stack = inv:get_stack("input",  1) -- At least one "normal" block is necessary.
	if stack:is_empty() then
		self:reset(pos)
		return
	end
	local mat_name = stack:get_name() or ""
	minetest.chat_send_all(mat_name)
	for mat=1, #macerator.known_materials do
		local matte = macerator.known_materials[mat] or ""
		if matte[1] == mat_name then
			material = matte[2] or ""
		end
	end
	minetest.chat_send_all(material)

	if modname == "default" then
		modname = "eln"
	end

	-- Display:
	inv:set_list("output", self:get_output_inv(material, amount))

	meta:set_string("infotext",
			S("Macerator is working (owned by %s)")
			:format(material, meta:get_string("owner") or ""))
end

-- Moving the inventory of the macerator around is not allowed because it
-- is a fictional inventory. Moving inventory around would be rather
-- impractical and make things more difficult to calculate:
function macerator.allow_metadata_inventory_move(pos, from_list, from_index, to_list, to_index, count, player)
	return 0
end


-- Only input is a input slot:
function macerator.allow_metadata_inventory_put(pos, listname, index, stack, player)
	-- The player is not allowed to put something in there:
	if listname == "output" then
		return 0
	end

	local meta = minetest.get_meta(pos)
	local inv  = meta:get_inventory()
	local stackname = stack:get_name()
	local count = stack:get_count()

	-- Only accepts 'put' if there are no blocks in 'input':
	if listname == "input" then
		if not inv:is_empty("input") then
			if inv:get_stack("input", index):get_name() ~= stackname then
				return 0
			end
		end
		return count
	end
end

function macerator.on_metadata_inventory_put(pos, listname, index, stack, player)
	-- We need to find out if the macerator is already set to a
	-- specific material or not:
	local meta = minetest.get_meta(pos)
	local inv  = meta:get_inventory()
	local stackname = stack:get_name()
	local count = stack:get_count()

	-- Putting something into the input slot is only possible if it has
	-- been empty before or contained something of the same material:
	if listname == "input" then
		macerator:update_inventory(pos, 1 * count)
	end
end

function macerator.allow_metadata_inventory_take(pos, listname, index, stack, player)
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	local input_stack = inv:get_stack(listname,  index)
	local player_inv = player:get_inventory()
	if not player_inv:room_for_item("main", input_stack) then
		return 0
	else return stack:get_count()
	end
end

function macerator.on_metadata_inventory_take(pos, listname, index, stack, player)
	-- Prevent (inbuilt) swapping between inventories with different blocks
	-- corrupting player inventory or macerator with 'unknown' items.
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	local input_stack = inv:get_stack(listname,  index)
	if not input_stack:is_empty() and input_stack:get_name() ~= stack:get_name() then
		local player_inv = player:get_inventory()
		if player_inv:room_for_item("main", input_stack) then
			player_inv:add_item("main", input_stack)
		end
		macerator:reset(pos)
		return
	end
end

function macerator.on_construct(pos)
	local meta = minetest.get_meta(pos)
	local fancy_inv = default.gui_bg..default.gui_bg_img..default.gui_slots
	meta:set_string("formspec",
        "size[8,6]"..fancy_inv..
		"label[1.0,0.0;Input Material]" ..
		"list[current_name;input;3.0,0.0;1,1;]" ..
		"list[current_name;output;4.0,0.0;8,6;]" ..
		"list[current_player;main;0.0,2.0;8,4;]" ..
		"listring[current_name;output]" ..
		"listring[current_player;main]" ..
		"listring[current_name;input]" ..
		"listring[current_player;main]"
	)
	meta:set_string("infotext", S("Macerator is empty"))

	local inv = meta:get_inventory()
	inv:set_size("input", 1)    -- Input slot for ingots and stuff.
	inv:set_size("output", 1) -- dust or somthing.

	macerator:reset(pos)
end


function macerator.can_dig(pos,player)
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	if not inv:is_empty("input") then
		return false
	end
	-- Can be dug by anyone when empty, not only by the owner:
	return true
end

minetest.register_node("eln:macerator",  {
	description = S("Macerator"),
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.1875, -0.3125, 0.375, 0.1875}, -- SideFrame
			{0.3125, -0.5, -0.1875, 0.5, 0.375, 0.1875}, -- SideFrame2
			{-0.375, 0.125, -0.25, 0.375, 0.4375, -0.125}, -- GearCraddle
			{-0.375, 0.125, 0.125, 0.375, 0.4375, 0.25}, -- GearCraddle2
			{-0.375, 0.25, -0.25, 0.375, 0.3125, 0}, -- GearShaft
			{-0.375, 0.25, 0, 0.375, 0.3125, 0.25}, -- GearShaft2
			{-0.3125, 0.25, 0, -0.25, 0.4375, 0.0625}, -- GearTooth
			{-0.1875, 0.25, 0.0625, -0.125, 0.4375, 0.125}, -- GearTooth2
			{-0.0625, 0.25, 0, 0, 0.4375, 0.0625}, -- GearTooth3
			{0.0625, 0.25, 0.0625, 0.125, 0.4375, 0.125}, -- GearTooth4
			{0.1875, 0.25, 0, 0.25, 0.4375, 0.0625}, -- GearTooth5
			{0.25, 0.25, -0.125, 0.3125, 0.4375, -0.0625}, -- GearTooth10
			{0.0625, 0.25, -0.0625, 0.125, 0.4375, 0}, -- GearTooth11
			{-0.0625, 0.25, -0.125, 0, 0.4375, -0.0625}, -- GearTooth12
			{-0.1875, 0.25, -0.0625, -0.125, 0.4375, 0}, -- GearTooth13
			{-0.3125, 0.25, -0.125, -0.25, 0.4375, -0.0625}, -- GearTooth14
			{-0.375, 0.25, -0.25, -0.3125, 0.4375, 0.25}, -- SideWall
			{0.3125, 0.25, -0.25, 0.375, 0.4375, 0.25}, -- SideWall2
			{-0.375, -0.25, -0.1875, 0.375, -0.1875, 0.1875}, -- DropPlate
			{-0.375, -0.5, -0.0625, 0.375, -0.4375, 0.0625}, -- PowerCable
		}
	},
	tiles = {"moreblocks_macerator_top.png",
		"moreblocks_macerator_bottom.png",
		"moreblocks_macerator_side.png"},
	paramtype = "light",
	sunlight_propagates = true,
	paramtype2 = "facedir",
	groups = {cracky=3},
	--sounds = default.node_sound_stone_defaults(),
	on_construct = macerator.on_construct,
	can_dig = macerator.can_dig,
	-- Set the owner of this circular saw.
	after_place_node = function(pos, placer)
		local meta = minetest.get_meta(pos)
		local owner = placer and placer:get_player_name() or ""
		meta:set_string("owner",  owner)
		meta:set_string("infotext",
				S("Macerator is empty (owned by %s)")
				:format(owner))
	end,

	on_receive_fields = macerator.on_receive_fields,
	allow_metadata_inventory_move = macerator.allow_metadata_inventory_move,
	-- Only input- and recycle-slot are intended as input slots:
	allow_metadata_inventory_put = macerator.allow_metadata_inventory_put,
	allow_metadata_inventory_take = macerator.allow_metadata_inventory_take,
	-- Taking is allowed from all slots (even the internal microblock slot). Moving is forbidden.
	-- Putting something in is slightly more complicated than taking anything because we have to make sure it is of a suitable material:
	on_metadata_inventory_put = macerator.on_metadata_inventory_put,
	on_metadata_inventory_take = macerator.on_metadata_inventory_take,
})
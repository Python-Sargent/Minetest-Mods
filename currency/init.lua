currency = {}

currency.exchange_rate = 10 --$N = 1 piece of mese

currency.max_inflation = 20 -- +/- N dollars

--minetest.on_join_newplayer = function(player)
--	currency.exchange_rate = currency.exchange_rate + (currency.exchange_rate / currency.max_inflation)
--end

modpath = minetest.get_modpath("currency")

minetest.register_craftitem("currency:dollar", {
	description = "Dollar",
	inventory_image = "currency_dollar.png"
})

minetest.register_craftitem("currency:hundred_dollar", {
	description = "Hundred Dollars",
	inventory_image = "currency_hundred_dollar.png"
})

minetest.register_craftitem("currency:thousand_dollar", {
	description = "Thousand Dollars",
	inventory_image = "currency_thousand_dollar.png"
})

--[[minetest.register_craftitem("currency:one", {
	description = "One",
	inventory_image = "currency_one.png"
})

minetest.register_craftitem("currency:five", {
	description = "Five",
	inventory_image = "currency_five.png"
})

minetest.register_craftitem("currency:ten", {
	description = "Ten",
	inventory_image = "currency_ten.png"
})

minetest.register_craftitem("currency:twenty", {
	description = "Twenty",
	inventory_image = "currency_twenty.png"
})

minetest.register_craftitem("currency:fifty", {
	description = "Fifty",
	inventory_image = "currency_fifty.png"
})

minetest.register_craftitem("currency:hundred", {
	description = "One Hundred",
	inventory_image = "currency_hundred.png"
})

local function can_dig(pos, player)
	local meta = minetest.get_meta(pos);
	local inv = meta:get_inventory()
	return inv:is_empty("input")
end

local function allow_metadata_inventory_put(pos, listname, index, stack, player)
	if minetest.is_protected(pos, player:get_player_name()) then
		return 0
	end
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	if listname == "input" then
		if currency.convert_cash({items={stack}}).time ~= 0 then
			return stack:get_count()
		else
			return 0
		end
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

currency.cash = {
	["currency:one"] = {one={takes="currency:one", gains="currency:one"},
				five={takes="currency:one 5", gains="currency:five"},
				ten={takes="currency:one 10", gains="currency:ten"},
				twenty={takes="currency:one 20", gains="currency:twenty"},
				fifty={takes="currency:one 50", gains="currency:fifty"},
				hundred={takes="currency:one 100", gains="currency:hundred"}},
	["currency:five"] = {one={takes="currency:five", gains="currency:one 5"},
				five={takes="currency:five", gains="currency:five"},
				ten={takes="currency:five 2", gains="currency:ten"},
				twenty={takes="currency:five 4", gains="currency:twenty"},
				fifty={takes="currency:five 10", gains="currency:fifty"},
				hundred={takes="currency:one five 20", gains="currency:hundred"}},
	["currency:ten"] = {one={takes="currency:ten", gains="currency:one 10"},
				five={takes="currency:ten", gains="currency:five 2"},
				ten={takes="currency:ten", gains="currency:ten"},
				twenty={takes="currency:ten 2", gains="currency:twenty"},
				fifty={takes="currency:ten 5", gains="currency:fifty"},
				hundred={takes="currency:ten 10", gains="currency:hundred"}},
	["currency:twenty"] = {one={takes="currency:twenty", gains="currency:one 20"},
				five={takes="currency:twenty", gains="currency:five"},
				ten={takes="currency:twenty", gains="currency:ten"},
				twenty={takes="currency:twenty", gains="currency:twenty"},
				fifty={takes="currency:twenty", gains="currency:twenty"},
				hundred={takes="currency:twenty 100", gains="currency:hundred"}},
}

currency.convert_cash = function(items)
	
end

minetest.register_node("currency:bank", {
	description = "Bank",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {
		{name = "currency_bank_top.png",},
		{name = "currency_bank_bottom.png",},
		{name = "currency_bank_side.png",},
		{name = "currency_bank_side.png",},
		{name = "currency_bank_side2.png",},
		{name = "currency_bank_side2.png",},
	},
	drawtype = "normal",
	walkable = true,
	climbable = false,
	sunlight_propagates = false,
	groups = {cracky=3, oddly_breakable_by_hand=1},
	formspec
})]]--

--[[
if minetest.global_exists('unified_inventory') then
	unified_inventory.register_page('currency:bank_page', {
		get_formspec = function(player, data, fs)
			local formspec = {
				---input
				'label[0.5,0.5;Input:]',
				'list[current_player;currency:input;0.5,1;1,1;]',
				'listring[current_player;currency:input]',
				'listring[current_player;main]',
				---output convert lower
				'label[5,0.5;Output (Lower):]',
				'list[current_player;currency:input_low;5,1;1,1;]',
				'listring[current_player;currency:input_low]',
				'listring[current_player;main]',
				---output convert higher
				'label[5,0.5;Output (Higher):]',
				'list[current_player;currency:input_high;3,1;1,1;]',
				'listring[current_player;currency:input_high]',
				'listring[current_player;main]',
			}
		end,
		

		unified_inventory.register_button('currency:bank_page', {
			type = 'image',
			image = "currency_hundred.png",
			tooltip = 'Bank Exchange',
		}),
	})
elseif minetest.global_exists('sfinv') then
	sfinv.register_page('currency:bank_page', {
		title = 'Bank Exchange',
		get = function(this, player, context)
			local formspec = {
				---input
				'label[0.5,0.5;Input:]',
				'list[current_player;currency:input;0.5,1;1,1;]',
				'listring[current_player;currency:input]',
				'listring[current_player;main]',
				---output convert lower
				'label[5,0.5;Output (Lower):]',
				'list[current_player;currency:input_low;5,1;1,1;]',
				'listring[current_player;currency:input_low]',
				'listring[current_player;main]',
				---output convert higher
				'label[5,0.5;Output (Higher):]',
				'list[current_player;currency:input_high;3,1;1,1;]',
				'listring[current_player;currency:input_high]',
				'listring[current_player;main]',
			}
		    	return sfinv.make_formspec(player, context, table.concat(formspec, ''), true)
		end
	})
end
]]--


minetest.register_craftitem("medieval:crocodile_meat", {
	description = "Crocodile Meat",
	inventory_image = "medieval_crocodile_meat.png",
	groups = {food=1, meat=1},
	on_use = function()
		minetest.item_eat(3)
	end
})

minetest.register_craftitem("medieval:cooked_crocodile_meat", {
	description = "Cooked Crocodile Meat",
	inventory_image = "medieval_crocodile_meat_cooked.png",
	groups = {food=1, meat=1},
	on_use = function()
		minetest.item_eat(6)
	end
})

minetest.register_craft({
	type = "cooking",
	output = "medieval:cooked_crocodile_meat",
	recipe = "medieval:crocodile_meat",
})
